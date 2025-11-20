import 'package:bloc/bloc.dart';
import 'package:sales_agent/data/models_api/new_order_post/new_order_model_api.dart';
import 'package:sales_agent/logic/blocs/new_order_post_bloc/new_order_post_event.dart';

import '../../../data/models_api/new_order_post/new_line_model_api.dart';
import '../../../data/models_db/model_db_new_order/new_model_document_id.dart';
import '../../../data/providers/api_provider/order_post_api.dart';
import '../../../data/repositories/new_order_repositori.dart';
import 'new_order_post_state.dart';

class NewOrderPostBloc extends Bloc<NewOrderPostEvent, NewOrderPostState> {
  final OrderPostApi orderPostApi;
  final NewOrderRepository repository;
  final NewModelDocumentId documentId;

  NewOrderPostBloc(this.orderPostApi, this.repository, this.documentId)
      : super(OrderPostInitial()) {
    on<FetchOrderPostData>(_onFetchOrderPostData);
  }

  Future<void> _onFetchOrderPostData(
      FetchOrderPostData event,
      Emitter<NewOrderPostState> emit
      ) async {
    emit(OrderPostLoading());

    try {
      // 1. Загружаем связанные lines из базы Isar
      await event.modelDb.lines.load();

      // 2. Конвертируем lines в формат для API
      final linesForApi = event.modelDb.lines.toList().map((line) {
        return NewLineModelApi(
          assortimentBarcode: line.assortimentBarcode,
          assortimentCode: line.assortimentCode,
          assortimentName: line.assortimentName,
          assortimentUid: line.assortimentUid,
          count: line.count,
          lineNumber: line.lineNumber,
          price: line.price,
          processedCount: line.processedCount,
          sum: line.sum,
          uid: line.uid,
          unitName: line.unitName,
          unitUid: line.unitUid,
        );
      }).toList();

      // 3. Создаём объект для отправки на API
      final orderForApi = NewOrderModelApi(
        clientName: event.modelDb.clientName,
        clientUid: event.modelDb.clientUid,
        code: event.modelDb.code,
        comment: event.modelDb.comment,
        dateProcessed: event.modelDb.dateProcessed,
        dateValid: event.modelDb.dateValid,
        deliveryAddress: event.modelDb.deliveryAddress,
        state: event.modelDb.state,
        stockName: event.modelDb.stockName,
        stockUid: event.modelDb.stockUid,
        sum: event.modelDb.sum,
        uid: event.modelDb.uid,
        linesJson: linesForApi, // Используем сконвертированные lines
      );

      // 4. Отправляем на сервер
      final response = await orderPostApi.postOrder(orderData: orderForApi);

      // 5. Обрабатываем ответ
      if (response.errorCode == 0) {
        // Успешная отправка - обновляем флаг transmit в базе
        event.modelDb.tranmit = true;

        await repository.deleteOrderByTransmit(event.modelDb.tranmit);

        emit(OrderPostLoaded(response));
      } else {
        emit(OrderPostError(response.errorMessage));
      }

    } catch (e) {
      emit(OrderPostError("Ошибка отправки заказа: ${e.toString()}"));
    }
  }
}
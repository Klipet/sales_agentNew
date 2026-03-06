import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:sales_agent/data/models_api/new_order_post/new_order_model_api.dart';
import 'package:sales_agent/logic/blocs/new_order_post_bloc/new_order_post_event.dart';

import '../../../core/utils/convert_data.dart';
import '../../../data/models_api/new_order_post/new_line_model_api.dart';
import '../../../data/models_api/new_order_post/new_order_model_post_response_api.dart';
import '../../../data/providers/api_provider/order_post_api.dart';
import '../../../data/repositories/new_order_repositori.dart';
import 'new_order_post_state.dart';

class NewOrderPostBloc extends Bloc<NewOrderPostEvent, NewOrderPostState> {
  final OrderPostApi orderPostApi;
  final NewOrderRepository repository;

  NewOrderPostBloc(this.orderPostApi, this.repository)
    : super(OrderPostInitial()) {
    on<FetchOrderPostData>(onFetchOrderPostData);
  }

  Future<void> onFetchOrderPostData(
    FetchOrderPostData event,
    Emitter<NewOrderPostState> emit,
  ) async {
    emit(OrderPostLoading());

    try {
      final order = await repository.getOrder(event.idDocument);

      if (order == null) {
        emit(OrderPostError(NewOrderModelPostResponseApi(
          errorCode: 105,
          errorMessage: 'Null Document',
          token: null,
          state: 0,
          uuid: '',
          code: ''
        )));
        return;
      }

      print("📦 Order loaded: id=${order.id}, lines=${order.lines.length}");

      // 1. Конвертируем lines в формат для API
      final linesForApi = order.lines.toList().map((line) {
        return NewLineModelApi(
          assortimentBarcode: line.assortimentBarcode,
          assortimentCode: line.assortimentCode,
          assortimentName: line.assortimentName,
          assortimentUid: line.assortimentUid,
          count: line.count,
          lineNumber: line.lineNumber,
          price: line.priceActie != 0 && line.price > line.priceActie
              ? line.priceActie
              : line.price,
          processedCount: line.processedCount,
          sum: line.sum,
          uid: '00000000-0000-0000-0000-000000000000',
          unitName: line.unitName,
          unitUid: '00000000-0000-0000-0000-000000000000',
        );
      }).toList();

    //  Map<String, dynamic> data = jsonDecode(order.comment);

      // 2. Создаём объект для отправки на API
      final orderForApi = NewOrderModelApi(
        clientName: order.clientName ?? '',
        clientUid: order.clientUid,
        code: order.code,
        comment: order.comment,
        dateProcessed: ConvertData().toDateNetFormat(order.dateProcessed),
        dateValid: ConvertData().toDateNetFormat(order.dateValid),
        deliveryAddress: order.deliveryAddress,
        state: 1,
        stockName: order.stockName ?? '',
        stockUid: '00000000-0000-0000-0000-000000000000',
        sum: order.sum,
        uid: order.uid == '' ? '00000000-0000-0000-0000-000000000000' : order.uid,
        linesJson: linesForApi, // ✅ Передаем List<NewLineModelApi>
      );

      // 3. Отправляем на сервер
      final response = await orderPostApi.postOrder(
        orderData: orderForApi.toJson(),
      );

      print(
        "✅ API Response: errorCode=${response.errorCode}, uuid=${response.uuid}, State = ${response.state}",
      );

      // 4. Обрабатываем ответ
      if (response.errorCode == 0) {
        // Успешная отправка - обновляем uid
        await repository.updateUuidOrder(
          uuid: response.uuid,
          code: response.code,
          orderId: event.idDocument,
          state: response.state,
        ); // ⚠️ Не забудьте сохранить изменения!
        emit(OrderPostLoaded(response));
      } else {
        emit(OrderPostError(response));
      }
    } catch (e, stackTrace) {
      print("❌ ERROR in onFetchOrderPostData: $e");
      print("❌ Stack trace: $stackTrace");
      emit(OrderPostError(NewOrderModelPostResponseApi(
          errorCode: 106,
          errorMessage: 'ERROR in onFetchOrderPostData',
          token: null,
          state: 0,
          uuid: '',
          code: ''
      )));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:sales_agent/data/repositories/new_order_repositori.dart';

import '../../../data/models_db/model_db_new_order/new_model_document_id.dart';
import '../../../data/repositories/new_line_repositori.dart';
import 'new_line_state.dart';

class NewLineCubit extends Cubit<NewLineState> {

  final NewLineRepository ordersRepository;
  final NewOrderRepository newModelDocumentId;

  NewLineCubit(this.ordersRepository, this.newModelDocumentId) : super(NewLineInitial());

  Future<void> fetchOrders(int orderId) async {

    emit(NewLineLoading());
    try {
      Id? orderId;
      // Проверяем, что заказ уже создан
      final newOrderId = await newModelDocumentId.getOrderId();
      for(var order in newOrderId){
        orderId = order.dicumentId;
      }
      final orders = await ordersRepository.getOrderLines(orderId!);
      print("Загружено заказов: ${orders.length}"); // 🔍 Отладка
      if (orders != null) {
        emit(NewLineLoaded(orders));
      } else {
        emit(NewLineError("Не удалось загрузить заказы"));
      }
    } catch (e) {
      emit(NewLineError(e.toString()));
    }
  }
}
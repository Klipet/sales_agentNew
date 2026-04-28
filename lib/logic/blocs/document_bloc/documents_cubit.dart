import 'package:bloc/bloc.dart';

import '../../../data/providers/api_provider/orders_api.dart';
import '../../../data/repositories/orders_repositori.dart';
import '../../../services/app_logger.dart';
import 'documants_state.dart';


class DocumentsCubit extends Cubit<DocumentState> {
  final OrdersApi ordersApi;
  final OrdersRepositori ordersRepository;

  DocumentsCubit(this.ordersApi, this.ordersRepository) : super(OrdersInitial());

  Future<void> fetchOrders() async {
    emit(OrdersLoading());
    try {
      await ordersRepository.deleteOrdersWhereUuidNotEmpty();
      final orders = await ordersApi.getOrders();
      if (orders != null) {
        for(var doc in orders){
          await ordersRepository.saveOrders(doc);
        }
        emit(OrdersLoaded(orders));
      } else {
        await AppLogger().log(
          action: 'DocumentsCubit',
          message: orders,
          details: "Не удалось загрузить заказы",
          type: 2,
        );
        emit(OrdersError("Не удалось загрузить заказы"));
      }
    } catch (e) {
      await AppLogger().log(
        action: 'DocumentsCubit',
        message: e.toString(),
        details: "Не удалось загрузить заказы",
        type: 2,
      );
      emit(OrdersError(e.toString()));
    }
  }
}
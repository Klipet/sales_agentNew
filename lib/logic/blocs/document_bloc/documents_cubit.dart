import 'package:bloc/bloc.dart';

import '../../../data/providers/api_provider/orders_api.dart';
import '../../../data/repositories/orders_repositori.dart';
import 'documants_state.dart';


class DocumentsCubit extends Cubit<DocumentState> {
  final OrdersApi ordersApi;
  final OrdersRepositori ordersRepository;

  DocumentsCubit(this.ordersApi, this.ordersRepository) : super(OrdersInitial());

  Future<void> fetchOrders() async {
  //  print("1");
    emit(OrdersLoading());
  //  print("2");
    try {
      await ordersRepository.deleteOrdersWhereUuidNotEmpty();
      final orders = await ordersApi.getOrders();
      if (orders != null) {
        for (var modelDoc in orders) {
          await ordersRepository.saveOrders(modelDoc);
        }
        emit(OrdersLoaded(orders));
      } else {
        emit(OrdersError("Не удалось загрузить заказы"));
      }
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }
}
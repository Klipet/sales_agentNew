import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';

import '../../../data/models_db/model_db_new_order/new_model_document_id.dart';
import '../../../data/repositories/new_order_repositori.dart';
import 'new_order_event.dart';
import 'new_order_state.dart';

class NewOrderBloc extends Bloc<NewOrderEvent, NewOrderState> {
  final NewOrderRepository repository;
  final NewModelDocumentId documentId;
  NewOrderBloc(this.repository, this.documentId ) : super(NewOrderInitial()) {
    on<CreateOrderEvent>(_onCreateOrder);
    on<AddLineToOrderEvent>(_onAddLine);
    on<RemoveLineFromOrderEvent>(_onRemoveLine);
    on<UpdateLineQuantityEvent>(_onUpdateQuantity);
    on<LoadOrderEvent>(_onLoadOrder);
    on<DeleteOrderEvent>(_onDeleteOrder);
  }

  Future<void> _onCreateOrder(
      CreateOrderEvent event,
      Emitter<NewOrderState> emit,
      ) async {
    try {
      emit(NewOrderCreating());

      final id = await repository.createOrder(
        client: event.client,
        outlet: event.outlet,
      );
      await repository.addOrderId(id);
      final order = await repository.getOrder(id);
      if (order != null) {
        emit(NewOrderCreated(id, order));
      }
    } catch (e) {
      print('❌ Ошибка создания заказа: $e');
      emit(NewOrderError('Ошибка создания заказа: $e'));
    }
  }

  Future<void> _onAddLine(
      AddLineToOrderEvent event,
      Emitter<NewOrderState> emit,
      ) async {
    final currentState = state;
    Id? orderId;
    // Проверяем, что заказ уже создан
    final newOrderId = await repository.getOrderId();
    for(var order in newOrderId){
      orderId = order.dicumentId;
    }
    print('❌ Ошибка добавления товара: $orderId');
  //  if (currentState is NewOrderCreated) {
  //    orderId = currentState.orderId;
  //  } else if (currentState is NewOrderLoaded) {
  //    orderId = currentState.orderId;
  //  } else if (currentState is NewOrderUpdated) {
  //    orderId = currentState.orderId;
  //  } else {
  //    emit(NewOrderError('Заказ не создан. Сначала создайте заказ.'));
  //    return;
  //  }

    try {
      emit(NewOrderUpdating(orderId!));

      await repository.addLineToOrder(
        orderId: orderId,
        item: event.item,
        quantity: event.quantity,
        priceSelected: event.priceSelected,
      );

      final updatedOrder = await repository.getOrder(orderId);
      if (updatedOrder != null) {
        emit(NewOrderUpdated(orderId, updatedOrder));
      }
    } catch (e) {
      print('❌ Ошибка добавления товара: $e');
      emit(NewOrderError('Ошибка добавления товара: $e'));
    }
  }

  Future<void> _onRemoveLine(
      RemoveLineFromOrderEvent event,
      Emitter<NewOrderState> emit,
      ) async {
    final currentState = state;

    Id? orderId;
    if (currentState is NewOrderLoaded) {
      orderId = currentState.orderId;
    } else if (currentState is NewOrderUpdated) {
      orderId = currentState.orderId;
    } else {
      emit(NewOrderError('Заказ не загружен'));
      return;
    }

    try {
      emit(NewOrderUpdating(orderId));

      await repository.removeLineFromOrder(
        orderId: orderId,
        lineId: event.lineId,
      );

      final updatedOrder = await repository.getOrder(orderId);
      if (updatedOrder != null) {
        emit(NewOrderUpdated(orderId, updatedOrder));
      }
    } catch (e) {
      print('❌ Ошибка удаления товара: $e');
      emit(NewOrderError('Ошибка удаления товара: $e'));
    }
  }

  Future<void> _onUpdateQuantity(
      UpdateLineQuantityEvent event,
      Emitter<NewOrderState> emit,
      ) async {
    final currentState = state;

    Id? orderId;
    if (currentState is NewOrderLoaded) {
      orderId = currentState.orderId;
    } else if (currentState is NewOrderUpdated) {
      orderId = currentState.orderId;
    } else {
      emit(NewOrderError('Заказ не загружен'));
      return;
    }

    try {
      emit(NewOrderUpdating(orderId));

      await repository.updateLineQuantity(
        orderId: orderId,
        lineId: event.lineId,
        newQuantity: event.newQuantity,
      );

      final updatedOrder = await repository.getOrder(orderId);
      if (updatedOrder != null) {
        emit(NewOrderUpdated(orderId, updatedOrder));
      }
    } catch (e) {
      print('❌ Ошибка обновления количества: $e');
      emit(NewOrderError('Ошибка обновления количества: $e'));
    }
  }

  Future<void> _onLoadOrder(
      LoadOrderEvent event,
      Emitter<NewOrderState> emit,
      ) async {
    try {
      emit(NewOrderLoading(event.orderId));

      final order = await repository.getOrder(event.orderId);
      if (order != null) {
        emit(NewOrderLoaded(event.orderId, order));
      } else {
        emit(NewOrderError('Заказ не найден'));
      }
    } catch (e) {
      print('❌ Ошибка загрузки заказа: $e');
      emit(NewOrderError('Ошибка загрузки заказа: $e'));
    }
  }

  Future<void> _onDeleteOrder(
      DeleteOrderEvent event,
      Emitter<NewOrderState> emit,
      ) async {
    final currentState = state;

    Id? orderId;
    if (currentState is NewOrderLoaded) {
      orderId = currentState.orderId;
    } else if (currentState is NewOrderUpdated) {
      orderId = currentState.orderId;
    } else if (currentState is NewOrderCreated) {
      orderId = currentState.orderId;
    } else {
      emit(NewOrderError('Заказ не загружен'));
      return;
    }

    try {
      await repository.deleteOrder(orderId);
      emit(NewOrderDeleted());
    } catch (e) {
      print('❌ Ошибка удаления заказа: $e');
      emit(NewOrderError('Ошибка удаления заказа: $e'));
    }
  }
}
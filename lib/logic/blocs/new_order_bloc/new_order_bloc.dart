import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/data/repositories/client_comment_repository.dart';

import '../../../core/constans.dart';

import '../../../data/models_api/model_comment_clietn.dart';
import '../../../data/providers/navigator_provider.dart';
import '../../../data/repositories/new_order_repositori.dart';
import '../../../services/app_logger.dart';
import 'new_order_event.dart';
import 'new_order_state.dart';

class NewOrderBloc extends Bloc<NewOrderEvent, NewOrderState> {
  final NewOrderRepository repository;
  final BuildContext context;
  ClientCommentRepository clientCommentRepository = ClientCommentRepository();

  NewOrderBloc(this.repository, this.context) : super(NewOrderInitial()) {
    on<CreateOrderEvent>(_onCreateOrder);
    on<AddLineToOrderEvent>(_onAddLine);
    on<RemoveLineFromOrderEvent>(_onRemoveLine);
    on<UpdateLineQuantityEvent>(_onUpdateQuantity);
    on<LoadOrderEvent>(_onLoadOrder);
    on<DeleteOrderEvent>(_onDeleteOrder);
    on<AddOrderOutlentEvent>(_onAddOrderOutlend);
    on<LoadLineCountEvent>(_onGetOrderLine);
    on<AddCommentEvent>(_addComment);
    on<LoadCommentEvent>(_getCommentEvent);
  }

  Future<void> _onGetOrderLine(
    LoadLineCountEvent event,
    Emitter<NewOrderState> emit,
  ) async {
    emit(NewOrderLineCount());
    final count = await repository.getOrderLines(event.orderId);
    emit(NewOrderLineCountUpdated(count.length));
  }

  Future<void> _onAddOrderOutlend(
    AddOrderOutlentEvent event,
    Emitter<NewOrderState> emit,
  ) async {
    try {
      emit(UpadeOutlandsCreating());
      final id = await repository.addOutland(
        orderId: event.id!,
        outlet: event.outlet ?? null,
      );
      emit(NewOrderCreated(id));
      if(event.outlet != null|| event.modelOutlensDb != null){
      Provider.of<NavigationProvider>(context, listen: false).goToPageAndSave(
        event.page!,
        data: {
          Constant().modelDB: event.client,
          Constant().id: id,
          Constant().outlet: event.outlet ?? event.modelOutlensDb,
        },
      );
      }else{
        Provider.of<NavigationProvider>(context, listen: false).goToPageAndSave(
          event.page!,
          data: {
            Constant().modelDB: event.client,
            Constant().id: id,
         //  Constant().outlet: event.outlet ?? event.modelOutlensDb,
          },
        );
      }
    } catch (e) {
      print('❌ Ошибка добавления адреса: $e');
      await AppLogger().log(
        action: 'NewOrderBloc',
        message: e.toString(),
        type: 2,
      );
      emit(NewOrderError('Ошибка создания заказа: $e'));
    }
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
      emit(NewOrderCreated(id));
      Provider.of<NavigationProvider>(context, listen: false).goToPageAndSave(
        event.page!,
        data: {
          Constant().modelDB: event.client,
          Constant().id: id,
          Constant().outlet: event.outlet,
        },
      );
    } catch (e) {
      print('❌ Ошибка создания заказа: $e');
      await AppLogger().log(
        action: 'NewOrderBloc',
        message: e.toString(),
        details: "Ошибка создания заказа",
        type: 2,
      );
      emit(NewOrderError('Ошибка создания заказа: $e'));
    }
  }

  Future<void> _onAddLine(
    AddLineToOrderEvent event,
    Emitter<NewOrderState> emit,
  ) async {
    try {
      emit(NewOrderUpdating(event.id!));
      await repository.addLineToOrder(
        orderId: event.id!,
        item: event.item,
        quantity: event.quantity,
        priceSelected: event.priceSelected,
      );

      final updatedOrder = await repository.getOrder(event.id!);
      if (updatedOrder != null) {
        emit(NewOrderUpdated(event.id!, updatedOrder));
      }
    } catch (e) {
      await AppLogger().log(
        action: 'NewOrderBloc',
        message: e.toString(),
        details: "Ошибка добавления товара:",
        type: 2,
      );

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
      await AppLogger().log(
        action: 'NewOrderBloc',
        message: "NewOrderBloc",
        details: "Заказ не загружен",
        type: 2,
      );
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
      await AppLogger().log(
        action: 'NewOrderBloc',
        message: e.toString(),
        details: "Ошибка удаления товара:",
        type: 2,
      );

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
      await AppLogger().log(
        action: 'NewOrderBloc',
        message: e.toString(),
        details: "Ошибка обновления количества:",
        type: 2,
      );
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
      await AppLogger().log(
        action: 'NewOrderBloc',
        message: e.toString(),
        details: "Ошибка загрузки заказа:",
        type: 2,
      );
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
      await AppLogger().log(
        action: 'NewOrderBloc',
        message: "Заказ не загружен",
        details: "Заказ не загружен:",
        type: 2,
      );
      emit(NewOrderError('Заказ не загружен'));
      return;
    }

    try {
      await repository.getAllOrders();
      emit(NewOrderDeleted());
    } catch (e) {
      await AppLogger().log(
        action: 'NewOrderBloc',
        message: e.toString(),
        details: "Ошибка удаления заказа:",
        type: 2,
      );
      print('❌ Ошибка удаления заказа: $e');
      emit(NewOrderError('Ошибка удаления заказа: $e'));
    }
  }

  Future<void> _addComment(
    AddCommentEvent event,
    Emitter<NewOrderState> emit,
  ) async {
    emit(NewOrderLineCount());
    final comment = '${event.modelCommentClietn!.name} ${event.modelCommentClietn!.surName} ${event.modelCommentClietn!.phone} ${event.modelCommentClietn!.address} ${event.modelCommentClietn!.comment}';
     event.modelCommentClietn.toString();
     clientCommentRepository.saveComment(clientId: event.clientId, comment: event.modelCommentClietn!);
    final order = await repository.addCommentToOrder(
     id:  event.orderId,
     comment:  comment,
    );
    if (order) {
      emit(AddComentSucces());
    } else {
      await AppLogger().log(
        action: 'NewOrderBloc',
        message: order,
        details: "оштбка добавления комментария:",
        type: 2,
      );
      emit(AddComentError('Что-то пошло не так в коменатрий'));
    }
  }

  Future<void> _getCommentEvent(
    LoadCommentEvent event,
    Emitter<NewOrderState> emit,
  ) async {
    final clientComment = await clientCommentRepository.getComment(event.clientId);
    final serverComment = await repository.getOrder(event.orderId);
    final commentServer = serverComment?.comment?? '';
    final clientCommentModel = ModelCommentClient(
      phone: clientComment?.phone ?? '',
      name: clientComment?.name,
      surName: clientComment?.surName,
      address: clientComment?.address,
      comment: clientComment?.comment,
      clientUUid: event.clientUUid,
      saveComment: clientComment?.saveComment ?? false
    );
    emit(CommentLoadedState(clientCommentModel, commentServer));
  }
}

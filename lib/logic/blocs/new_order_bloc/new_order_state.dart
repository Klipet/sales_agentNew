import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_db/model_db_new_order/new_order_model_db.dart';

abstract class NewOrderState {}

class NewOrderInitial extends NewOrderState {}

class NewOrderCreating extends NewOrderState {}

class NewOrderCreated extends NewOrderState {
  final Id orderId;
  final NewOrderModelDb order;

  NewOrderCreated(this.orderId, this.order);
}

class NewOrderLoading extends NewOrderState {
  final Id orderId;

  NewOrderLoading(this.orderId);
}

class NewOrderLoaded extends NewOrderState {
  final Id orderId;
  final NewOrderModelDb order;

  NewOrderLoaded(this.orderId, this.order);
}

class NewOrderUpdating extends NewOrderState {
  final Id orderId;

  NewOrderUpdating(this.orderId);
}

class NewOrderUpdated extends NewOrderState {
  final Id orderId;
  final NewOrderModelDb order;

  NewOrderUpdated(this.orderId, this.order);
}

class NewOrderDeleted extends NewOrderState {}

class NewOrderError extends NewOrderState {
  final String message;

  NewOrderError(this.message);
}
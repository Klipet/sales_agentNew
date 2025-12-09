import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_document_db.dart';

abstract class NewOrderState {}

class NewOrderInitial extends NewOrderState {}

class NewOrderCreating extends NewOrderState {}

class UpadeOutlandsCreating extends NewOrderState {
}

class NewOrderCreated extends NewOrderState {
  final Id orderId;
//  final NewOrderModelDb order;

  NewOrderCreated(this.orderId);
}

class NewOrderLoading extends NewOrderState {
  final Id orderId;

  NewOrderLoading(this.orderId);
}

class NewOrderLoaded extends NewOrderState {
  final Id orderId;
  final ModelDocumentDb order;

  NewOrderLoaded(this.orderId, this.order);
}

class NewOrderUpdating extends NewOrderState {
  final Id orderId;

  NewOrderUpdating(this.orderId);
}

class NewOrderUpdated extends NewOrderState {
  final Id orderId;
  final ModelDocumentDb order;

  NewOrderUpdated(this.orderId, this.order);
}

class NewOrderLineCountUpdated extends NewOrderState {
  final int count;
  NewOrderLineCountUpdated(this.count);
}
class NewOrderLineCount extends NewOrderState {}



class NewOrderDeleted extends NewOrderState {}

class NewOrderError extends NewOrderState {
  final String message;

  NewOrderError(this.message);
}
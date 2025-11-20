import '../../../data/models_db/model_db_new_order/new_order_line_model_db.dart';

abstract class NewLineState{}


class NewLineInitial extends NewLineState {}

class NewLineLoading extends NewLineState {}

class NewLineLoaded extends NewLineState {
  final List<NewOrderLineModelDb> orders;
  NewLineLoaded(this.orders);
}

class NewLineError extends NewLineState {
  final String message;
  NewLineError(this.message);
}

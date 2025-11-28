import '../../../data/models_api/new_order_post/new_order_model_post_response_api.dart';

abstract class NewOrderPostState{}


class OrderPostInitial extends NewOrderPostState {}

class OrderPostLoading extends NewOrderPostState {}

class OrderPostLoaded extends NewOrderPostState {
  final NewOrderModelPostResponseApi response;
  OrderPostLoaded(this.response);
}
class OrderPostSave extends NewOrderPostState {}

class OrderPostError extends NewOrderPostState {
  final String message;
  OrderPostError(this.message);
}

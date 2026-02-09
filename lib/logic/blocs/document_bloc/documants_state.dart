abstract class DocumentState{}


class OrdersInitial extends DocumentState {}

class OrdersLoading extends DocumentState {}

class OrdersLoaded extends DocumentState {
  final List<dynamic> orders;
  OrdersLoaded(this.orders);
}

class OrdersError extends DocumentState {
  final String message;
  OrdersError(this.message);
}

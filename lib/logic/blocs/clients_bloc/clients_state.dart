abstract class ClientsState{}


class ClientsInitial extends ClientsState {}

class ClientsLoading extends ClientsState {}

class ClientsLoaded extends ClientsState {
  final List<dynamic> orders;
  ClientsLoaded(this.orders);
}

class ClientsError extends ClientsState {
  final String message;
  ClientsError(this.message);
}
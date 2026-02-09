import 'package:bloc/bloc.dart';

import '../../../data/providers/api_provider/client_api.dart';
import '../../../data/repositories/client_repositori.dart';
import 'clients_state.dart';

class ClientsCubit extends Cubit<ClientsState> {
  final ClientApi clientApi;
  final ClientRepositori clientRepositori;

  ClientsCubit(this.clientApi, this.clientRepositori) : super(ClientsInitial());

  Future<void> fetchClients() async {
    emit(ClientsLoading());
    try {
      await clientRepositori.deleteClient();
      await clientRepositori.deleteOutlens();

      final orders = await clientApi.getClient();
      if (orders != null) {
        for (var modelDoc in orders) {
          await clientRepositori.saveClient(modelDoc);
        }
        emit(ClientsLoaded(orders));
      } else {
        emit(ClientsError("Не удалось загрузить клиентов"));
      }
    } catch (e) {
      emit(ClientsError(e.toString()));
    }
  }
}
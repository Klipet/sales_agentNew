import 'package:bloc/bloc.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_comment_client_db.dart';
import 'package:sales_agent/data/repositories/client_comment_repository.dart';

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

      final clients = await clientApi.getClient();
      if (clients != null) {
          await clientRepositori.saveClient(clients);
        emit(ClientsLoaded(clients));
      } else {
        emit(ClientsError("Не удалось загрузить клиентов"));
      }
    } catch (e) {
      emit(ClientsError(e.toString()));
    }
  }
}
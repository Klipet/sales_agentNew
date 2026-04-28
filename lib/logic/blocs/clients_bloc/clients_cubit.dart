import 'package:bloc/bloc.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_comment_client_db.dart';
import 'package:sales_agent/data/repositories/client_comment_repository.dart';

import '../../../data/providers/api_provider/client_api.dart';
import '../../../data/repositories/client_repositori.dart';
import '../../../services/app_logger.dart';
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
        await AppLogger().log(
          action: 'ClientsCubit',
          message: clients,
          details: "Не удалось загрузить клиентов",
          type: 2,
        );
        emit(ClientsError("Не удалось загрузить клиентов"));
      }
    } catch (e) {
      await AppLogger().log(
        action: 'ClientsCubit',
        message: e.toString(),
        details: "Не удалось загрузить клиенто",
        type: 2,
      );
      emit(ClientsError(e.toString()));
    }
  }
}
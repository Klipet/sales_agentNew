import 'package:bloc/bloc.dart';
import 'package:sales_agent/data/providers/api_provider/client_detail_api.dart';

import '../../../data/models_api/models_client/contragent_response.dart';
import 'client_detail_state.dart';

class ClientDetailBloc extends Cubit<ClientDetailState>{
  final ClientDetailApi clientDetailApi;
  ClientDetailBloc(this.clientDetailApi): super (ClientDetailInitial());

  Future<void> loadClient(String uuid) async{
    emit(ClientDetailLoading());
    try{
      final clientResponse = await clientDetailApi.getClient(clientuid: uuid);
      print("${clientResponse.contragents} ClientDetailBloc");
      emit(ClientDetailSuccess(clientResponse.contragents));
    }catch(e){
      emit(ClientDetailFailure(e.toString()));
    }
  }
}
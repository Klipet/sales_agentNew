import 'package:bloc/bloc.dart';
import 'package:sales_agent/data/providers/api_provider/client_detail_api.dart';
import 'package:sales_agent/data/repositories/client_repositori.dart';

import '../../../data/models_api/models_client/contragent_response.dart';
import 'client_detail_state.dart';

class ClientDetailBloc extends Cubit<ClientDetailState>{
  final ClientDetailApi clientDetailApi;
  final ClientRepositori clientRepositori;
  ClientDetailBloc(this.clientDetailApi, this.clientRepositori): super (ClientDetailInitial());

  Future<void> loadClient(String uuid) async{
    emit(ClientDetailLoading());
    try{

      final clientResponse = await clientDetailApi.getClient(clientuid: uuid);
      if(clientResponse.errorCode == 0){
        emit(ClientDetailSuccess(clientResponse.contragents));
      }else{
      final clientOut = await clientRepositori.getOutlets(uuid);
      if(clientOut.isEmpty){
        emit(ClientDetailFailure('Пусто'));
      }else{
        emit(OutlandDetailSuccess(clientOut));
      }

      }

    }catch(e){
      print(e);
      emit(ClientDetailFailure(e.toString()));
    }
  }
}
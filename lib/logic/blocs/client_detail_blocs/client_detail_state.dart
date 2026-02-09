import 'package:sales_agent/data/models_api/models_client/contragent_response.dart';
import 'package:sales_agent/data/repositories/client_repositori.dart';

import '../../../data/models_api/models_client_detail/client_detail.dart';
import '../../../data/models_api/models_client_detail/detail_client_response.dart';
import '../../../data/models_db/model_db_clients/model_outlens_db.dart';

abstract class ClientDetailState {}

class ClientDetailInitial extends ClientDetailState {}

class ClientDetailLoading extends ClientDetailState {}

class ClientDetailSuccess extends ClientDetailState {
  final ClientDetail? contragrnt;
  ClientDetailSuccess(this.contragrnt);
}
class OutlandDetailSuccess extends ClientDetailState {
  final List<ModelOutlensDb>? outlands;
  OutlandDetailSuccess(this.outlands);
}

class ClientDetailFailure extends ClientDetailState {
  final String message;
  ClientDetailFailure(this.message);
}
import 'package:bloc/bloc.dart';
import 'package:sales_agent/core/constans.dart';
import 'package:sales_agent/data/models_api/models_api_server/log_request.dart';

import '../../../data/providers/api_provider/activarion_api.dart';
import '../../../data/providers/api_provider/log_request_post_api.dart';
import '../../../data/repositories/apikey_repositori.dart';
import '../../../services/app_logger.dart';
import 'activation_event.dart';
import 'activation_state.dart';

class ActivationBloc extends Bloc<ActivationEvent, ActivationState> {
  final ApikeyRepository repository;
  final ActivationApi activationApi;
  LogRequestPostApi log = LogRequestPostApi();


  ActivationBloc(this.repository, this.activationApi) : super(ActivationInitial()) {
    on<FetchActivationData>(_onFetchActivationData);
  }

  Future<void> _onFetchActivationData(FetchActivationData event, Emitter<ActivationState> emit) async {
    emit(ActivationLoading());
    final apiResponse = await activationApi.activationLicense(event.licenseCode);
    final apikey = apiResponse?.appData?.licenseID;
    final company = apiResponse?.appData?.company;
    try {
      if (apiResponse != null && apiResponse.errorCode == 0 && apiResponse.appData != null) {
        final uri = apiResponse.appData?.uri;
        final licenseCode = apiResponse.appData?.licenseCode;
        await repository.saveApiKey(key: apikey!,uri:  uri!,licenseCode:  licenseCode!, company:  company!);
        emit(ActivationSuccess());
      } else {
        await AppLogger().log(
          action: 'ActivationBloc',
          message: apiResponse,
          details: "Ошибка занрузки данных",
          type: 2,
        );
        emit( ActivationFailure(apiResponse!.errorMessage));
      }
    } catch (e, t) {
      print(t);
      await AppLogger().log(
        action: 'ActivationBloc',
        message: e,
        details: "Ошибка занрузки данных",
        type: 2,
      );
      emit(ActivationFailure(e.toString()));
    }
  }
}
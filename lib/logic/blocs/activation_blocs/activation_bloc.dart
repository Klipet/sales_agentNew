import 'package:bloc/bloc.dart';

import '../../../data/providers/api_provider/activarion_api.dart';
import '../../../data/repositories/apikey_repositori.dart';
import 'activation_event.dart';
import 'activation_state.dart';

class ActivationBloc extends Bloc<ActivationEvent, ActivationState> {
  final ApikeyRepository repository;
  final ActivationApi activationApi;

  ActivationBloc(this.repository, this.activationApi) : super(ActivationInitial()) {
    on<FetchActivationData>(_onFetchActivationData);
  }

  Future<void> _onFetchActivationData(FetchActivationData event, Emitter<ActivationState> emit) async {
    emit(ActivationLoading());
    try {
      final apiResponse = await activationApi.activationLicense(event.licenseCode);

      if (apiResponse != null && apiResponse.errorCode == 0 && apiResponse.appData != null) {
        final apikey = apiResponse.appData?.licenseID;
        final uri = apiResponse.appData?.uri;
        await repository.saveApiKey(apikey!, uri!);
        emit(ActivationSuccess());
      } else {
        emit(const ActivationFailure("Не удалось активировать лицензию"));
      }
    } catch (e) {
      emit(ActivationFailure(e.toString()));
    }
  }
}
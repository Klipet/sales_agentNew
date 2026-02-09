import 'package:bloc/bloc.dart';
import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';
import 'package:sales_agent/data/providers/api_provider/splash_api.dart';
import 'package:sales_agent/data/repositories/apikey_repositori.dart';
import 'package:sales_agent/logic/blocs/splash_bloc/splash_event.dart';
import 'package:sales_agent/logic/blocs/splash_bloc/splash_state.dart';

import '../../../data/providers/internet_provider.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashApi service;
  final ApikeyRepository repository;
  final InternetCheckService internetService = InternetCheckService();

  SplashBloc(this.repository, this.service) : super(SplashInitial()) {
    on<GetUrlEvent>((event, emit) async {
      emit(SplashLoad());
      try {
        final bool isConnected = await InternetConnectivity().hasInternetConnection;
        final repoApikey = await repository.getApiKey();
      //  print('SplashBloc: repoApikey = $repoApikey');

        if(repoApikey != null){
          if (!isConnected) {
            emit(SplashError(''));
            return;
          }
          final apiResponse = await service.registerUrl();
          if (apiResponse != null && apiResponse.errorCode == 0) {
            final url = apiResponse.appData?.uri;
            final apikey = apiResponse.appData?.licenseID;
            if (apikey != null && url != null) {
              await repository.saveApiKey(apikey, url);
              emit(SplashSuccess()); // 👉 переход на LoginScreen
            }else {
              emit(SplashError("Некорректные данные от сервера"));
            }
          }else {
            emit(SplashError("Не удалось обновить API key"));
          }
        }else{
          emit(SplashError("Нету ключа"));
        }

      } catch (e) {
        emit(SplashError("Не удалось получить URL. Попробуйте позже.${e.toString()}"));
      }
    });
  }
}

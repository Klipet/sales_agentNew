import 'package:bloc/bloc.dart';
import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';
import 'package:sales_agent/data/providers/api_provider/splash_api.dart';
import 'package:sales_agent/data/repositories/apikey_repositori.dart';
import 'package:sales_agent/logic/blocs/splash_bloc/splash_event.dart';
import 'package:sales_agent/logic/blocs/splash_bloc/splash_state.dart';

import '../../../data/providers/internet_provider.dart';
import '../../../services/app_logger.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashApi service;
  final ApikeyRepository repository;
  final InternetCheckService internetService = InternetCheckService();

  SplashBloc(this.repository, this.service) : super(SplashInitial()) {
    on<GetUrlEvent>((event, emit) async {
      emit(SplashLoad());
      try {
        final bool isConnected =
            await InternetConnectivity().hasInternetConnection;
        final repoApikey = await repository.getApiKey();
        //  print('SplashBloc: repoApikey = $repoApikey');

        if (repoApikey != null) {
          if (!isConnected) {
            emit(SplashError(''));
            return;
          }
          final apiResponse = await service.registerUrl();
          if (apiResponse != null && apiResponse.errorCode == 0) {
            final url = apiResponse.appData?.uri;
            final apikey = apiResponse.appData?.licenseID;
            final licenseCode = apiResponse.appData?.licenseCode;
            final company = apiResponse.appData?.licenseCode;
            if (apikey != null && url != null) {
              await repository.saveApiKey(
                key: apikey,
                uri: url,
                licenseCode: licenseCode!,
                company: company!,
              );
              emit(SplashSuccess()); // 👉 переход на LoginScreen
            } else {
              await AppLogger().log(
                action: 'SplashBloc',
                message: apiResponse,
                details: "Некорректные данные от сервера",
                type: 2,
              );
              emit(SplashError("Некорректные данные от сервера"));
            }
          } else {
            await AppLogger().log(
              action: 'SplashBloc',
              message: apiResponse,
              details: "Не удалось обновить API key",
              type: 2,
            );
            emit(SplashError("Не удалось обновить API key"));
          }
        } else {
          await AppLogger().log(
            action: 'SplashBloc',
            message: "Нету ключа",
            type: 2,
          );
          emit(SplashError("Нету ключа"));
        }
      } catch (e) {
        await AppLogger().log(
          action: 'SplashBloc',
          message: e.toString(),
          type: 2,
        );
        emit(
          SplashError(
            "Не удалось получить URL. Попробуйте позже.${e.toString()}",
          ),
        );
      }
    });
  }
}

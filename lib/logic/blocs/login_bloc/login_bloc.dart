import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:sales_agent/data/providers/api_provider/login_api.dart';
import 'package:sales_agent/data/repositories/login_repositori.dart';
import '../../../core/constans.dart';
import '../../../data/models_api/models_api_server/log_request.dart';
import '../../../data/providers/api_provider/log_request_post_api.dart';
import '../../../data/repositories/apikey_repositori.dart';
import '../../../services/app_logger.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  final LoginApi actualizationUser;
  final ApikeyRepository apikeyRepository = ApikeyRepository();
  LogRequestPostApi log = LogRequestPostApi();

  LoginBloc(this.repository, this.actualizationUser) : super(LoginInitial()) {
    on<CheckSavedLogin>(onCheckSavedLogin);
    on<FetchLoginData>(_onFetchActivationData);
    on<SavedLogin>(_savePassword);
  }

  Future<void> _onFetchActivationData(
    FetchLoginData event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      String login;
      String password;
      final savePass = await repository.getSavePassword();
      if (savePass == true) {
        login = await repository.getLogin() ?? '';
        password = await repository.getPassword() ?? '';
      } else {
        login = event.login;
        password = event.password;
      }
      final lastAccess = await repository.getLastAces();
      final apiResponse = await actualizationUser.getLogInUser(login, password);
      if (apiResponse.errorCode == 0) {
        final token = apiResponse.token!.uid ?? '';
        final validTo = apiResponse.token!.validTo ?? '';
        final userName = apiResponse.user!.name ?? '';
        final surName = apiResponse.user!.surname ?? '';
        final String fullName = '$userName$surName';
        await repository.saveLogin(
          login,
          password,
          token,
          validTo,
          fullName,
          event.save,
          lastAccess ?? DateTime.now().subtract(const Duration(days: 1)),
        );
        emit(LoginSuccess(lastAccess ?? DateTime.now()));
      } else {
        final loginS = await repository.getLogin() ?? '';
        final passwordS = await repository.getPassword() ?? '';
        await AppLogger().log(
          action: 'LoginBloc',
          message: apiResponse,
          type: 2,
        );
        if (event.password != passwordS || event.login != loginS) {
          emit(LoginFailure('login nu concide'));
        }else{
          emit(LoginFailure(''));
        }
      }
    } catch (e) {
      await AppLogger().log(
        action: 'LoginBloc',
        message: e.toString(),
        type: 2,
      );
      print(e);
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> onCheckSavedLogin(
    CheckSavedLogin event,
    Emitter<LoginState> emit,
  ) async {
    final loginDB = await repository.getLogin();
    final passwordDB = await repository.getPassword();
    final savePass = await repository.getSavePassword();
    if (loginDB != null && passwordDB != null && savePass == true) {
      add(FetchLoginData(passwordDB, loginDB, savePass!)); // автологин
    }
  }

  Future<void> _savePassword(SavedLogin event,
      Emitter<LoginState> emit,) async{
     await repository.changeSave(event.save);
}

}

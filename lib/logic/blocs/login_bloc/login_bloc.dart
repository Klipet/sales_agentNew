import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:sales_agent/data/providers/api_provider/login_api.dart';
import 'package:sales_agent/data/repositories/login_repositori.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  final LoginApi actualizationUser;

  LoginBloc(this.repository, this.actualizationUser) : super(LoginInitial()) {
    on<FetchLoginData>(_onFetchActivationData);
  }

  Future<void> _onFetchActivationData(FetchLoginData event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      String login;
      String password;

      if (event.save == true) {
        login = await repository.getLogin() ?? '';
        password = await repository.getPassword() ?? '';
      } else {
        login = event.login;
        password = event.password;
      }
      if (kDebugMode) {
        print(login + password);
      }
      final apiResponse = await actualizationUser.getLogInUser(login, password);
      if(apiResponse.errorCode == 0){
        final token = apiResponse.token.uid;
        final validTo = apiResponse.token.validTo;
        repository.saveLogin(login, password, token, validTo, event.save);
      }else{
        emit(LoginFailure(apiResponse.errorMessage.toString()));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

}
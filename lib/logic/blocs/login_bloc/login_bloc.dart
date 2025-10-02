import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:sales_agent/data/providers/api_provider/client_api.dart';
import 'package:sales_agent/data/providers/api_provider/login_api.dart';
import 'package:sales_agent/data/providers/api_provider/orders_api.dart';
import 'package:sales_agent/data/repositories/client_repositori.dart';
import 'package:sales_agent/data/repositories/login_repositori.dart';

import '../../../data/repositories/orders_repositori.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  final OrdersRepositori ordersRepositori;
  final ClientRepositori clientRepositori;
  final LoginApi actualizationUser;
  final OrdersApi ordersApi;
  final ClientApi clientApi;

  LoginBloc(this.repository, this.actualizationUser, this.ordersApi, this.ordersRepositori, this.clientRepositori, this.clientApi) : super(LoginInitial()) {
    on<CheckSavedLogin>(_onCheckSavedLogin);
    on<FetchLoginData>(_onFetchActivationData);
  }

  Future<void> _onFetchActivationData(FetchLoginData event, Emitter<LoginState> emit) async {
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
      if (kDebugMode) {
        print(login + password);
      }
      final apiResponse = await actualizationUser.getLogInUser(login, password);
      if(apiResponse.errorCode == 0){
        final token = apiResponse.token.uid;
        final validTo = apiResponse.token.validTo;
        final userName = apiResponse.user.name;
        final surName = apiResponse.user.surname ?? '';
        final String fullName = '$userName$surName';
        await repository.saveLogin(login, password, token, validTo, fullName, event.save);
        await ordersRepositori.deleteOrder();
        await ordersRepositori.deleteLine();
        final orders = await ordersApi.getOrders();
        for(var modelDoc in orders!){
          await ordersRepositori.saveOrders(modelDoc);
        }
        await clientRepositori.deleteClient();
        await clientRepositori.deleteOutlens();
        final client = await clientApi.getClient();
        
        for(var clientDB in client!){
          if(clientDB.outlets == null ){
            emit(LoginFailure("Список адресов пустой или null"));
          }
          await clientRepositori.saveClient(clientDB);
        }
        emit(LoginSuccess());
      }else{
        emit(LoginFailure(apiResponse.errorMessage.toString()));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> _onCheckSavedLogin(
      CheckSavedLogin event, Emitter<LoginState> emit) async {
    final loginDB = await repository.getLogin();
    final passwordDB = await repository.getPassword();
    final savePass = await repository.getSavePassword();
    if (loginDB != null && passwordDB != null && savePass == true) {
      add(FetchLoginData(passwordDB, loginDB, savePass!)); // автологин
    }
  }
}
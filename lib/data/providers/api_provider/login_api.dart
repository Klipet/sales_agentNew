import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:sales_agent/data/models_api/model_login.dart';
import 'package:sales_agent/data/models_api/model_token.dart';
import 'package:sales_agent/data/repositories/apikey_repositori.dart';
import 'package:sales_agent/data/repositories/login_repositori.dart';
import 'package:http/http.dart' as http;
import 'package:sales_agent/services/app_logger.dart';

import '../../../core/constans.dart';


class LoginApi{
  LoginRepository loginRepository = LoginRepository();
  ApikeyRepository apikeyRepository = ApikeyRepository();
  final Constant constants = Constant();

  Future<ModelLogin> getLogInUser(String login, String password) async{
    final url = await apikeyRepository.getUrl();
    try{
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve('json/AuthorizeUser?authUid=82f6d96e-b407-42f6-af19-6bc4de0caa05&userName=$login&userPassword=$password');
      final loginResponse = await http.get(urlPars).timeout(Duration(minutes: 1));
      if(loginResponse.statusCode == 200){
        final response = jsonDecode(loginResponse.body);
        final authResponse = ModelLogin.fromJson(response);
        return authResponse;
      }else{
        return ModelLogin(errorCode: 3, errorMessage: loginResponse.statusCode.toString(), token: null, user: null);
      }
    } on TimeoutException {
      return ModelLogin(errorCode: 2, errorMessage: 'TimeoutException', token: null, user: null);
    } on SocketException{
      return ModelLogin(errorCode: 1, errorMessage: 'SocketException', token: null, user: null);
    } catch(e){
      return ModelLogin(errorCode: 5, errorMessage: e.toString(), token: null, user: null);
    }
  }
}
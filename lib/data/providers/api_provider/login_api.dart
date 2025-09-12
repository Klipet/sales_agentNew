import 'dart:async';
import 'dart:convert';

import 'package:sales_agent/data/models_api/model_login.dart';
import 'package:sales_agent/data/repositories/apikey_repositori.dart';
import 'package:sales_agent/data/repositories/login_repositori.dart';
import 'package:http/http.dart' as http;

class LoginApi{
  LoginRepository loginRepository = LoginRepository();
  ApikeyRepository apikeyRepository = ApikeyRepository();

  Future<ModelLogin> getLogInUser(String login, String password) async{
    final url = await apikeyRepository.getUrl();
    try{
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve('json/AuthorizeUser?authUid=82f6d96e-b407-42f6-af19-6bc4de0caa05&userName=$login&userPassword=$password');
      final loginResponse = await http.get(urlPars).timeout(Duration(seconds: 5));
      if(loginResponse.statusCode == 200){
        final response = jsonDecode(loginResponse.body);
        final authResponse = ModelLogin.fromJson(response);
        return authResponse;
      }else{
        throw Exception("Ошибка при логине: ${loginResponse.statusCode}");
      }
    } on TimeoutException {
      throw Exception("Сервер не отвечает (timeout)");
    } catch(e){
      throw Exception("Ошибка при логине: $e");
    }
  }
}
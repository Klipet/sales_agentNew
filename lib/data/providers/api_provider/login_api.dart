import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:sales_agent/data/models_api/model_login.dart';
import 'package:sales_agent/data/models_api/model_token.dart';
import 'package:sales_agent/data/repositories/apikey_repositori.dart';
import 'package:sales_agent/data/repositories/login_repositori.dart';
import 'package:http/http.dart' as http;

import '../../../core/constans.dart';
import '../../models_api/models_api_server/log_request.dart';
import 'log_request_post_api.dart';

class LoginApi{
  LoginRepository loginRepository = LoginRepository();
  ApikeyRepository apikeyRepository = ApikeyRepository();
  final Constant constants = Constant();

  Future<ModelLogin> getLogInUser(String login, String password) async{
    LogRequestPostApi log = LogRequestPostApi();
    final url = await apikeyRepository.getUrl();
    final licenseId = await apikeyRepository.getApiKey();
    final company = await apikeyRepository.getCompany();
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
        final response = jsonDecode(loginResponse.body);
        await log.logPostServer(
          logRequest: LogRequest(
              source: constants.APPNAME,
              action: 'LoginApi',
              message: response,
              details: '',
              hostName: '',
              ip: '',
              type: 2,
              domain: '',
              entity: '',
              appVersion: '',
              date: DateTime.now(),
              os: 'Android',
              ram: '',
              hdd: '',
              company: company,
              companyID: 0,
              licenseID: licenseId
          ),
        );
        return ModelLogin(errorCode: 3, errorMessage: loginResponse.statusCode.toString(), token: null, user: null);
      }
    } on TimeoutException {
      return ModelLogin(errorCode: 2, errorMessage: 'TimeoutException', token: null, user: null);
    } on SocketException{
      log.logPostServer(
        logRequest: LogRequest(
            source: constants.APPNAME,
            action: 'LoginApi',
            message: 'SocketException',
            details: '',
            hostName: '',
            ip: '',
            type: 2,
            domain: '',
            entity: '',
            appVersion: '',
            date: DateTime.now(),
            os: 'Android',
            ram: '',
            hdd: '',
            company: company,
            companyID: 0,
            licenseID: licenseId
        ),
      );
      return ModelLogin(errorCode: 1, errorMessage: 'SocketException', token: null, user: null);
    } catch(e){
      log.logPostServer(
        logRequest: LogRequest(
            source: constants.APPNAME,
            action: 'LoginApi',
            message: e.toString(),
            details: '',
            hostName: '',
            ip: '',
            type: 2,
            domain: '',
            entity: '',
            appVersion: '',
            date: DateTime.now(),
            os: 'Android',
            ram: '',
            hdd: '',
            company: company,
            companyID: 0,
            licenseID: licenseId
        ),
      );
      return ModelLogin(errorCode: 5, errorMessage: e.toString(), token: null, user: null);
    }
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sales_agent/data/models_api/models_client_detail/detail_client_response.dart';

import '../../repositories/apikey_repositori.dart';
import '../../repositories/login_repositori.dart';

class ClientDetailApi {
  LoginRepository loginRepository = LoginRepository();
  ApikeyRepository apikeyRepository = ApikeyRepository();

  Future<DetailClientResponse> getClient({required String clientuid}) async {
    final url = await apikeyRepository.getUrl();
    final token = await loginRepository.getToken();
    try{
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve('json/GetContragent?tokenUid=$token&clientUid=$clientuid');
      final ordersResponse = await http.get(urlPars).timeout(Duration(seconds: 5));
      if(ordersResponse.statusCode == 200){
        final response = jsonDecode(ordersResponse.body);
        print(response);
        final dataResponse = DetailClientResponse.fromJson(response);
        print(dataResponse.contragents);
        return dataResponse;
      }else{
        return DetailClientResponse(errorCode: ordersResponse.statusCode, contragents: null);
      }
    }catch(e){
      return DetailClientResponse(errorCode: 2, contragents: null);
    }
  }
}
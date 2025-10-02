import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sales_agent/data/models_api/models_client/client_response.dart';
import 'package:sales_agent/data/models_api/models_client/contragent_response.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_client_db.dart';
import 'package:sales_agent/data/repositories/client_repositori.dart';

import '../../repositories/apikey_repositori.dart';
import '../../repositories/login_repositori.dart';

class ClientApi {
  LoginRepository loginRepository = LoginRepository();
  ApikeyRepository apikeyRepository = ApikeyRepository();

  Future<List<ContragentResponse>?> getClient() async {
    final url = await apikeyRepository.getUrl();
    final token = await loginRepository.getToken();
    try{
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve('json/GetContragentsList?tokenUid=$token');
      final ordersResponse = await http.get(urlPars).timeout(Duration(seconds: 5));
      if(ordersResponse.statusCode == 200){
        final response = jsonDecode(ordersResponse.body);
        final dataResponse = ClientResponse.fromJson(response);
        return dataResponse.contragents;
      }else{
        throw Exception("Ошибка Orders: ${ordersResponse.statusCode}");
      }
    }catch(e){
      throw Exception("Ошибка при загрузки Orders: ${e.toString()}");
    }
  }
}
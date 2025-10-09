import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sales_agent/data/models_api/models_assortiment/assortiment_model.dart';
import 'package:sales_agent/data/models_api/models_assortiment/assortiment_response.dart';

import '../../repositories/apikey_repositori.dart';
import '../../repositories/login_repositori.dart';

class AssortimentApi {
  LoginRepository loginRepository = LoginRepository();
  ApikeyRepository apikeyRepository = ApikeyRepository();

  Future<List<AssortimentModel>> getAssortiment() async {
    final url = await apikeyRepository.getUrl();
    final token = await loginRepository.getToken();
    try{
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve('json/GetAssortimentList?tokenUid=$token');
      final ordersResponse = await http.get(urlPars).timeout(Duration(seconds: 5));
      if(ordersResponse.statusCode == 200){
        final response = jsonDecode(ordersResponse.body);
        final dataResponse = AssortimentResponse.fromJson(response);
        return dataResponse.assortiment;
      }else{
        throw Exception("Ошибка Assortiment: ${ordersResponse.statusCode}");
      }
    }catch(e){
      throw Exception("Ошибка при загрузки Assortiment: ${e.toString()}");
    }
  }
}
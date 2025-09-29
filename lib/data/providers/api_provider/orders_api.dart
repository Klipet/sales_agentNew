import 'dart:convert';

import 'package:sales_agent/data/models_api/models_documents/model_documents.dart';
import 'package:sales_agent/data/models_api/models_documents/model_get_orders.dart';
import 'package:http/http.dart' as http;
import '../../repositories/apikey_repositori.dart';
import '../../repositories/login_repositori.dart';

class OrdersApi {
  LoginRepository loginRepository = LoginRepository();
  ApikeyRepository apikeyRepository = ApikeyRepository();

  Future<List<ModelDocuments>?> getOrders() async {
    final url = await apikeyRepository.getUrl();
    final token = await loginRepository.getToken();
    DateTime data = DateTime.now().add(Duration(days: 1));
    try{
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve('json/GetRequestList?tokenUid=$token&startDate=2021-01-01&endDate=$data');
      final ordersResponse = await http.get(urlPars).timeout(Duration(seconds: 5));
      if(ordersResponse.statusCode == 200){
        final response = jsonDecode(ordersResponse.body);
        final dataResponse = ModelGetOrders.fromJson(response);
        return dataResponse.documents;
      }else{
        throw Exception("Ошибка Orders: ${ordersResponse.statusCode}");
      }
    }catch(e){
      throw Exception("Ошибка при загрузки Orders: ${e.toString()}");
    }
  }
}

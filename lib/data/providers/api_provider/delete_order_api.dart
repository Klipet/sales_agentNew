import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sales_agent/data/models_api/delete_order/delete_order_model.dart';

import '../../repositories/apikey_repositori.dart';
import '../../repositories/login_repositori.dart';

class DeleteOrderApi {
  LoginRepository loginRepository = LoginRepository();
  ApikeyRepository apikeyRepository = ApikeyRepository();

  Future<DeleteOrderModel> deleteOrder(String uuid) async {
    final url = await apikeyRepository.getUrl();
    final token = await loginRepository.getToken();
    try{
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve('json/DeleteRequest?tokenUid=$token&invoiceUid=$uuid');
      final ordersResponse = await http.get(urlPars).timeout(Duration(seconds: 5));
      if(ordersResponse.statusCode == 200){
        final response = jsonDecode(ordersResponse.body);
        final dataResponse = DeleteOrderModel.fromJson(response);
        if(dataResponse.errorCode == 0){
          return dataResponse;
        }else{
          throw Exception("Ошибка удалений: ${dataResponse.errorMessage}");
        }
      }else{
        throw Exception("Ошибка удалений: ${ordersResponse.statusCode}");
      }
    }catch(e){
      throw Exception("Ошибка при удалений: ${e.toString()}");
    }
  }
}
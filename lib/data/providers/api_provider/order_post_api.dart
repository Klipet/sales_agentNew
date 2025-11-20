import 'dart:convert';

import '../../models_api/new_order_post/new_order_model_api.dart';
import '../../models_api/new_order_post/new_order_model_post_response_api.dart';
import '../../repositories/apikey_repositori.dart';
import '../../repositories/login_repositori.dart';
import 'package:http/http.dart' as http;

class OrderPostApi{
  LoginRepository loginRepository = LoginRepository();
  ApikeyRepository apikeyRepository = ApikeyRepository();

  Future<NewOrderModelPostResponseApi> postOrder({
    required NewOrderModelApi orderData,
  }) async{
    final url = await apikeyRepository.getUrl();
    final token = await loginRepository.getToken();
    try {
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve(
          'json/SaveRequest?tokenUid=$token');
      final ordersResponse = await http.post(
        urlPars,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(orderData.toJson()),
      ).timeout(const Duration(seconds: 10));
      if (ordersResponse.statusCode == 200) {
        final data = jsonDecode(ordersResponse.body);
        return NewOrderModelPostResponseApi.fromJson(data);
      } else {
        throw Exception(
          'Ошибка сервера: ${ordersResponse.statusCode} - ${ordersResponse.reasonPhrase}',
        );
      }
    }catch(e){
      throw Exception(
        'Ошибка сервера: ${e}',
      );
    }
}
}
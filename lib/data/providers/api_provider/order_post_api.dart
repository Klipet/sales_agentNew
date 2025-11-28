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
    required Map<String, dynamic> orderData,
  }) async{
    final url = await apikeyRepository.getUrl();
    final token = await loginRepository.getToken();
    try {
      final jsonString = jsonEncode(orderData);
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve(
          'json/SaveRequest?tokenUid=$token');
      print(urlPars);
      print("JSON отправки:");
      print(jsonString);
      final ordersResponse = await http.post(
        urlPars,
        headers: {
          'Content-Type': 'application/json; charset=utf-8', // ✅ ОБЯЗАТЕЛЬНО!
          'Accept': 'application/json',
        },
        body: jsonString,
      ).timeout(const Duration(seconds: 30));
      if (ordersResponse.statusCode == 200) {
        final data = jsonDecode(ordersResponse.body);
        return NewOrderModelPostResponseApi.fromJson(data);
      } else {
        throw Exception(
          'Ошибка сервера 1: ${ordersResponse.statusCode} - ${ordersResponse.reasonPhrase}',
        );
      }
    }on FormatException catch (e) {
      throw Exception('Ошибка формата данных (JSON): $e');
    } catch(e,  stack){
      throw Exception(
        'Ошибка сервера 2: ${e}, ${stack}',
      );
    }
}
}
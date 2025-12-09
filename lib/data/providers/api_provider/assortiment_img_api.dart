import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sales_agent/data/models_api/models_assortiment/assortiment_img_response.dart';

import '../../repositories/apikey_repositori.dart';
import '../../repositories/login_repositori.dart';

class AssortimentImgApi{
  ApikeyRepository apikeyRepository = ApikeyRepository();

  Future<AssortimentImgResponse> postImg({
    required Map<String, dynamic> orderData,
  }) async{
    final url = await apikeyRepository.getUrl();
    try {
      final jsonString = jsonEncode(orderData);
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve(
          'json/GetAssortimentImages');
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
        return AssortimentImgResponse.fromJson(data);
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
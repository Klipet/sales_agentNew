import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sales_agent/data/models_api/models_assortiment/assortiment_img_response.dart';

import '../../repositories/apikey_repositori.dart';
import '../../repositories/login_repositori.dart';

class AssortimentImgApi{
  ApikeyRepository apikeyRepository = ApikeyRepository();

  Future<AssortimentImgResponse> postImg({
    required Map<String, dynamic> orderData,
    http.Client? client,
  }) async{
    final url = await apikeyRepository.getUrl();
    final usedClient = client ?? http.Client();
    try {
      final jsonString = jsonEncode(orderData);
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve('json/GetAssortimentImages');
      final ordersResponse = await usedClient.post(
        urlPars,
        headers: {
          'Content-Type': 'application/json; charset=utf-8', // ✅ ОБЯЗАТЕЛЬНО!
          'Accept': 'application/json',
        },
        body: jsonString,
      ).timeout(const Duration(seconds: 5));
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
      usedClient.close();
      throw Exception(
        'Ошибка сервера 2: ${e}, ${stack}',
      );
    } finally {
      if (client == null) {
        usedClient.close(); // закрываем только если мы сами создавали клиент
      }
    }
  }

}
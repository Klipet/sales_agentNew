import 'dart:convert';

import 'package:sales_agent/data/models_api/models_actie_price/client_price_response.dart';
import 'package:sales_agent/data/models_api/models_actie_price/post_client_prices_request.dart';
import 'package:http/http.dart' as http;
import '../../repositories/apikey_repositori.dart';
import '../../repositories/login_repositori.dart';

class PriceActieApi{
  ApikeyRepository apikeyRepository = ApikeyRepository();

  Future<ClientPriceResponse> postActiePrice({
  required Map<String, dynamic> model
  }) async{
    final url = await apikeyRepository.getUrl();
    try{
      final jsonString = jsonEncode(model);
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl).resolve('json/GetClientPrices');

      final response = await http.post(urlPars,
        headers: {
          'Content-Type': 'application/json; charset=utf-8', // ✅ ОБЯЗАТЕЛЬНО!
          'Accept': 'application/json',
        },
        body: jsonString,
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return ClientPriceResponse.fromJson(json);
      } else {
        throw Exception('Ошибка сервера: ${response.statusCode}');
      }


    }catch(e,  stack){
      throw Exception(
        'Ошибка сервера 2: ${e}, ${stack}',
      );
    }
  }
}
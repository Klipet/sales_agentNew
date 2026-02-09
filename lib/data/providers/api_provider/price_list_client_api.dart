import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models_api/models_client_prices/client_prices.dart';
import '../../repositories/apikey_repositori.dart';
import '../../repositories/login_repositori.dart';

class PriceListClientApi {
  LoginRepository loginRepository = LoginRepository();
  ApikeyRepository apikeyRepository = ApikeyRepository();

  Future<ClientPrices> getClientPrice() async {
    final url = await apikeyRepository.getUrl();
    final token = await loginRepository.getToken();
    try{
      final baseUrl = url!.endsWith("/") ? url : "$url/";
      final urlPars = Uri.parse(baseUrl)
          .resolve('json/GetClientPriceLists?tokenUid=$token');
      final ordersResponse = await http.get(urlPars).timeout(Duration(minutes: 1));
      if(ordersResponse.statusCode == 200){
        final response = jsonDecode(ordersResponse.body);
  //      print(response);
        final dataResponse = ClientPrices.fromJson(response);
  //      print(dataResponse.priceLists);
        return dataResponse;
      }else{
        throw Exception("Ошибка PriceListClientApi: ${ordersResponse.statusCode}");
      }
    }catch(e){
      throw Exception("Ошибка при загрузки PriceListClientApi: ${e.toString()}");
    }
  }
}
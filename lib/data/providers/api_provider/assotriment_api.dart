import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sales_agent/data/models_api/models_assortiment/assortiment_model.dart';
import 'package:sales_agent/data/models_api/models_assortiment/assortiment_response.dart';

import '../../../services/app_logger.dart';
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
      final aslResponse = await http.get(urlPars).timeout(Duration(minutes: 5));
      if(aslResponse.statusCode == 200){
        final response = jsonDecode(aslResponse.body);
        final dataResponse = AssortimentResponse.fromJson(response);
        if(dataResponse.errorCode == 0){
          return dataResponse.assortiment;
        }else{
          await AppLogger().log(
            action: 'AssortimentApi',
            message: dataResponse,
            type: 2,
          );
          throw Exception("Ошибка Assortiment: ${dataResponse.errorCode}");
        }
      }else{
        throw Exception("Ошибка Assortiment: ${aslResponse.statusCode}");
      }
    }catch(e){
      return [];
    }
  }
}
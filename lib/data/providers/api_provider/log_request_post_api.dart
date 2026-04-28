import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:sales_agent/data/models_api/models_api_server/log_response.dart';

import '../../../core/constans.dart';
import '../../models_api/models_api_server/log_request.dart';
import '../../repositories/apikey_repositori.dart';

class LogRequestPostApi{
  ApikeyRepository apikeyRepository = ApikeyRepository();
  final deviceInfoPlugin = DeviceInfoPlugin();
  final Constant constants = Constant();
  final info = NetworkInfo();

  Future<void> logPostServer({required LogRequest logRequest}) async {
    const env = String.fromEnvironment('ENV');
    try{
    String baseUrl = env == 'dev'
        ? constants.API_LOG_DEV
        : constants.API_LOG;
    String password = env == 'dev'
        ? constants.PASSWORDLOG_DEV
        : constants.PASSWORDLOG;

    final url = Uri.parse('${baseUrl}App/Event');
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('${constants.USERNAMELOG}:${password}'))}';

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
      body: jsonEncode(logRequest.toJson()),
    ).timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {

    }else{

    }
    }catch(e){}
  }
}
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:sales_agent/data/models_api/model_reg_app.dart';
import 'package:sales_agent/data/models_api/model_response.dart';

import '../../../core/constans.dart';
import '../../repositories/apikey_repositori.dart';

class ActivationApi {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final Constant constants = Constant();
  final info = NetworkInfo();

  Future<ModelResponse?> activationLicense(String licenseCode) async {
    ModelRegApp deviceInfo;
    if (Platform.isAndroid) {
      deviceInfo = await platformAndroid(licenseCode);
    } else {
      deviceInfo = await platformWindows(licenseCode);
    }
    try {
      final url = Uri.parse('${constants.API_LICENSE}RegisterApplication');
      final String basicAuth =
          'Basic ${base64Encode(utf8.encode('${constants.USERNAME}:${constants.PASSWORD}'))}';
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': basicAuth,
        },
        body: jsonEncode(deviceInfo.toJson()),
      ).timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        final apiResponse = ModelResponse.fromJson(responseJson);

        if (apiResponse.errorCode == 0 && apiResponse.appData != null) {
          return apiResponse;
        }else if(apiResponse.errorCode == 124){
          throw Exception('errors.incorrectLicense'.tr());
        }
      }
    } catch (e) {
      throw Exception("Ошибка сервера: ${e.toString()}");
    }

    return null;
  }

  Future<ModelRegApp> platformWindows(String license) async {
    try {
      WindowsDeviceInfo windows = await deviceInfoPlugin.windowsInfo;
      final String applicationVersion = '1.0.0';
      final String deviceID = windows.deviceId;
      final String deviceModel = windows.computerName;
      final String deviceName = windows.productName;
      final String osVersion = windows.productId;
      final int osType = constants.salesAgent;

      final String? privateIP = await info.getWifiIP();
      final String publicIP = await getPublicIP();

      final String salePointAddress = '123 Main St';
      final String serialNumber = windows.releaseId;
      final String workplace = 'Office';
      final String licenseActivationCode = license;
      return ModelRegApp(
        applicationVersion: applicationVersion,
        deviceID: deviceID,
        deviceModel: deviceModel,
        deviceName: deviceName,
        licenseActivationCode: licenseActivationCode,
        osType: osType,
        osVersion: osVersion,
        privateIP: privateIP ?? 'Unknown',
        publicIP: publicIP,
        salePointAddress: salePointAddress,
        serialNumber: serialNumber,
        workplace: workplace,
      );
    } catch (e) {
      throw Exception("ошибка platform windows: ${e.toString()}");
    }
  }

  Future<ModelRegApp> platformAndroid(String license) async {
    try {
      AndroidDeviceInfo android = await deviceInfoPlugin.androidInfo;
      final String applicationVersion = '1.0.0';
      final String deviceID = android.id;
      final String deviceModel = android.model;
      final String deviceName = android.device;
      final String osVersion = android.version.baseOS ?? '';
      final int osType = constants.salesAgent;
      final String? privateIP = await info.getWifiIP();
      final String publicIP = await getPublicIP();

      final String salePointAddress = '123 Main St';
      final String serialNumber = android.serialNumber;
      final String workplace = 'Office';
      final String licenseActivationCode = license;
      return ModelRegApp(
        applicationVersion: applicationVersion,
        deviceID: deviceID,
        deviceModel: deviceModel,
        deviceName: deviceName,
        licenseActivationCode: licenseActivationCode,
        osType: osType,
        osVersion: osVersion,
        privateIP: privateIP ?? 'Unknown',
        publicIP: publicIP,
        salePointAddress: salePointAddress,
        serialNumber: serialNumber,
        workplace: workplace,
      );
    } catch (e) {
      throw Exception("ошибка platform android: ${e.toString()}");
    }
  }

  Future<String> getPublicIP() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.ipify.org?format=json'),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['ip'];
      } else {
        throw Exception('Failed to get public IP');
      }
    } catch (e) {
      print('Error fetching public IP: $e');
      return 'Unknown';
    }
  }
}

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoModel {
  final String? deviceId;
  final String? model;
  final String? brand;
  final String? os;
  final String? osVersion;
  final String? sdk;
  final String? ip;
  final String? manufacturer;
  final String? isPhysicalDevice;

  DeviceInfoModel({
    this.deviceId,
    this.model,
    this.brand,
    this.os,
    this.ip,
    this.osVersion,
    this.sdk,
    this.manufacturer,
    this.isPhysicalDevice,
  });

  Map<String, dynamic> toJson() => {
    'deviceId': deviceId,
    'model': model,
    'brand': brand,
    'os': os,
    'ip': ip,
    'osVersion': osVersion,
    'sdk': sdk,
    'manufacturer': manufacturer,
    'isPhysicalDevice': isPhysicalDevice,
  };
}

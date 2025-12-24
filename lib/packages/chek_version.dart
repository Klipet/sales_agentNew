import 'package:package_info_plus/package_info_plus.dart';

Future<void> checkVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String appName = packageInfo.appName;

  String version = packageInfo.version;      // 1.2.3
  String buildNumber = packageInfo.buildNumber; // 45

  print('Version: $version+$buildNumber');
}
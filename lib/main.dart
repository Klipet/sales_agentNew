import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/providers/api_provider/log_request_post_api.dart';
import 'package:sales_agent/packages/chek_version.dart';
import 'package:sales_agent/presentation/screens/splash_screen.dart';
import 'package:sales_agent/routes/app_pouts.dart';
import 'package:sales_agent/services/app_logger.dart';
import 'dart:io';

import 'data/providers/internet_provider.dart';
import 'data/providers/navigator_provider.dart';
import 'data/repositories/apikey_repositori.dart';
import 'data/repositories/db_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await DbProvider.instance();
  await EasyLocalization.ensureInitialized();
  AppLogger().init(
    logService: LogRequestPostApi(),
    apiKeyRepository: ApikeyRepository(),
  );
  runApp(
        EasyLocalization(
          supportedLocales: [
            Locale('en', 'GB'),
            Locale('ru', 'RU'),
            Locale('ro', 'RO'),
          ],
          path: 'assets/translations',
          startLocale: Locale('ro', 'RO'),
          fallbackLocale: Locale('ro', 'RO'),
          child: ChangeNotifierProvider(
            create: (_) => NavigationProvider(),
            child: MyApp(),
          ),
        )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    checkVersion();
    return ScreenUtilInit(
      designSize: const Size(1280, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: AppRoutes.home,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          builder: (context, widget) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0)
            ), child: widget!,
          ),
          theme: ThemeData(
            scaffoldBackgroundColor: primariColor,
          ),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: Splashscreen(),
    );
  }
}

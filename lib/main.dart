import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/presentation/screens/activation_screen.dart';
import 'package:sales_agent/presentation/screens/splash_screen.dart';
import 'package:sales_agent/routes/app_pouts.dart';
import 'dart:io';

import 'data/providers/navigator_provider.dart';
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

  runApp(
        EasyLocalization(
          supportedLocales: [
            Locale('en', 'EN'),
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

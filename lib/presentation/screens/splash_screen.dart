import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_agent/data/providers/api_provider/splash_api.dart';
import 'package:sales_agent/data/repositories/apikey_repositori.dart';
import 'package:sales_agent/logic/blocs/splash_bloc/splash_bloc.dart';
import 'package:sales_agent/presentation/screens/activation_screen.dart';

import '../../logic/blocs/splash_bloc/splash_event.dart';
import '../../logic/blocs/splash_bloc/splash_state.dart';
import 'login_screen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(ApikeyRepository(), SplashApi()),
      child: SplashScreenUI(),
    );
  }
}

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  static const colorizeColors = [
    Colors.green,
    Colors.blue,
    Colors.white,
    Colors.red,
  ];
  static const colorizeTextStyle = TextStyle(
    fontSize: 90.0,
    fontFamily: 'RobotoBolt',
  );
  @override
  void initState() {
    super.initState();
    // 👉 Запуск проверки APIKey при старте
    Future.microtask(() {
      context.read<SplashBloc>().add(GetUrlEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false,
              );
            } else if (state is SplashError) {
              print(state.errorMessage);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ActivationScreen()),
                (Route<dynamic> route) => false,
              );
            }
          },
          child:  AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'SALES AGENT',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
              ],
              isRepeatingAnimation: true,
              pause: const Duration(microseconds: 900),
            )
        ),
      ),
    );
  }
}

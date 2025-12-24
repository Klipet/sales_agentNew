import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_agent/data/providers/api_provider/splash_api.dart';
import 'package:sales_agent/data/repositories/apikey_repositori.dart';
import 'package:sales_agent/logic/blocs/splash_bloc/splash_bloc.dart';
import 'package:sales_agent/presentation/screens/activation_screen.dart';
import 'package:sales_agent/presentation/toast/toast_response_error.dart';

import '../../core/styles_text.dart';
import '../../data/providers/internet_provider.dart';
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
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (Route<dynamic> route) => false,
            );
          } else if (state is SplashError) {
            print(state.errorMessage);
            if(state.errorMessage == ""){
              ToastResponseError(context: context, textError: 'toast.netError'.tr()).showErrorConnect();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false,
              );
            }else{
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ActivationScreen()),
                    (Route<dynamic> route) => false,
              );
            }
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/splash_logo.svg', width: 352.w, height: 352.h,),
              SizedBox(height: 16.h,),
              Text('SALES AGENT',
                  style: primareFont),
            ],
          ),
        )
      ),
    );
  }
}

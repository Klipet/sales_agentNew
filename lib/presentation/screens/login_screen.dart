import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';
import 'package:sales_agent/presentation/toast/toast_response_error.dart';
import 'package:sales_agent/presentation/widgets/auth_login_widget.dart';

import '../../core/styles_text.dart';
import '../../data/providers/internet_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isConnected = true;

  
  @override
  void initState() {
    super.initState();
    internetCheck();
  }

  Future<void> internetCheck() async {
    final resault = await InternetConnectivity().hasInternetConnection;
    setState(() {
      isConnected = resault;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('SALES AGENT',
                style: primareFont),
            SizedBox(height: 26.h), // отступ перед формой
            AuthLoginWidget(internet: isConnected,),
          ],
        ),
      ),
    );
  }
}

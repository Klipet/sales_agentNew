import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sales_agent/presentation/widgets/auth_login_widget.dart';

import '../../core/styles_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 72.w),
            child: Center(
              child: Text('SALES AGENT',
                  style: primareFont),
            ),
          ),
          SizedBox(height: 26.h), // отступ перед формой
          Center(
            child: AuthLoginWidgetUI(), // используем полноценный UI виджет
          ),
        ],
      ),
    );
  }
}

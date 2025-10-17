import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sales_agent/presentation/screens/create_orders_screen/two_step_create.dart';

import '../../../core/styles_text.dart';
import '../../../core/utils/costom_sidebar.dart';
import '../../widgets/title_home_widget.dart';
import '../assortiment_screen.dart';
import '../clients_screen.dart';
import '../home_screen.dart';
import '../orders_screen.dart';

class FirstStepCreate extends StatefulWidget {
  const FirstStepCreate({super.key});

  @override
  State<FirstStepCreate> createState() => _FirstStepCreateState();
}

class _FirstStepCreateState extends State<FirstStepCreate>  {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 40.w),
              SizedBox(
                width: 386.w,
                height: 100.h,
                child: Text(
                  textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: false
                  ),
                  "client.title".tr(),
                  style: primaFontOrders,
                  textAlign: TextAlign.left,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: TitleHomeWidget(),
              ),
            ],
          ),
        ],
      )
    );
  }
}

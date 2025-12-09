import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/presentation/screens/settings_screens/setting_widgets/widget_info.dart';
import 'package:sales_agent/presentation/screens/settings_screens/setting_widgets/widget_language.dart';
import 'package:sales_agent/presentation/screens/settings_screens/setting_widgets/widget_password.dart';
import 'package:sales_agent/presentation/screens/settings_screens/setting_widgets/widget_uppdate.dart';
import 'package:sales_agent/presentation/widgets/title_home_widget.dart';

import '../../../core/colors_app.dart';
import '../../../core/styles_text.dart';
import '../../../data/providers/navigator_provider.dart';

class SettingScrean extends StatefulWidget {
  const SettingScrean({super.key});

  @override
  State<SettingScrean> createState() => _SettingScreanState();
}

class _SettingScreanState extends State<SettingScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 40.w),
              SizedBox(
                height: 100.h,
                child: Text(
                  textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: false
                  ),
                  'Setări',
                  style: primaFontOrders,
                  //  textAlign: TextAlign.left,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: TitleHomeWidget(),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 16.h),
              decoration: BoxDecoration(
                color: containerColor,
                border: BoxBorder.all(color: borderColor, width: 1.w),
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetUppdate(),
                  Divider(height: 1, color: borderColor,indent: 16.h,endIndent: 16.h,),
                  WidgetInfo(),
                  SizedBox(height: 16.h,),
                  Divider(height: 1, color: borderColor,indent: 16.h,endIndent: 16.h,),
                  WidgetLanguage(),
                  Divider(height: 1, color: borderColor,indent: 16.h,endIndent: 16.h,),
                  Spacer(),
                  WidgetPassword(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

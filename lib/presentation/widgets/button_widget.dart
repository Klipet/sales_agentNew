import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/presentation/screens/create_orders_screen/first_step_create.dart';
import 'package:sales_agent/routes/app_pouts.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../data/providers/navigator_provider.dart';

Widget btCreate({required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      print("create");
      Provider.of<NavigationProvider>(context, listen: false).goToPage(6);
    },
    child: Container(
      width: 272.w,
      height: 48.h,
      //  padding: EdgeInsets.only(top: 8.h, bottom: 7.h),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(100.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.add_rounded, size: 32.r, color: containerColor),
          SizedBox(height: 4.h),
          Text("Comandă nouă", style: textStyleBtCreateOrder),
        ],
      ),
    ),
  );
}
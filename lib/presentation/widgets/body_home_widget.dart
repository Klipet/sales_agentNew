import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';

class BodyHomeWidget extends StatelessWidget {
  const BodyHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216.h,
      padding: EdgeInsets.only(left: 8.h),
      decoration: BoxDecoration(
          color: containerColor,
          border: BoxBorder.all(
              color: borderColor,
              width: 1.w
          ),
          borderRadius: BorderRadius.all(Radius.circular(30.r))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              titleBodyCard('home.bodyTotal'.tr(), 'assets/icons/home/total.png', 32),
              buttonBodyCard('home.bodyBtTotal'.tr(), buttonColor)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              titleBodyCard('home.bodyTotal'.tr(), 'assets/icons/home/total.png', 32),
              buttonBodyCard('home.bodyBtTotal'.tr(), buttonColor)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              titleBodyCard('home.bodyTotal'.tr(), 'assets/icons/home/total.png', 32),
              buttonBodyCard('home.bodyBtTotal'.tr(), buttonColor)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              titleBodyCard('home.bodyTotal'.tr(), 'assets/icons/home/total.png', 32),
              buttonBodyCard('home.bodyBtTotal'.tr(), buttonColor)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              titleBodyCard('home.bodyTotal'.tr(), 'assets/icons/home/total.png', 32),
              buttonBodyCard('home.bodyBtTotal'.tr(), buttonColor)
            ],
          ),


        ],
      ),
    );
  }



  Widget buttonBodyCard(String text, HexColor color){
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            color: color,
            border: BoxBorder.all(
                color: borderColor,
                width: 1.w
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.r), bottomRight: Radius.circular(30.r))
        ),
        width: 200.w,
        height: 53.h,
        margin: EdgeInsets.only(bottom: 32.h,),
        padding: EdgeInsets.only(bottom: 10.h,top: 11.h),
        child: Center(
          child: Text(text, style: textStyleHomeSubTitle,),
        ),
      )
    );
  }

  Widget titleBodyCard(String title, String img, int count){
    return Container(
      width: 200.w,
        height: 91.h,
        margin: EdgeInsets.only(top: 32.h, bottom: 5.h, left: 20.w, ),
      padding: EdgeInsets.only(top: 16.h,left:  18.w, right: 19.w, bottom: 8.h),
      decoration: BoxDecoration(
          color: colorDividerSelected,
          border: BoxBorder.all(
              color: borderColor,
              width: 1.w
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img),
              Text(title),
            ],
          ),
          Text(count.toString()),
        ],
      ),
    );
  }
}

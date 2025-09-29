import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../colors_app.dart';
import '../styles_text.dart';

List<PopupMenuEntry<String>> popMenuSetting(BuildContext context) {
  return [
    PopupMenuItem<String>(
      height: 48.h,
      value: 'edit',
      child: SizedBox(
      //  width: 314.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/pop/edit.svg',
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 17.w),
            Expanded(
              child: Text(
                'pop.edit'.tr(),
                style: textStylePopMenu,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
    PopupMenuDivider(color: borderColor,// thickness: 1.w,
        height: 1.h),
    PopupMenuItem<String>(
      height: 48.h,
      value: 'create',
      child: SizedBox(
      //  width: 314.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/pop/dialog_sablon.svg',
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 17.w),
            Expanded(
              child: Text(
                'pop.create'.tr(),
                style: textStylePopMenu,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
    PopupMenuDivider(color: borderColor,// thickness: 1.w,
        height: 0.5.h),
    PopupMenuItem<String>(
      height: 48.h,
      value: 'delete',
      child: SizedBox(
      //  width: 314.w,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/pop/trash.svg',
              width: 24.w,
              height: 24.h,
              color: Colors.black,
            ),
            SizedBox(width: 17.w),
            Expanded(
              child: Text(
                'pop.mark'.tr(),
                style: textStylePopMenu,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
  ];
}

//  PopupMenuButton<String>(
//  color: containerColor,
//  shape: RoundedRectangleBorder(
//    side: BorderSide(color: borderColor, width: 1.w),
//    borderRadius: BorderRadius.circular(15.r),
//  ),
//  offset: Offset(-15.w, 45.h),
//  onSelected: (value) {
//    print("Выбрано: $value");
//  },
//
//  itemBuilder: (BuildContext context) =>

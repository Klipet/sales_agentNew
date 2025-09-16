import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';

class ListDriver {


  SidebarXTheme dividerSidebarXTheme(double size) {
    return SidebarXTheme(
      width: size.w,
      padding: EdgeInsets.only(left: 24.r, right: 24.r),
      itemTextPadding: EdgeInsets.only(left: 17.r),
      selectedItemTextPadding: EdgeInsets.only(left: 17.r),
      decoration: BoxDecoration(color: containerColor),
      selectedItemDecoration: BoxDecoration(
        color: colorDividerSelected,
        border: BoxBorder.all(color: borderColor, width: 1.r),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      itemDecoration: BoxDecoration(
        border: BoxBorder.all(color: borderColor, width: 1.r),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      textStyle: textStyleDriver,
      selectedTextStyle: textStyleDriver,
      hoverTextStyle: textStyleDriver,
      hoverIconTheme: IconThemeData(
          color: Colors.black
      )
    );
  }

  SidebarXTheme dividerSidebarXThemeExpanded(double size) {
    return SidebarXTheme(
      width: size.w,
      padding: EdgeInsets.only(left: 24.r, right: 24.r),
      itemTextPadding: EdgeInsets.only(left: 17.r),
      selectedItemTextPadding: EdgeInsets.only(left: 17.r),
      decoration: BoxDecoration(color: containerColor),
      selectedItemDecoration: BoxDecoration(
        color: colorDividerSelected,
        border: BoxBorder.all(color: borderColor, width: 1.r),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      itemDecoration: BoxDecoration(
        border: BoxBorder.all(color: borderColor, width: 1.r),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      textStyle: textStyleDriver,
      selectedTextStyle: textStyleDriver,
      hoverTextStyle: textStyleDriver,
        hoverIconTheme: IconThemeData(
            color: Colors.black
        )
    );
  }
}

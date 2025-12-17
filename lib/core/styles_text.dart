import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors_app.dart';

final primareFont = GoogleFonts.montserrat(
  fontWeight: FontWeight.w800,
  fontStyle: FontStyle.normal,
  fontSize: 90.sp,
  color: titleColorText,
  shadows: [
    Shadow(offset: Offset(0, 4.h), blurRadius: 4.r, color: Color(0x08000000)),
  ],
);
final primaFontOrders = GoogleFonts.poppins(
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
  fontSize: 80.sp,
  color: titleColorText,
  shadows: [
    Shadow(offset: Offset(0, 4.h), blurRadius: 4.r, color: Color(0x08000000)),
  ],
);
final autentificare = GoogleFonts.montserrat(
  fontWeight: FontWeight.w600,
  fontStyle: FontStyle.normal,
  fontSize: 25.sp,
  color: textColor,
);
final titleCardInfo = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
  fontSize: 15.sp,
  color: subTextColor,
);

final textHint = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
  fontSize: 18.sp,
  color: textColor,
);
final buttonTextStyle = GoogleFonts.montserrat(
  fontWeight: FontWeight.w600,
  fontStyle: FontStyle.normal,
  fontSize: 20.sp,
  height: 1,
  color: titleColorText,
);

final textStyleDriver = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  fontSize: 16.sp,
  color: textColor
);

final textStyleHomeTitle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
    color: subTextColor
);

final textStyleHomeSubTitle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 18.sp,
    color: textColor
);
final textStyleHomeTime = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: textColor
);
final textStyleBodyTitle = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: subTextColor
);
final textStyleBodyTitleCount = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 32.sp,
    height: 1,
    color: subTextColor
);
final textStyleBodyBt = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 18.sp,
    height: 1,
    color: titleColorText
);
final textStyleBodyBtCreate = GoogleFonts.montserrat(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 23.sp,
    color: titleColorText
);
final textStyleTitleCalendar = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 18.sp,
    color: textColor
);
final textStyleDayNamesCalendar = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 13.sp,
    color: subTextColor
);
final textStyleDayCalendar = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: colorTextBlack
);
final textStyleDayNexCalendar = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: subTextColor
);
final textStyleCalendarOrder = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
    color: subTextColor
);
final textStyleCalendarCount = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: titleColorText
);
final textStyleDialogday = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: textColor
);
final textStyleDialogInfoClient = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: textColor
);
final textStyleDialogInfoOrder = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 18.sp,
    color: subTextColor
);
final textStyleDialogBt = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: titleColorText
);


final textStyleDialogOrderData = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 18.sp,
    color: textColor
);
final textStyleDialogOrderSub = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 15.sp,
    color: textColor
);
final textStyleDialogOrderTitle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
    color: subTextColor
);
final textStyleDialogOrderContent = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: textColor
);
final textStyleDialogOrderTotal = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: textColor
);
final textStyleDialogOrderSum = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 20.sp,
    color: textColor
);
final textStylePopMenu = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 17.sp,
    color: textColor
);
final textStyleHintOrder = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
    color: subTextColor
);
final textStyleBtCreateOrder = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 23.sp,
    color: containerColor
);
final textStyleBtOrderRow = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: textColor
);
final textStyleAslTitle = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: subTextColor
);
final textStyleAslContent = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: textColor
);
final textStyleAslContentSub = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: textColor
);
final textStyleAslContentPriceSub = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: textColor
);
final textStyleSearchClient = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16.sp,
    color: textColor
);
final textHintSearchClient = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
  fontSize: 18.sp,
  color: subTextColor,
);

final textStyleSerachTitle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w800,
    fontSize: 18.sp,
    color: textColor
);
final textStyleSerachTitleIDNO = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: subTextColor
);
final textStyleOutlandsText = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontSize: 15.sp,
    color: textColor
);
final textStyleBtAslAdd = GoogleFonts.montserrat(
    fontWeight: FontWeight.w700,
    fontSize: 23.sp,
    color: containerColor
);
final textStyleTitleAslAdd = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: textColor
);
final textStyleTitleAddAssotrimentOrder = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 23.sp,
    color: textColor,
    decoration: TextDecoration.none
);
final textStyleRemainAddAssotrimentOrder = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontSize: 16.sp,
    color: textColor,
    decoration: TextDecoration.none
);

final textStyleDialogAddAssortimentTotal = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 23.sp,
    color: textColor,
    decoration: TextDecoration.none
);
final textStyleDialogAddAssortimentTotalNegative = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 23.sp,
    color: subTextColor,
    decoration: TextDecoration.none
);
final textStyleDialogAddAssortimentTotalInfo = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
    color: primariColor,
    decoration: TextDecoration.none
);
final textStyleTableCount = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: textColor,
    decoration: TextDecoration.none
);
final textStyleTableDialogDelete = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 19.sp,
    color: textColor,
    decoration: TextDecoration.none
);

final textStyleDelogare = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontSize: 16.sp,
    color: textColor,
    decoration: TextDecoration.none
);
final textStyleDialogClient = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 32.sp,
    color: borderColor,
    decoration: TextDecoration.none
);
final textStyleDialogClientInfo = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 19.sp,
    color: textColor,
    decoration: TextDecoration.none
);










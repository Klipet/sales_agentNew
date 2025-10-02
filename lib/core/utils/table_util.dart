import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/core/constans.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../colors_app.dart';
import '../styles_text.dart';

Alignment textAlignContent(DataGridCell<dynamic> cell) {
  if (cell.columnName == 'denumire') {
    return Alignment.centerLeft;
  } else if (cell.columnName == 'nr') {
    return Alignment.center;
  }
  return Alignment.centerRight;
}

EdgeInsets textPaddingContent(DataGridCell<dynamic> cell) {
  if (cell.columnName == 'denumire') {
    return EdgeInsets.only(left: 8.r);
  } else if (cell.columnName == 'nr') {
    return EdgeInsets.zero;
  }
  return EdgeInsets.only(right: 8.r);
}

Border borderSideTable(DataGridCell<dynamic> cell) {
  if (cell.columnName == 'sum') {
    return Border(
      //   right:BorderSide(color: borderColor, width: 1.w),
      bottom: BorderSide(color: borderColor, width: 0.5.w),
      top: BorderSide(color: borderColor, width: 0.5.w),
    );
  }
  return Border(
    right: BorderSide(color: borderColor, width: 1.w),
    bottom: BorderSide(color: borderColor, width: 0.5.w),
    top: BorderSide(color: borderColor, width: 0.5.w),
  );
}

Text textContentTable(DataGridCell<dynamic> cell) {
  final constData = Constant();
  if (cell.columnName == 'status') {
    if (cell.value == constData.SABLON.toString()) {
      return Text('tableStatus.save'.tr(), style: textStyleDialogOrderContent);

    } else if (cell.value == constData.ASTEPTARE.toString()) {
      return Text('tableStatus.queue'.tr(), style: textStyleDialogOrderContent);

    } else if (cell.value == constData.INLUCRU.toString()) {
      return Text('tableStatus.procces'.tr(), style: textStyleDialogOrderContent);

    }
    return Text('tableStatus.final'.tr(), style: textStyleDialogOrderContent);
  }
  if(cell.columnName == 'address'){
    if(cell.value == null){
      return Text('----------', style: textStyleDialogOrderContent);
    }
  }
  if(cell.columnName == 'data'){
    final formatDay = DateFormat('dd.MM.yyyy').format(cell.value);
    return Text(formatDay, style: textStyleDialogOrderContent);
  }
  return Text(cell.value.toString(), style: textStyleDialogOrderContent);
}

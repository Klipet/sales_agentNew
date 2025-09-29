import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
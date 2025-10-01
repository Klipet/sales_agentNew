import 'package:flutter/material.dart';

EdgeInsets textPaddingContent(int index) {
  if (index.columnName == 'denumire') {
    return EdgeInsets.only(left: 8.r);
  } else if (cell.columnName == 'nr') {
    return EdgeInsets.zero;
  }
  return EdgeInsets.only(right: 8.r);
}
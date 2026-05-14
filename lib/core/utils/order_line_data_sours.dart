import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/core/utils/table_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../data/models_db/model_db_orders/model_lines_db.dart';
import '../colors_app.dart';
import '../styles_text.dart';

class OrderLinesDataSource extends DataGridSource {
  final List<ModelLinesDb> dataLines;

  OrderLinesDataSource(this.dataLines) {
    _rows = dataLines.asMap().entries.map((entry) {
      final line = entry.value;

      return DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'nr', value: line.lineNumber),
          DataGridCell<String>(
            columnName: 'denumire',
            value: line.assortimentName,
          ),
          DataGridCell<String>(columnName: 'cod', value: line.assortimentCode),
          DataGridCell<double>(columnName: 'cant', value: line.count),
          DataGridCell<double>(columnName: 'pret', value: line.price),
          DataGridCell<double>(
            columnName: 'priceSp',
            value: line.priceSpecial ?? 0.0,
          ),
          DataGridCell<double>(
            columnName: 'priceActie',
            value: line.priceActie ?? 0.0,
          ),
          DataGridCell<double>(
            columnName: 'suma',
            value: double.tryParse(line.sum.toStringAsFixed(2)),
          ),
        ],
      );
    }).toList();
  }

  late List<DataGridRow> _rows;

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        if (cell.columnName == 'pret') {
          // получаем value из priceSp
          final priceSpValue =
              row.getCells().firstWhere((c) => c.columnName == 'priceSp').value
                  as double?;
          final price =
              row.getCells().firstWhere((c) => c.columnName == 'pret').value
                  as double?;
          final priceActie =
              row
                  .getCells()
                  .firstWhere((c) => c.columnName == 'priceActie')
                  .value
                  as double?;
          print("$priceSpValue == $price == $priceActie");
          if (priceSpValue == price) {
            return Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 8.r),
              decoration: BoxDecoration(
                color: containerColor,
                border: borderSideTable(cell),
              ),
              child: Text(
                priceSpValue!.toStringAsFixed(2),
                style: textStyleDialogOrderContent.copyWith(color: Colors.red),
              ),
            );
          } else if (priceActie! > 0) {
            return Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 8.r),
              decoration: BoxDecoration(
                color: containerColor,
                border: borderSideTable(cell),
              ),
              child: Text(
                priceActie!.toStringAsFixed(2),
                style: textStyleDialogOrderContent.copyWith(color: Colors.red),
              ),
            );
          } else {
            return Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 8.r),
              decoration: BoxDecoration(
                color: containerColor,
                border: borderSideTable(cell),
              ),
              child: Text(
                price!.toStringAsFixed(2),
                style: textStyleDialogOrderContent,
              ),
            );
          }
        } else if (cell.columnName == 'suma') {
          return Container(
            alignment: textAlignContent(cell),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: borderColor, width: 0.5.w),
                right: BorderSide(color: borderColor, width: 0.5.w),
                bottom: BorderSide(color: borderColor, width: 0.5.w),
              ),
            ),
            child: Container(
              padding: textPaddingContent(cell),
              child: Text(
                cell.value.toStringAsFixed(2),
                style: textStyleDialogOrderContent,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        } else if (cell.columnName == 'cant') {
          return Container(
            alignment: textAlignContent(cell),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: borderColor, width: 0.5.w),
                right: BorderSide(color: borderColor, width: 0.5.w),
                bottom: BorderSide(color: borderColor, width: 0.5.w),
              ),
            ),
            child: Container(
              padding: textPaddingContent(cell),
              child: Text(
                (cell.value as double).toStringAsFixed(3),
                style: textStyleDialogOrderContent,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        } else {
          return Container(
            alignment: textAlignContent(cell),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: borderColor, width: 0.5.w),
                right: BorderSide(color: borderColor, width: 0.5.w),
                bottom: BorderSide(color: borderColor, width: 0.5.w),
              ),
            ),
            child: Container(
              padding: textPaddingContent(cell),
              child: Text(
                cell.value.toString(),
                style: textStyleDialogOrderContent,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        }
      }).toList(),
    );
  }
}

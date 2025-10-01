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
          DataGridCell<String>(columnName: 'denumire', value: line.assortimentName),
          DataGridCell<double>(columnName: 'cant', value: line.count),
          DataGridCell<double>(columnName: 'pret', value: line.price),
          DataGridCell<double>(columnName: 'suma', value: line.sum),
          DataGridCell<int>(columnName: 'stocuri', value: line.id),
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
        return Container(
          alignment: textAlignContent(cell),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: borderColor, width: 0.5.w
              ),
              right: BorderSide(
                  color: borderColor, width: 0.5.w
              ),
              bottom: BorderSide(
                  color: borderColor, width: 0.5.w
              ),
            )
          ),
          child: Container(
            padding: textPaddingContent(cell),
            child: Text(
              cell.value.toString(), style: textStyleDialogOrderContent,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
    );
  }
}
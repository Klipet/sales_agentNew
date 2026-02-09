import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

abstract class TableConfig<T> {
  List<DataGridRow> buildRows(List<T> data);
  List<GridColumn> getColumns();
  String get emptyText;
}

class UniversalDataGridSource<T> extends DataGridSource {
  final TableConfig<T> config;
  final List<T> data;

  UniversalDataGridSource({
    required this.data,
    required this.config,
  });

  @override
  List<DataGridRow> get rows => config.buildRows(data);

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: _buildCells(row));
  }

  List<Widget> _buildCells(DataGridRow row) {
    return row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          dataGridCell.value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      );
    }).toList();
  }
}
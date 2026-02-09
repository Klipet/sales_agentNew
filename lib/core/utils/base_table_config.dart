// Базовый конфиг
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

abstract class BaseTableConfig<T> {
  List<DataGridRow> buildRows(List<T> data);

  List<GridColumn> getColumns(BuildContext context);

  Widget buildCell(DataGridCell cell);

  String get emptyText;
}

// Универсальный источник данных
class UniversalDataGridSource<T> extends DataGridSource {
  final List<T> data;
  final BaseTableConfig<T> config;

  UniversalDataGridSource({required this.data, required this.config});

  @override
  List<DataGridRow> get rows => config.buildRows(data);

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return config.buildCell(cell);
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/core/utils/table_util.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_client_db.dart';
import 'package:sales_agent/data/repositories/client_repositori.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../colors_app.dart';

class ClientDataSource extends DataGridSource{

  List<DataGridRow> _rows = [];
  List<ModelClientDb> _clientList = [];


  void updateData(List<ModelClientDb> client) {
    _clientList = client;
    _rows = client.map((client) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'cod', value: client.code ?? '----'),
        DataGridCell<String>(columnName: 'name', value: client.name ?? '----'),
        DataGridCell<String>(columnName: 'idno', value: client.idnp ?? '----'),
        DataGridCell<int>(columnName: 'outlans', value: client.outlets.length ?? 0),
        DataGridCell<double>(columnName: 'balance', value: client.balance),
      ]);
    }).toList();

    notifyListeners(); // чтобы DataGrid обновился
  }
  @override
  List<ModelClientDb> get clientList => _clientList;

  @override
  List<DataGridRow> get rows => _rows;


  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        cell.value.toString();
        return clientAligment(cell);
      }).toList(),
    );
  }
}
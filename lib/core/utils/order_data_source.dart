import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/core/utils/table_util.dart';
import 'package:sales_agent/data/models_db/model_db_new_order/new_order_model_db.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../data/models_db/model_db_orders/model_document_db.dart';
import '../styles_text.dart';

class OrderDataSource extends DataGridSource{

  List<DataGridRow> _rows = [];
  List<ModelDocumentDb> _ordersList = [];
  List<NewOrderModelDb> _ordersListNew = [];



  void updateData(List<ModelDocumentDb> orders,{ List<NewOrderModelDb>? localOrders}) {
    _ordersList = orders;

    if(localOrders != null){
      _ordersListNew = localOrders;
    }

    _rows =[... _ordersListNew.map((order)=>DataGridRow(cells: [
     
    DataGridCell<String>(columnName: 'nr', value: order.code),
    DataGridCell<DateTime>(columnName: 'data', value: DateTime.tryParse(order.dateValid)),
    DataGridCell<String>(columnName: 'client', value: order.clientName),
    DataGridCell<String>(columnName: 'address', value: order.deliveryAddress),
    DataGridCell<String>(columnName: 'status', value: order.state.toString()),
    DataGridCell<double>(columnName: 'sum', value: order.sum),
    ])),...orders.map((order) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'nr', value: order.code),
        DataGridCell<DateTime>(columnName: 'data', value: order.dateValid),
        DataGridCell<String>(columnName: 'client', value: order.clientName),
        DataGridCell<String>(columnName: 'address', value: order.deliveryAddress),
        DataGridCell<String>(columnName: 'status', value: order.state.toString()),
        DataGridCell<double>(columnName: 'sum', value: order.sum),
      ]);
    })];
    _sortByDateDescending();
    notifyListeners(); // чтобы DataGrid обновился
  }

  void _sortByDateDescending() {
    _rows.sort((a, b) {
      final aDate = a.getCells().firstWhere((c) => c.columnName == 'data').value as DateTime?;
      final bDate = b.getCells().firstWhere((c) => c.columnName == 'data').value as DateTime?;

      if (aDate == null && bDate == null) return 0;
      if (aDate == null) return 1; // null в конец
      if (bDate == null) return -1;

      return bDate.compareTo(aDate); // От новых к старым (descending)
    });
  }
  @override
  List<ModelDocumentDb> get orderList => _ordersList;
  @override
  List<DataGridRow> get rows => _rows;


  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        cell.value.toString();
        return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 8.r),
          decoration: BoxDecoration(
            color: containerColor,
            border: borderSideTable(cell)
          ),
          child: textContentTable(cell),
          // Text(cell.value.toString(),style: textStyleDialogOrderContent),
        );
      }).toList(),
    );
  }

  /// ⚡ Поддержка сортировки
  @override
  Future<void> performSorting(List<DataGridRow> rows) async {
    for (final sortColumn in sortedColumns) {
      final isAscending =
          sortColumn.sortDirection == DataGridSortDirection.ascending;
      final columnName = 'data';

      _rows.sort((a, b) {
        final aValue =
            a.getCells().firstWhere((c) => c.columnName == columnName).value;
        final bValue =
            b.getCells().firstWhere((c) => c.columnName == columnName).value;

        if (aValue == null || bValue == null) return 0;

        if (aValue is Comparable && bValue is Comparable) {
          return isAscending
              ? aValue.compareTo(bValue)
              : bValue.compareTo(aValue);
        }
        return 0;
      });
    }
    // 👇 Добавляем это, чтобы явно завершить Future
    return;
  }
}
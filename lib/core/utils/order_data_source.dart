import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/core/utils/table_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../data/models_db/model_db_orders/model_document_db.dart';


class OrderDataSource extends DataGridSource {

  List<DataGridRow> _rows = [];
  List<ModelDocumentDb> _ordersList = [];


  void updateData(List<ModelDocumentDb> orders) {
    _ordersList = orders..sort((a, b) => b.dateValid.compareTo(a.dateValid));
    print('updateData: ${orders.length}');
    _rows = _ordersList.map((order) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'nr', value: order.code),
        DataGridCell<DateTime>(columnName: 'data', value: order.dateValid),
        DataGridCell<String>(columnName: 'client', value: order.clientName),
        DataGridCell<String>(
            columnName: 'address', value: order.deliveryAddress),
        DataGridCell<String>(
            columnName: 'status', value: order.state.toString()),
        DataGridCell<double>(columnName: 'sum', value: double.tryParse(order.sum.toStringAsFixed(2))),
      ]);
    }).toList();


    notifyListeners(); // чтобы DataGrid обновился
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
        if(cell.columnName == 'sum'){
          return
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 25.r),
              decoration: BoxDecoration(
                  color: containerColor,
                  border: borderSideTable(cell)
              ),
              child: textContentTable(cell),
            );
        }
       else{ return
          Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 8.r),
          decoration: BoxDecoration(
              color: containerColor,
              border: borderSideTable(cell)
          ),
          child: textContentTable(cell),
        );}
      }).toList(),
    );
  }
}
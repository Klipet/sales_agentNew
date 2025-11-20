import 'package:sales_agent/core/utils/table_util.dart';
import 'package:sales_agent/data/models_db/model_db_new_order/new_order_line_model_db.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class NewOrderAslSours extends DataGridSource{


  List<DataGridRow> _rows = [];
  List<NewOrderLineModelDb> _lineList = [];


  void updateData(List<NewOrderLineModelDb> line) {
    _lineList = line;
    print(line);
    _rows = line.map((line) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'cod', value: line.lineNumber ?? 0),
        DataGridCell<String>(columnName: 'name', value: line.assortimentName ?? '----'),
        DataGridCell<String>(columnName: 'code', value: line.assortimentCode ?? '----'),
        DataGridCell<double>(columnName: 'count', value: line.count ?? 0.0),
        DataGridCell<double>(columnName: 'price', value: line.price ?? 0.0),
        DataGridCell<double>(columnName: 'sum', value: line.sum ?? 0.0),
      ]);
    }).toList();

    notifyListeners(); // чтобы DataGrid обновился
  }

  @override
  List<NewOrderLineModelDb> get lineList => _lineList;

  @override
  List<DataGridRow> get rows => _rows;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        cell.value.toString();
        return newOrderTable(cell);
      }).toList(),
    );
  }

}
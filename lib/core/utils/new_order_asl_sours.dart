import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_agent/core/utils/table_util.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_lines_db.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../data/repositories/new_order_repositori.dart';
import '../colors_app.dart';
import '../styles_text.dart';

class NewOrderAslSours extends DataGridSource {
  final Function(int lineId)? onDelete;
  final Function(int lineId, double currentCount, ModelLinesDb item)?
  onIncrement;
  final Function(int lineId, double currentCount, ModelLinesDb item)?
  onDecrement;
  final Function(int lineId, double newValue, ModelLinesDb item)?
  onSetValue;


  NewOrderAslSours({
    this.onDelete,
    this.onIncrement,
    this.onDecrement,
    this.onSetValue,

  });
  final Map<int, TextEditingController> _controllers = {};

  List<DataGridRow> _rows = [];
  List<ModelLinesDb> _lineList = [];

  TextEditingController _getController(ModelLinesDb line) {
    return _controllers.putIfAbsent(
      line.id,
          () => TextEditingController(
        text: (line.count ?? 0).toStringAsFixed(2),
      ),
    );
  }

  void updateData(List<ModelLinesDb> line) {
    _lineList = line;
    for (final l in line) {
      final controller = _controllers[l.id];
      if (controller != null) {
        controller.text = (l.count ?? 0).toStringAsFixed(2);
      }
    }
    _rows = line.map((line) {
      return DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'cod', value: line.lineNumber ?? 0),
          DataGridCell<String>(
            columnName: 'name',
            value: line.assortimentName ?? '----',
          ),
          DataGridCell<double>(columnName: 'count', value: line.count ?? 0.0),
          DataGridCell<double>(columnName: 'price', value: line.price ?? 0.0),
          DataGridCell<double>(columnName: 'priceSp', value: line.priceSpecial ?? 0.0),
          DataGridCell<double>(columnName: 'sum', value: line.sum ?? 0.0),
          DataGridCell<ModelLinesDb>(columnName: 'actions', value: line),
        ],
      );
    }).toList();

    notifyListeners(); // чтобы DataGrid обновился
    notifyDataSourceListeners(); // ⚠️ Это должно быть!
  }

  @override
  List<ModelLinesDb> get lineList => _lineList;

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final index = _rows.indexOf(row);
    final isFirst = index == 0;

    // Получаем ID строки из ячейки
    final lineId =
        row.getCells().firstWhere((cell) => cell.columnName == 'cod').value
            as int;

    // Находим соответствующий объект line по ID
    final line = _lineList.firstWhere((l) => l.lineNumber == lineId);

    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        if (cell.columnName == 'actions') {
          return Center(
            child: GestureDetector(
              onTap: () => onDelete?.call(line.id),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: containerColor,
                  border: Border(
                    left: BorderSide(color: borderColor, width: 1.w),
                    bottom: BorderSide(color: borderColor, width: 0.5.w),
                    top: BorderSide(color: borderColor, width: 0.5.w),
                  ),
                ),
                child: SvgPicture.asset('assets/icons/trash.svg'),
              ),
            ),
          );
        }
        if (cell.columnName == 'count') {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: containerColor,
              border: borderSideTable(cell),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Кнопка минус
                GestureDetector(
                  onTap: () {
                    print(
                      "➖ Decrement tapped: id=${line.id}, count=${line.count}",
                    );
                    onDecrement?.call(line.id, line.count ?? 0.0, line);
                  },
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    child: SvgPicture.asset('assets/icons/min.svg'),
                  ),
                ),
                // Количество
                Spacer(),
                Container(
                  width: 90.w,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _getController(line),
                    textAlign: TextAlign.center,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    style: textStyleTableCount,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    onSubmitted: (value) {
                      final parsed = double.tryParse(value.replaceAll(',', '.'));
                      if (parsed != null) {
                        // ✅ Правильный вызов с 3 параметрами
                        onSetValue?.call(line.id, parsed, line);
                      }
                    },
                  ),
                ),
                // Кнопка плюс
                Spacer(),
                GestureDetector(
                  onTap: () =>
                      onIncrement?.call(line.id, line.count ?? 0.0, line),
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    child: SvgPicture.asset('assets/icons/add.svg'),
                  ),
                ),
              ],
            ),
          );
        }if (cell.columnName == 'price') {
          // получаем value из priceSp
          final priceSpValue = row.getCells().firstWhere(
                (c) => c.columnName == 'priceSp',
          ).value as double?;
          final price = row.getCells().firstWhere(
                (c) => c.columnName == 'price',
          ).value as double?;
          if(priceSpValue == price){

          return Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 16.r),
            decoration: BoxDecoration(
              color: containerColor,
              border: borderSideTable(cell),
            ),
            child: Text(
              priceSpValue!.toStringAsFixed(2),
              style: textStyleDialogOrderContent.copyWith(color: Colors.red),
            ),
          );}else{
            return Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 16.r),
                decoration: BoxDecoration(
                  color: containerColor,
                  border: borderSideTable(cell),
                ),
                child: Text(
                  price!.toStringAsFixed(2),
                  style: textStyleDialogOrderContent,
                ));
          }
        }
        return newOrderTable(cell, isFirst);
      }).toList(),
    );
  }
}

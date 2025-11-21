import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isar/isar.dart';
import 'package:sales_agent/data/repositories/new_order_repositori.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../core/utils/new_order_asl_sours.dart';

class TableNewOrderAsl extends StatefulWidget {
  final int orderId;

  TableNewOrderAsl({super.key, required this.orderId});

  @override
  State<TableNewOrderAsl> createState() => _TableNewOrderAslState();
}

class _TableNewOrderAslState extends State<TableNewOrderAsl> {
  late NewOrderAslSours _dataSource;
  final newRepo = NewOrderRepository();
  bool _isLoading = true;
  bool _isEmptyLine = true;

  @override
  void initState() {
    super.initState();
    _dataSource = NewOrderAslSours();
    _loadLines();
  }

  @override
  void dispose() {
    print("🔴 TableNewOrderAslUI dispose");
    _dataSource.dispose();
    super.dispose();
  }

  Future<void> _loadLines() async {
    setState(() {
      _isLoading = true;
    });
    final lines = await newRepo.getOrderLines(widget.orderId);
    if (lines.isNotEmpty) {
      setState(() {
        _isEmptyLine = false;
      });
    }
    setState(() {
      _dataSource.updateData(lines);
      _isLoading = false;
    });
  }

  double _calculateTotalSum() {
    double total = 0;
    for (var line in _dataSource.lineList) {
      // Вариант 1: если есть готовое поле sum
      total += line.sum ?? 0;

      // Вариант 2: если нужно вычислить (раскомментируйте если нужно)
      // total += (line.count ?? 0) * (line.price ?? 0);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    if (_isEmptyLine) {
      return Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/empti.svg',
                    width: 446.w,
                    height: 259.h,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'errors.notFound'.tr(),
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.r)),
        border: Border(
          bottom: BorderSide(color: borderColor, width: 1.w),
          left: BorderSide(color: borderColor, width: 1.w),
          right: BorderSide(color: borderColor, width: 1.w),
        ),
      ),
      margin: EdgeInsets.only(left: 16.w),
      child: Column(
        children: [
          Expanded(
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                headerColor: primariColor,
                headerHoverColor: primariColor,
                selectionColor: containerColor,
              //  gridLineColor: containerColor,
                rowHoverColor: Colors.transparent,
              ),
              child: SfDataGrid(
                source: _dataSource,
                rowHeight: 48.h,
                headerRowHeight: 32.h,
                columnWidthMode: ColumnWidthMode.fill,
                gridLinesVisibility: GridLinesVisibility.none,
                headerGridLinesVisibility: GridLinesVisibility.none,
                columnWidthCalculationRange: ColumnWidthCalculationRange.visibleRows,
                columns: [
                  GridColumn(
                    columnName: 'cod',
                    width: 50.w,
                    label: Center(
                      child: Text('№', style: textStyleDialogOrderTitle),
                    ),
                  ),
                  GridColumn(
                    columnName: 'name',
                    width: 500.w,
                    label: Center(
                      child: Text(
                        'order.name'.tr(),
                        style: textStyleDialogOrderTitle,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'code',
                    width: 163.w,
                    label: Center(
                      child: Text(
                        'order.code'.tr(),
                        style: textStyleDialogOrderTitle,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'count',
                    width: 110.w,
                    label: Center(
                      child: Text(
                        'order.count'.tr(),
                        style: textStyleDialogOrderTitle,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'price',
                    label: Center(
                      child: Text(
                        'order.price'.tr(),
                        style: textStyleDialogOrderTitle,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'sum',
                    label: Center(
                      child: Text(
                        'order.sum'.tr(),
                        style: textStyleDialogOrderTitle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 16.r, right: 32.r, top: 10.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('order.total'.tr(), style: textStyleDialogOrderTotal),
                SizedBox(width: 5.w),
                Text(
                  "${_calculateTotalSum().toStringAsFixed(2)}MDL",
                  style: textStyleDialogOrderSum,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

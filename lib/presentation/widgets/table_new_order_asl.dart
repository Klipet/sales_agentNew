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
import '../dialogs/new_order_clear.dart';

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
    _dataSource = NewOrderAslSours(
      onDelete: _deleteLine,
      onIncrement: _incrementCount,
      onDecrement: _decrementCount,
    );
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
        _dataSource.updateData(lines);
        _isLoading = false;
      });
    }else{
      setState(() {
        _isEmptyLine = true;
        _dataSource.updateData(lines);
      });
    }
  }

  Future<void> _deleteLine(int lineId) async {
    print("🗑️ _deleteLine CALLED: lineId=$lineId");

    try {
      final bool? deleted =  await showDeleteConfirmation(
        context: context);
      if (deleted == true) {
        await newRepo.removeLineFromOrder(orderId: widget.orderId, lineId: lineId);
        if(mounted){
          setState(() {});
          await _loadLines();
        }else{
          print("🗑️ ne не обновил: lineId=$lineId");
        }

      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Eroare la ștergere: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _incrementCount(int lineId, double currentCount) async {
    try {
      await newRepo.updateLineQuantity(
        orderId: widget.orderId,
        lineId: lineId,
        newQuantity: currentCount + 1,
      );
      if (mounted) {
        await _loadLines(); // ✅ Обновляем таблицу
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Eroare: $e'), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _decrementCount(int lineId, double currentCount) async {
    if (currentCount <= 1) {
      print("⚠️ Cannot decrement below 1");
      if (mounted) {
       // ScaffoldMessenger.of(context).showSnackBar(
       //   const SnackBar(
       //     content: Text('Cantitatea minimă este 1'),
       //     backgroundColor: Colors.orange,
       //   ),
       // );
      }
      return;
    }

    try {
      await newRepo.updateLineQuantity(
        orderId: widget.orderId,
        lineId: lineId,
        newQuantity: currentCount - 1,
      );
      if (mounted) {
        await _loadLines();
      } else {
        print("❌ Widget not mounted");
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Eroare: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

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
                key: ValueKey(_dataSource.lineList.length),
                source: _dataSource,
                rowHeight: 48.h,
                headerRowHeight: 32.h,
                columnWidthMode: ColumnWidthMode.fill,
                gridLinesVisibility: GridLinesVisibility.none,
                headerGridLinesVisibility: GridLinesVisibility.none,
                columnWidthCalculationRange:
                    ColumnWidthCalculationRange.visibleRows,
                columns: [
                  GridColumn(
                    columnName: 'nr.',
                    width: 46.w,
                    label: Center(
                      child: Text('№', style: textStyleDialogOrderTitle),
                    ),
                  ),
                  GridColumn(
                    columnName: 'name',
                    width: 529.w,
                    label: Center(
                      child: Text(
                        'order.name'.tr(),
                        style: textStyleDialogOrderTitle,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'count',
                    width: 230.w,
                    label: Center(
                      child: Text(
                        'order.count'.tr(),
                        style: textStyleDialogOrderTitle,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'price',
                    width: 179.w,
                    label: Center(
                      child: Text(
                        'order.price'.tr(),
                        style: textStyleDialogOrderTitle,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'sum',
                    width: 105.w,
                    label: Center(
                      child: Text(
                        'order.sum'.tr(),
                        style: textStyleDialogOrderTitle,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'actions',
                    label: Center(child: Text('')),
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

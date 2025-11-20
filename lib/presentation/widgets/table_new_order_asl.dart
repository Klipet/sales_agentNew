import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_db/model_db_new_order/new_order_line_model_db.dart';
import 'package:sales_agent/data/models_db/model_db_new_order/new_order_model_db.dart';
import 'package:sales_agent/data/repositories/new_order_repositori.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_bloc.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_state.dart';
import 'package:sales_agent/logic/blocs/new_order_line_bloc/new_line_cubit.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../core/utils/new_order_asl_sours.dart';

import '../../data/models_db/model_db_new_order/new_model_document_id.dart';
import '../../data/repositories/new_line_repositori.dart';
import '../../logic/blocs/new_order_line_bloc/new_line_state.dart';

class TableNewOrderAsl extends StatefulWidget {
  TableNewOrderAsl({super.key});

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
    Id? ordersId;
    final orders = await newRepo.getOrderId();
    for (var orderId in orders) {
      ordersId = orderId.dicumentId;
    }
    final lines = await newRepo.getOrderLines(ordersId ?? 0);
    if (lines.isEmpty || lines == null) {
      setState(() {
        _isEmptyLine = true;
      });
    }
    setState(() {
      _dataSource.updateData(lines);
      _isLoading = false;
      _isEmptyLine = false;
    });
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
        border: Border.all(color: borderColor, width: 1.w),
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
      ),
      margin: EdgeInsets.only(left: 16.w),
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: Colors.transparent,
          headerHoverColor: Colors.transparent,
          rowHoverColor: Colors.transparent,
        ),
        child: SfDataGrid(
          source: _dataSource,
          rowHeight: 48.h,
          headerRowHeight: 32.h,
          columnWidthMode: ColumnWidthMode.fill,
          gridLinesVisibility: GridLinesVisibility.none,
          headerGridLinesVisibility: GridLinesVisibility.none,
          columns: [
            GridColumn(
              columnName: 'cod',
              width: 50.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: borderColor, width: 1.w),
                    bottom: BorderSide(color: borderColor, width: 0.5.w),
                  ),
                ),
                child: Center(
                  child: Text('№', style: textStyleDialogOrderTitle),
                ),
              ),
            ),
            GridColumn(
              columnName: 'name',
              width: 500.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: borderColor, width: 1.w),
                    bottom: BorderSide(color: borderColor, width: 0.5.w),
                  ),
                ),
                child: Center(
                  child: Text(
                    'order.name'.tr(),
                    style: textStyleDialogOrderTitle,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'code',
              width: 163.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: borderColor, width: 1.w),
                    bottom: BorderSide(color: borderColor, width: 0.5.w),
                  ),
                ),
                child: Center(
                  child: Text(
                    'order.code'.tr(),
                    style: textStyleDialogOrderTitle,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'count',
              width: 110.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: borderColor, width: 1.w),
                    bottom: BorderSide(color: borderColor, width: 0.5.w),
                  ),
                ),
                child: Center(
                  child: Text(
                    'order.count'.tr(),
                    style: textStyleDialogOrderTitle,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'price',
              label: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: borderColor, width: 1.w),
                    bottom: BorderSide(color: borderColor, width: 0.5.w),
                  ),
                ),
                child: Center(
                  child: Text(
                    'order.price'.tr(),
                    style: textStyleDialogOrderTitle,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'sum',
              label: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: borderColor, width: 1.w),
                    bottom: BorderSide(color: borderColor, width: 0.5.w),
                  ),
                ),
                child: Center(
                  child: Text(
                    'order.sum'.tr(),
                    style: textStyleDialogOrderTitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

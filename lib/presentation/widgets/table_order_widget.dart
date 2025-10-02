import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isar/isar.dart';
import 'package:sales_agent/core/constans.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_document_db.dart';
import 'package:sales_agent/data/repositories/orders_repositori.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../core/utils/order_data_source.dart';
import '../../data/repositories/db_provider.dart';
import '../dialogs/order_detail_dialog.dart';

class TableOrderWidget extends StatefulWidget {
  final int status;

  const TableOrderWidget({super.key, required this.status});

  @override
  State<TableOrderWidget> createState() => _TableOrderWidgetState();
}

class _TableOrderWidgetState extends State<TableOrderWidget> {
  late OrderDataSource _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = OrderDataSource();
    _loadOrders(); // загрузим при старте
  }

  @override
  void didUpdateWidget(covariant TableOrderWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.status != widget.status) {
      if (widget.status == 0) {
        _loadOrders();
      } else if (widget.status == 1) {
        _loadOrdersFilter(Constant().INLUCRU);
      } else if (widget.status == 2) {
        _loadOrdersFilter(Constant().GATA);
      } else if (widget.status == 3) {
        _loadOrdersFilter(Constant().SABLON);
      }
    }
  }

  Future<void> _loadOrders() async {
    final repo = OrdersRepositori();
    final orders = await repo.getOrders();
    print(orders.length);
    _dataSource.updateData(orders);
    setState(() {});
  }

  Future<void> _loadOrdersFilter(int? status) async {
    final repo = OrdersRepositori();
    final orders = await repo.filterOrders(status!);
    _dataSource.updateData(orders);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(color: borderColor, width: 1.w),
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
      ),
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: Colors.transparent,
          headerHoverColor: Colors.transparent,
          rowHoverColor: Colors.transparent,
        ),
        child: SfDataGrid(
          onCellTap: (DataGridCellTapDetails details) {
            final rowIndex = details.rowColumnIndex.rowIndex;

            // Пропускаем заголовок
            if (rowIndex > 0) {
              final tappedRow = _dataSource.orderList[rowIndex - 1];

              if (tappedRow != null) {
                showDetailOrder(context: context, order: tappedRow);
              } else {
                print('Объект заказа не найден в строке!');
              }
              // Открываем окно с деталями
            //  showDetailOrder(context: context, order: order);
            }
          },
          source: _dataSource,
          rowHeight: 48.h,
          headerRowHeight: 32.h,
          columnWidthMode: ColumnWidthMode.fill,
          gridLinesVisibility: GridLinesVisibility.none,
          headerGridLinesVisibility: GridLinesVisibility.none,
          columns: [
            GridColumn(
              columnName: 'nr',
              width: 103.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),),
                ),
                child: Center(
                  child: Text("Nr.", style: textStyleDialogOrderTitle),
                ),
              ),
            ),
            GridColumn(
              columnName: 'data',
              width: 137.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),),
                ),
                child: Center(
                  child: Text(
                    "Data înregistrării",
                    style: textStyleDialogOrderTitle,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'client',
              width: 291.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),),
                ),
                child: Center(
                  child: Text("Client", style: textStyleDialogOrderTitle),
                ),
              ),
            ),
            GridColumn(
              columnName: 'address',
              width: 294.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),),
                ),
                child: Center(
                  child: Text("Adresa", style: textStyleDialogOrderTitle),
                ),
              ),
            ),
            GridColumn(
              columnName: 'status',
              width: 157.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Statut comandă",
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

                    bottom: BorderSide(color: borderColor, width:  0.5.w),
                  ),
                ), child: Center(
                child: Text("Suma", style: textStyleDialogOrderTitle),
              ),)
            ),
          ],
        ),
      ),
    );
  }
}

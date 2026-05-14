import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_document_db.dart';
import 'package:sales_agent/data/repositories/orders_repositori.dart';
import 'package:sales_agent/presentation/widgets/loading_widget.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../core/utils/order_data_source.dart';
import '../../data/models_db/model_db_clients/model_client_db.dart';
import '../../data/repositories/db_provider.dart';
import '../dialogs/order_detail_dialog.dart';


class HistoryOrdersListWidget extends StatefulWidget {
  final ModelClientDb client;

  const HistoryOrdersListWidget({super.key, required this.client});

  @override
  State<HistoryOrdersListWidget> createState() =>
      _HistoryOrdersListWidgetState();
}

class _HistoryOrdersListWidgetState extends State<HistoryOrdersListWidget> {
  late List<ModelDocumentDb> orders = [];
  late OrdersRepositori clientRepositori;
  bool _isLoading = true;
  late OrderDataSource _dataSource;
  StreamSubscription? _ordersSubscription;
@override
  void initState() {
       super.initState();
       _dataSource = OrderDataSource();
       loadClient();
       _setupOrdersListener();
  }



  @override
  void didUpdateWidget(covariant HistoryOrdersListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.client.uid != widget.client.uid) {
      loadClient();
    }
  }
  Future<void> _setupOrdersListener() async {
    final isar = await DbProvider.instance();

    // Слушаем любые изменения в коллекции заказов
    _ordersSubscription = isar.modelDocumentDbs
        .watchLazy()
        .listen((_) {
      if (!mounted) return;
      // База изменилась, перезагружаем данные
      print('🔄 Обнаружены изменения в базе, обновляем список...');
      loadClient();
    });
  }


  Future<void> loadClient() async {
    setState(() => _isLoading = true);

    clientRepositori = OrdersRepositori();
    final data = await clientRepositori.getOrderByClient(
      widget.client.uid ?? null,
    );

    setState(() {
      print(data.length);
      orders = data;
      _dataSource.updateData(data);
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return LoadingWidget(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height);
    }

    if (orders.isEmpty) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/empti.svg', width: 446.w, height: 259.h),
                    SizedBox(height: 16),
                    Text(
                      'errors.notFound'.tr(),
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return  Container(
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
              final tappedRow = _dataSource.orderList[rowIndex -1];
              print(tappedRow.clientName ?? '');
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
              allowSorting: true,
              width: 137.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),),
                ),
                child: Center(
                  child: Text(
                    'gridColumn.data'.tr(),
                    style: textStyleDialogOrderTitle,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'client',
              width: 350.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),),
                ),
                child: Center(
                  child: Text('gridColumn.client'.tr(), style: textStyleDialogOrderTitle, maxLines: 1,overflow: TextOverflow.ellipsis,),
                ),
              ),
            ),
            GridColumn(
              columnName: 'address',
              width: 230.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),),
                ),
                child: Center(
                  child: Text('gridColumn.address'.tr(), style: textStyleDialogOrderTitle),
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
                    'gridColumn.status'.tr(),
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
                  child: Text('gridColumn.sum'.tr() , style: textStyleDialogOrderTitle),
                ),)
            ),
          ],
        ),
      ),
    );
  }
}

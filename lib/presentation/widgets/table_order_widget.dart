import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sales_agent/core/constans.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_document_db.dart';
import 'package:sales_agent/data/repositories/new_order_repositori.dart';
import 'package:sales_agent/data/repositories/orders_repositori.dart';
import 'package:sales_agent/presentation/widgets/loading_widget.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../core/utils/order_data_source.dart';
import '../../data/repositories/db_provider.dart';
import '../dialogs/order_detail_dialog.dart';

class TableOrderWidget extends StatefulWidget {
  final int status;
  final String search;

  const TableOrderWidget({super.key, required this.status, required this.search});

  @override
  State<TableOrderWidget> createState() => _TableOrderWidgetState();
}

class _TableOrderWidgetState extends State<TableOrderWidget> {
  late OrderDataSource _dataSource;
  bool _isLoading = true;
  final repo = OrdersRepositori();
  final repoNewOrder = NewOrderRepository();
  StreamSubscription? _ordersSubscription;

  @override
  void initState() {
    super.initState();
    _dataSource = OrderDataSource();
    _setupOrdersListener();
    if (widget.search.isEmpty) {
      _loadOrders(); // при старте — показать все
    } else {
      _loadOrdersFilterSearch(widget.search); // если сразу пришёл поиск
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
      _reloadCurrentView();
    });
  }
  // Перезагрузка текущего представления
  void _reloadCurrentView() {
    if (widget.search.isNotEmpty) {
      _loadOrdersFilterSearch(widget.search);
    } else if (widget.status == 0) {
      _loadOrders();
    } else if (widget.status == 1) {
      _loadOrdersFilter(Constant().INLUCRU);
    } else if (widget.status == 2) {
      _loadOrdersFilter(Constant().ASTEPTARE);
    } else if (widget.status == 3) {
      _loadOrdersFilter(Constant().SABLON);
    }
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
        _loadOrdersFilter(Constant().ASTEPTARE);
      } else if (widget.status == 3) {
        _loadOrdersFilter(Constant().SABLON);
      }
    }
    if (oldWidget.search != widget.search) {
      if (widget.search.isEmpty) {
        _loadOrders(); // если строка пустая — показать все
      } else {
        _loadOrdersFilterSearch(widget.search);
      //  print(widget.search);
      }
    }
  }

  Future<void> _loadOrders() async {
    setState(() {
      _isLoading = true;
    });
    final orders = await repo.getOrders();
    setState(() {
      _dataSource.updateData(orders);
      _isLoading = false;
    });
  }

  Future<void> _loadOrdersFilter(int? status) async {
    setState(() {
      _isLoading = true;
    });
    final orders = await repo.filterOrders(status!);
    setState(() {
      _dataSource.updateData(orders);
      _isLoading = false;
    });
  }
  Future<void> _loadOrdersFilterSearch(String? search) async {
    setState(() {
      _isLoading = true;
    });
    if (search == null || search.isEmpty) {
      // если строка пустая → показываем все заказы
      final orders = await repo.getOrders();
      setState(() {
        _dataSource.updateData(orders);
        _isLoading = false;
      });
    } else {
      // иначе ищем
      final orders = await repo.filterOrdersCount(search);
      setState(() {
        _dataSource.updateData(orders);
        _isLoading = false;
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return LoadingWidget(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height);
    }

    if (_dataSource.orderList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/empti.svg', width: 446.w, height: 259.h,),
            SizedBox(height: 16),
            Text(
              widget.search.isNotEmpty ? 'errors.notFound'.tr() : 'errors.notFound'.tr(),
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }
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
        //  allowSorting: true,
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

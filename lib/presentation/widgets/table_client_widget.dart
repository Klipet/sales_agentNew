import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_agent/core/utils/client_data_source.dart';
import 'package:sales_agent/data/repositories/client_repositori.dart';
import 'package:sales_agent/presentation/widgets/loading_widget.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';

class TableClientWidget extends StatefulWidget {
  final String search;

  const TableClientWidget({super.key, required this.search});

  @override
  State<TableClientWidget> createState() => _TableClientWidgetState();
}

class _TableClientWidgetState extends State<TableClientWidget> {
  late ClientDataSource _dataSource;
  bool _isLoading = true;
  final repo = ClientRepositori();

  @override
  void initState() {
    super.initState();
    _dataSource = ClientDataSource();
    if (widget.search.isEmpty) {
      _loadOrders(); // при старте — показать все
    } else {
      _loadOrdersFilterSearch(widget.search); // если сразу пришёл поиск
    }
  }

  @override
  void didUpdateWidget(covariant TableClientWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

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
    final orders = await repo.getAllClients();
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
      final orders = await repo.getAllClients();
      setState(() {
        _dataSource.updateData(orders);
        _isLoading = false;
      });
    } else {
      // иначе ищем
      final orders = await repo.filterClient(search);
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

    if (_dataSource.clientList.isEmpty) {
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
              final tappedRow = _dataSource.clientList[rowIndex - 1];

              if (tappedRow != null) {
             //  showDetailOrder(context: context, order: tappedRow);
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
              columnName: 'cod',
              width: 104.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),),
                ),
                child: Center(
                  child: Text('gridColumn.cod'.tr(), style: textStyleDialogOrderTitle),
                ),
              ),
            ),
            GridColumn(
              columnName: 'name',
              width: 556.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),),
                ),
                child: Center(
                  child: Text(
                    'gridColumn.name'.tr(),
                    style: textStyleDialogOrderTitle,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'idno',
              width: 163.w,
              label: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),),
                ),
                child: Center(
                  child: Text('gridColumn.idno'.tr(), style: textStyleDialogOrderTitle),
                ),
              ),
            ),
            GridColumn(
                columnName: 'tva',
                width: 193.w,
                label: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: borderColor, width:  1.w),
                      bottom: BorderSide(color: borderColor, width:  0.5.w),
                    ),
                  ),
                  child: Center(child: Text('gridColumn.tva'.tr(), style: textStyleDialogOrderTitle)),
                )
            ),
            GridColumn(
              columnName: 'outlans',
              label: Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor, width:  1.w),
                    bottom: BorderSide(color: borderColor, width:  0.5.w),),
                ),
                child: Center(
                  child: Text('gridColumn.outlans'.tr(), style: textStyleDialogOrderTitle),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

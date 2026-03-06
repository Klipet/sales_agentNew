import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isar/isar.dart';
import 'package:pinput/pinput.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_lines_db.dart';
import 'package:sales_agent/data/repositories/new_order_repositori.dart';
import 'package:sales_agent/presentation/toast/toast_response_error.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../core/utils/new_order_asl_sours.dart';
import '../../data/models_api/models_actie_price/client_price_response.dart';
import '../../logic/blocs/price_actie_blocs/price_actie_bloc.dart';
import '../../logic/blocs/price_actie_blocs/price_actie_state.dart';
import '../../packages/toast_costom.dart';
import '../dialogs/new_order_clear.dart';
import 'loading_widget.dart';

class TableNewOrderAsl extends StatefulWidget {
  final int orderId;
  final String clientUUid;

  TableNewOrderAsl({
    super.key,
    required this.orderId,
    required this.clientUUid,
  });

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
      onSetValue: _setCount,
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
    } else {
      setState(() {
        _isEmptyLine = true;
        _dataSource.updateData(lines);
      });
    }
  }

  Future<void> _deleteLine(int lineId) async {
    print("🗑️ _deleteLine CALLED: lineId=$lineId");

    try {
      final bool? deleted = await showDeleteConfirmation(context: context);
      if (deleted == true) {
        await newRepo.removeLineFromOrder(
          orderId: widget.orderId,
          lineId: lineId,
        );
        if (mounted) {
          setState(() {});
          await _loadLines();
        } else {
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

  Future<void> _setCount(int lineId, double newValue, ModelLinesDb item) async {
    try {
      final minValue = item.nonWhole ? 0.01 : 1.0;
      final maxValue = item.remain;

      if (newValue < minValue) {
        print('object1 $minValue');
        await newRepo.updateLineQuantity(
          orderId: widget.orderId,
          lineId: lineId,
          newQuantity: minValue,
        );

        if (mounted) {
          await _loadLines();
        }
        ToastResponseError(
          context: context,
          textError: 'Минимум: $minValue',
        ).showError();
        return;
      }

      if (newValue > maxValue) {
        print('object $maxValue');
        newValue = item.remain;
        await newRepo.updateLineQuantity(
          orderId: widget.orderId,
          lineId: lineId,
          newQuantity: newValue,
        );

        if (mounted) {
          await _loadLines();
        }
        ToastResponseError(
          context: context,
          textError: 'Максимум: $maxValue',
        ).showError();
        return;
      }

      await newRepo.updateLineQuantity(
        orderId: widget.orderId,
        lineId: lineId,
        newQuantity: newValue,
      );

      if (mounted) {
        await _loadLines();
      }
    } catch (e) {
      ToastResponseError(
        context: context,
        textError: 'Ошибка ввода',
      ).showError();
    }
  }

  Future<void> _incrementCount(
    int lineId,
    double currentCount,
    ModelLinesDb item,
  ) async {
    try {
      final step = item.nonWhole ? 0.01 : 1.0;
      final nextCount = currentCount + step;

      print('$nextCount <= ${item.remain}, ${item.nonWhole}');

      if (nextCount <= item.remain) {
        await newRepo.updateLineQuantity(
          orderId: widget.orderId,
          lineId: lineId,
          newQuantity: double.parse(nextCount.toStringAsFixed(2)),
        );

        if (mounted) {
          await _loadLines();
        }
      } else {
        ToastResponseError(
          context: context,
          textError: 'Максимум: ${item.remain}',
        ).showError();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Eroare: $e'), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _decrementCount(
    int lineId,
    double currentCount,
    ModelLinesDb item,
  ) async {
    try {
      final step = item.nonWhole ? 0.01 : 1.0;
      final minValue = item.nonWhole ? 0.01 : 1.0;
      final nextCount = currentCount - step;

      print('$nextCount >= $minValue');

      if (nextCount >= minValue) {
        await newRepo.updateLineQuantity(
          orderId: widget.orderId,
          lineId: lineId,
          newQuantity: double.parse(nextCount.toStringAsFixed(2)),
        );

        if (mounted) {
          await _loadLines();
        }
      } else {
        ToastResponseError(
          context: context,
          textError: 'Минимальное количество: $minValue',
        ).showError();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Eroare: $e'), backgroundColor: Colors.red),
      );
    }
  }

  double _calculateTotalSum() {
    double total = 0;
    for (var line in _dataSource.lineList) {
      total += line.sum ?? 0;
    }
    return total;
  }

  Widget buttonUpdatePrice() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        constraints: BoxConstraints(maxHeight: 32.h, maxWidth: 147.w),
        //  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 25.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
          border: Border.all(color: borderColor, width: 1.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Verifica reducere")],
        ),
      ),
    );
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
                    style: textStyleDialogClientInfo.copyWith(
                      fontSize: 24.sp,
                      color: subTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }else if(_isLoading){
      return LoadingWidget(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height);
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
                    width: 170.w,
                    label: Center(
                      child: Text(
                        'order.price'.tr(),
                        style: textStyleDialogOrderTitle,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'priceSp',
                    width: 0,
                    label: SizedBox(),
                  ),
                  GridColumn(
                    columnName: 'priceActie',
                    width: 0,
                    label: SizedBox(),
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
            margin: EdgeInsets.only(
              bottom: 16.r,
              right: 32.r,
              top: 10.r,
              left: 32.r,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BlocConsumer<PriceActieBloc, PriceActieState>(
                  listener: (context, state) async {
                    if (state is PriceActieLoaded) {
                      CustomToast.dismissAll();
                      setState(() {
                        _isLoading = false;
                      });
                      await newRepo.savePricesToIsar(
                      orderId: widget.orderId,
                      prices: state.response.prices,
                      );
                      _loadLines();
                      for(var price in state.response.prices){
                        print("Цены: ${price.price}");
                      }

                    } else if (state is PriceActieError) {
                      setState(() {
                        _isLoading = true;
                      });
                      ToastResponseError(context: context, textError: 'toast.updatePrice'.tr()).showError();
                    }else if(state is PriceActieLoading){
                      ToastResponseError(context: context, textError: 'toast.updatePrice'.tr()).showUpdate();
                    }
                  },
                  builder: (context, state) {
                    _isLoading = state is PriceActieLoading;
                    return GestureDetector(
                      onTap: _isLoading ? null : _loadPriceActie,
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: 50.h,
                          maxWidth: 175.w,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.r),
                          ),
                          border: Border.all(color: borderColor, width: 1.w),
                        ),
                        child: Center(
                          child: Text(
                            'newOrder.updatePrice'.tr(),
                            style: textStyleDialogOrderContent,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Spacer(),
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

  Future<void> _loadPriceActie() async {
    final lines = await newRepo.getOrderLines(widget.orderId);
    final priceUuids = lines.map((e) => e.lineUuid).toList();
    context.read<PriceActieBloc>().onLoadPrices(
      widget.clientUUid,
      priceUuids,
    );
  }
}

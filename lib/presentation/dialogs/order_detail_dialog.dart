import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/colors_app.dart';
import '../../core/constans.dart';
import '../../core/styles_text.dart';
import '../../core/utils/order_line_data_sours.dart';
import '../../core/utils/orders_urils.dart';
import '../../core/utils/pop_menu_util.dart';
import '../../data/models_db/model_db_orders/model_document_db.dart';
import '../../data/models_db/model_db_orders/model_lines_db.dart';
import '../../data/repositories/orders_repositori.dart';

Future<void> showDetailOrder({
  required BuildContext context,
  required ModelDocumentDb order,
}) async {
  final formatDay = DateFormat('dd.MM.yyyy').format(order.dateValid);
  List<ModelLinesDb> dataLines = await OrdersRepositori().loadOrdersLine(order);
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "OrderDialog",
    barrierColor: Colors.black.withOpacity(0.2),
    pageBuilder: (context, anim1, anim2) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 976.w,
              height: 574.h,
              padding: EdgeInsets.only(
                top: 12.r,
                bottom: 14.r,
                left: 16.r,
                right: 16.r,
              ),
              decoration: BoxDecoration(
                color: primariColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16.r),
                        child: Text(
                          order.code,
                          style: textStyleDialogInfoClient.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Spacer(),
                      PopupMenuButton<String>(
                        constraints: BoxConstraints(
                          minWidth: 314.w
                        ),
                        padding: EdgeInsetsGeometry.zero,
                        menuPadding: EdgeInsets.zero,
                        offset: Offset(-10.w, 44.h),
                        color: containerColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: borderColor, width: 0.5.w),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        onSelected: (value) {
                          if (value == 'edit') {
                            print('Редактировать');
                          } else if (value == 'create') {
                            print('Создать');
                          } else if (value == 'delete') {
                            print('Удалить');
                          }
                        },
                        itemBuilder: (context) => popMenuSetting(context),
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          margin: EdgeInsets.only(right: 16.r),
                          decoration:  BoxDecoration(
                            color: containerColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            border: BoxBorder.all(
                              color: borderColor,
                              width: 1.w,
                            ),
                          ),
                          child: Icon(Icons.more_vert),
                        ),
                      ),
                      GestureDetector(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            margin: EdgeInsets.only(right: 16.r),
                            decoration: BoxDecoration(
                              color: containerColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                              border: BoxBorder.all(
                                color: borderColor,
                                width: 1.w,
                              ),
                            ),
                            child: Icon(Icons.close_rounded, size: 24.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12.r),
                    padding: EdgeInsets.only(left: 16.h, right: 16.h),
                    height: 96.h,
                    decoration: BoxDecoration(
                      color: containerColor,
                      border: Border.all(color: borderColor, width: 1),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                order.clientName.toString(),
                                style: textStyleDialogInfoClient.copyWith(
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Spacer(),
                              Text(
                                formatDay,
                                style: textStyleDialogOrderData.copyWith(
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 1.h, color: borderColor),
                        Expanded(
                          child: Row(
                            children: [
                              textStatut(order),

                              Spacer(),
                              adressDialog(order)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(15.r),
                        ),
                        border: Border(
                          bottom: BorderSide(color: borderColor, width: 1.w),
                          left: BorderSide(color: borderColor, width: 1.w),
                          right: BorderSide(color: borderColor, width: 1.w),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SfDataGridTheme(
                            data: SfDataGridThemeData(
                              headerColor: primariColor,
                              headerHoverColor: primariColor,
                              selectionColor: containerColor,
                              gridLineColor: containerColor,
                              rowHoverColor: containerColor,
                            ),
                            child: SfDataGrid(
                              source: OrderLinesDataSource(dataLines),
                              rowHeight: 48.h,
                              headerRowHeight: 32.h,
                              columnWidthMode: ColumnWidthMode.lastColumnFill,
                              gridLinesVisibility: GridLinesVisibility.none,
                              headerGridLinesVisibility:
                                  GridLinesVisibility.none,
                              columnWidthCalculationRange:
                                  ColumnWidthCalculationRange.visibleRows,
                              columns: [
                                GridColumn(
                                  columnName: 'nr',
                                  width: 46.w,
                                  label: Center(
                                    child: Text(
                                      'Nr.',
                                      style: textStyleDialogOrderTitle,
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'denumire',
                                  width: 385.w,
                                  label: Center(
                                    child: Text(
                                      'order.name'.tr(),
                                      style: textStyleDialogOrderTitle,
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'cant',
                                  width: 90.w,
                                  label: Center(
                                    child: Text(
                                      'order.count'.tr(),
                                      style: textStyleDialogOrderTitle,
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'pret',
                                  width: 179.w,
                                  label: Center(
                                    child: Text(
                                      'order.price'.tr(),
                                      style: textStyleDialogOrderTitle,
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'suma',
                                  width: 90.w,
                                  label: Center(
                                    child: Text(
                                      'order.sum'.tr(),
                                      style: textStyleDialogOrderTitle,
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'stocuri',
                                  label: Center(
                                    child: Text(
                                      'order.stock'.tr(),
                                      style: textStyleDialogOrderTitle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(bottom: 16.r, right: 32.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'order.total'.tr(),
                                  style: textStyleDialogOrderTotal,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "${order.sum.toString()} MDL",
                                  style: textStyleDialogOrderSum,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

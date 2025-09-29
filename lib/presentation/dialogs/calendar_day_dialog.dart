import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/repositories/orders_repositori.dart';

import '../../core/styles_text.dart';
import '../../core/utils/convert_data.dart';
import '../../data/models_db/model_db_orders/model_document_db.dart';
import 'order_detail_dialog.dart';

void showBlurDialogCalendar(BuildContext context, DateTime day, List<int> orders) {
  final formatDay = DateFormat('dd.MM.yyyy').format(day);
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    // закрыть по тапу вне
    barrierLabel: "Dialog",
    barrierColor: Colors.black.withOpacity(0.2),
    // полупрозрачный фон
    pageBuilder: (context, anim1, anim2) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // блюр фона
        child: Center(
          child: Container(
            width: 612.w,
            height: 574.h,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: primariColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(formatDay.toString(), style: textStyleDialogday.copyWith(
                      decoration: TextDecoration.none,
                    ),),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          border: BoxBorder.all(color: borderColor, width: 1.w),
                        ),
                        child: Icon(Icons.close, size: 24.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Expanded(
                  child: FutureBuilder<List<ModelDocumentDb>>(
                    future: OrdersRepositori().loadOrdersForDay(day),
                    // функция, которая берёт заказы из базы
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Ошибка: ${snapshot.error}"));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text("Нет заказов"));
                      }

                      final orders = snapshot.data!;

                      return ListView.builder(
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          final order = orders[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Container(
                              padding: EdgeInsets.only(left: 16.h, right: 16.h),
                              height: 176.h,
                              decoration: BoxDecoration(
                                color: containerColor,
                                border: Border.all(
                                  color: borderColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.r),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 48.h,
                                    margin: EdgeInsets.only(top: 16.w),
                                    padding: EdgeInsets.only(
                                      left: 16.h,
                                      right: 16.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: primariColor,
                                      border: Border.all(
                                        color: borderColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.r),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          order.code,
                                          style: textStyleDialogInfoClient.copyWith(
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          order.clientName.toString(),
                                          style: textStyleDialogInfoClient.copyWith(
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'dialog.address'.tr(
                                              namedArgs: {
                                                'address': order.comment
                                                    .toString(),
                                              },
                                            ),
                                            style: textStyleDialogInfoOrder.copyWith(
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          Text(
                                            order.state == 1?
                                            'dialog.status'.tr(
                                              namedArgs: {
                                                'status': 'home.bodyJob'.tr(),
                                              },
                                            ) : 'dialog.status'.tr(
                                              namedArgs: {
                                                'status': 'home.bodyAwait'.tr(),
                                              },),
                                            style: textStyleDialogInfoOrder.copyWith(
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          Text(
                                            'dialog.sum'.tr(
                                              namedArgs: {
                                                'sum': order.sum.toString(),
                                              },
                                            ),
                                            style: textStyleDialogInfoOrder.copyWith(
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: (){
                                          showDetailOrder(context: context, order: order);
                                        },
                                        child: Container(
                                          height: 48.h,
                                          width: 155.w,
                                          decoration: BoxDecoration(
                                            color: order.state == 1 ? colorBtAwait : colorBtJob,
                                            border: Border.all(
                                              color: borderColor,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100.r),
                                            ),
                                          ),
                                          child:
                                          Center(child: Text('dialog.btText'.tr(), style: textStyleDialogBt.copyWith(
                                            decoration: TextDecoration.none,
                                          ),)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return FadeTransition(opacity: anim1, child: child);
    },
  );
}

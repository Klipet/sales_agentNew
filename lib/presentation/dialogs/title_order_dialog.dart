import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../data/models_db/model_db_orders/model_document_db.dart';
import '../../data/repositories/orders_repositori.dart';
import '../widgets/loading_widget.dart';
import 'order_detail_dialog.dart';

void showBlurDialogTotal(
{ required  BuildContext context,
  required  int? ordersState,
  required  String title,
  required  String icon}
    ) {
  showDialog(
    context: context,
    barrierDismissible: true,
    // полупрозрачный фон
    builder: (context) {
      String statusKey(int state) {
        switch (state) {
          case 0:
            return 'home.bodySave'.tr();
          case 1:
            return 'home.bodyAwait'.tr();
          case 2:
            return 'home.bodyJob'.tr();
          default:
            return 'home.bodyUnknown'.tr();
        }
      }
      Color colorKey(int state) {
        switch (state) {
          case 0:
            return colorBtSave;
          case 1:
            return colorBtAwait;
          case 2:
            return colorBtJob;
          default:
            return Colors.transparent;
        }
      }
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        content: Container(
          width: 612.w,
          height: 574.h,
          padding:  EdgeInsets.only(top: 20.r, left: 20.h, right: 20.h, bottom: 1.h),
          decoration: BoxDecoration(
            color: primariColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SvgPicture.asset(icon),
                  SizedBox(width:10.w),
                  Text(title, style: textStyleBodyTitle,),
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
                  future: OrdersRepositori().getOrdersByState(ordersState ?? null),
                  // функция, которая берёт заказы из базы
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: LoadingWidget(width: double.maxFinite, height: double.maxFinite,));
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
                                        style: textStyleDialogInfoClient
                                            .copyWith(
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        order.clientName.toString(),
                                        style: textStyleDialogInfoClient
                                            .copyWith(
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
                                        Container(
                                          width: 350.w,
                                          child: Text(
                                            'dialog.address'.tr(
                                              namedArgs: {
                                                'address': order.deliveryAddress
                                                    .toString(),
                                              },
                                            ),
                                            style: textStyleDialogInfoOrder
                                                .copyWith(
                                              decoration:
                                              TextDecoration.none,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          ordersState == null ?
                                          'dialog.status'.tr(
                                            namedArgs: {
                                              'status': 'home.bodyJob'
                                                  .tr(),
                                            },
                                          )
                                          :'dialog.status'.tr(
                                            namedArgs: {
                                              'status': statusKey(order.state),
                                            },
                                          ),
                                          style: textStyleDialogInfoOrder
                                              .copyWith(
                                            decoration:
                                            TextDecoration.none,
                                          ),
                                        ),
                                        Text(
                                          'dialog.sum'.tr(
                                            namedArgs: {
                                              'sum': order.sum.toStringAsFixed(2),
                                            },
                                          ),
                                          style: textStyleDialogInfoOrder
                                              .copyWith(
                                            decoration:
                                            TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        bool? resault  = await showDetailOrder(
                                          context: context,
                                          order: order,
                                        );
                                        if(resault != null || resault == true){
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Container(
                                        height: 48.h,
                                        width: 155.w,
                                        decoration: BoxDecoration(
                                          color: colorKey(order.state),
                                          border: Border.all(
                                            color: borderColor,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(100.r),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'dialog.btText'.tr(),
                                            style: textStyleDialogBt.copyWith(
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
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
      );

    },
  );
}

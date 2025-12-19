import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:sales_agent/data/repositories/new_order_repositori.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../logic/blocs/new_order_bloc/new_order_bloc.dart';

Future<bool?>orderDialogStatus ({
  required BuildContext context,
  required int orderId,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext contextDigital) {
      final repo = NewOrderRepository();
      return AlertDialog(
        backgroundColor: Colors.white,
        actionsPadding: EdgeInsets.only(bottom: 16.h),
        actionsAlignment: MainAxisAlignment.center,
        constraints: BoxConstraints(maxWidth: 400.w, maxHeight: 270.h),
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/trash_open.svg'),
            SizedBox(height: 22.h),
            Container(
              alignment: Alignment.center,
              child: Text(
                'btClear.contentDoc'.tr(),
                style: textStyleTableDialogDelete,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(contextDigital).pop(false),
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                maxWidth: 153.w,
                maxHeight: 48.h,
                minWidth: 153.w,
                minHeight: 48.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: borderColor, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(25.r)),
              ),
              child: Text('btClear.no'.tr(), style: textStyleTableDialogDelete),
            ),
          ),
          GestureDetector(
            onTap: ()  async {
              bool delete = await repo.deleteOrderWithLinesByUuid(orderId);
              Navigator.of(contextDigital).pop(delete);
            },
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                maxWidth: 153.w,
                maxHeight: 48.h,
                minWidth: 153.w,
                minHeight: 48.h,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(25.r)),
              ),
              child: Text(
                'btClear.da'.tr(),
                style: textStyleTableDialogDelete.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    },
  );
  return null;
}
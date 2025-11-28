import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_agent/core/colors_app.dart';

import '../../core/styles_text.dart';
import '../../data/repositories/new_order_repositori.dart';

Future<bool?> showDeleteConfirmation ({
  required BuildContext context,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext contextDigital) {
      return AlertDialog(
        backgroundColor: Colors.white,
        actionsPadding: EdgeInsets.only(bottom: 16.h),
        actionsAlignment: MainAxisAlignment.center,
        constraints: BoxConstraints(maxWidth: 353.w, maxHeight: 224.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        content: Column(
          children: [
            SvgPicture.asset('assets/icons/trash_open.svg'),
            SizedBox(height: 22.h),
            Text(
              'Sigur dorești să ștergi poziția?',
              style: textStyleTableDialogDelete,
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
              child: Text('Nu', style: textStyleTableDialogDelete),
            ),
          ),
          GestureDetector(
            onTap: ()  {
              Navigator.of(contextDigital).pop(true);
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
                'Da, șterge',
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

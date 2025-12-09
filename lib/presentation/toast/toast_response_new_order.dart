import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:toastification/toastification.dart';

import '../../core/styles_text.dart';
import '../../packages/toast_costom.dart';

class ToastResponseNewOrder {
  final BuildContext context;

  ToastResponseNewOrder(this.context);

  void toastSucces() {
    CustomToast.showCustom(
      context: context,
      onDismiss: () {},
      builder: (context, dismiss) {
        return SizedBox(
          width: 565.w,
          height: 160.h,
          child: contentToastSucces(dismiss),
        );
      },
    );
  }

  void toastError() {
    CustomToast.showCustom(
      context: context,
      onDismiss: () {},
      builder: (context, dismiss) {
        return SizedBox(
          width: 565.w,
          height: 241.h,
          child: contentToastError(dismiss),
        );
      },
    );
  }

  void toastSave() {
    CustomToast.showCustom(
      context: context,
      onDismiss: () {},
      builder: (context, dismiss) {
        return SizedBox(
          width: 565.w,
          height: 160.h,
          child: contentToastSave(dismiss),
        );
      },
    );
  }

  Widget contentToastSucces(VoidCallback dismiss) {
    return Container(
      margin: EdgeInsets.only(right: 12.h),
      padding: EdgeInsets.only(
        left: 32.h,
        top: 16.w,
        bottom: 16.h,
        right: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: BoxBorder.all(color: borderColor, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/toast/suces_send.svg'),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              'Comanda a fost transmisă cu succes!',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: textStyleDialogAddAssortimentTotal.copyWith(
                fontSize: 25.sp,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: dismiss,
                child: SvgPicture.asset('assets/icons/close.svg'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget contentToastError(VoidCallback dismiss) {
    return Container(
      margin: EdgeInsets.only(right: 12.h),
      padding: EdgeInsets.only(
        left: 32.h,
        top: 16.w,
        bottom: 16.h,
        right: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: BoxBorder.all(color: borderColor, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/toast/error_send.svg'),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 19.h),
                Text(
                  'Transmiterea a eșuat! ',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: textStyleDialogAddAssortimentTotal.copyWith(
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Comanda a fost salvată în șabloane, încercați să o transmiteți mai târziu.',
                  textAlign: TextAlign.center,
                  style: textStyleDialogAddAssortimentTotal.copyWith(
                    fontSize: 25.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: dismiss,
                child: SvgPicture.asset('assets/icons/close.svg'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget contentToastSave(VoidCallback dismiss) {
    return Container(
      margin: EdgeInsets.only(right: 12.h),
      padding: EdgeInsets.only(
        left: 32.h,
        top: 16.w,
        bottom: 16.h,
        right: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: BoxBorder.all(color: borderColor, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/toast/save_order.svg'),
          Expanded(
            child: Text(
              'Șablonul a fost salvat cu succes!',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: textStyleDialogAddAssortimentTotal.copyWith(
                fontSize: 25.sp,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: dismiss,
                child: SvgPicture.asset('assets/icons/close.svg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

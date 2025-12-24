import 'package:easy_localization/easy_localization.dart';
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
      width: 565.w,
      height:160.h,
      context: context,
      onDismiss: () {},
      builder: (context, dismiss) {
        return SizedBox(
        //  width: 565.w,
        //  height: 160.h,
          child: contentToastSucces(dismiss),
        );
      },
    );
  }

  void toastError() {
    CustomToast.showCustom(
      width: 565.w,
      height: 241.h,
      context: context,
      onDismiss: () {},
      builder: (context, dismiss) {
        return SizedBox(
        //  width: 565.w,
        //  height: 241.h,
          child: contentToastError(dismiss),
        );
      },
    );
  }void toastTokenInvalid() {
    CustomToast.showCustom(
      context: context,
      onDismiss: () {},
      builder: (context, dismiss) {
        return SizedBox(
          width: 565.w,
          height: 241.h,
          child: contentTokenInvalid(dismiss),
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
              'toast.sendSuccess'.tr(),
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
                  'toast.sendError'.tr(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: textStyleDialogAddAssortimentTotal.copyWith(
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'toast.sendErrorSub'.tr(),
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

  Widget contentTokenInvalid(VoidCallback dismiss) {
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
                  'toast.sendError'.tr(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: textStyleDialogAddAssortimentTotal.copyWith(
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'toast.sendErrorToken'.tr(),
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
              'toast.saveTemp'.tr(),
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

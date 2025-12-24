import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../packages/toast_costom.dart';

class ToastResponseError{
  final BuildContext context;
  final String textError;

  const ToastResponseError({ required this.context, required this.textError});


  void showError() {
    CustomToast.showCustom(
      context: context,
      onDismiss: () {},
      builder: (context, dismiss) {
        return SizedBox(
          width: 565.w,
          height: 160.h,
          child: _contentToastError(dismiss),
        );
      },
    );
  }

  void showUpdate() {
    CustomToast.showCustom(
      width: 565.w,
      height: 160.h,
      context: context,
      onDismiss: () {},
      builder: (context, dismiss) {
        return SizedBox(

          child: _contentToastUpdate(dismiss),
        );
      },
    );
  }

  void showUpdateSucces() {
    CustomToast.showCustom(
      width: 565.w,
      height: 160.h,
      context: context,
        margin: EdgeInsets.only(top: 50.r),
      onDismiss: () {},
      builder: (context, dismiss) {
        return SizedBox(
          child: _contentToastUpdateSucces(dismiss),
        );
      },
    );
  }

  void showErrorConnect() {
    CustomToast.showCustom(
      context: context,
      onDismiss: () {},
      builder: (context, dismiss) {
        return SizedBox(
          width: 565.w,
          height: 160.h,
          child: _contentToastErrorInternet(dismiss),
        );
      },
    );
  }

  Widget _contentToastError(VoidCallback dismiss) {
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
          SvgPicture.asset('assets/icons/toast/bubu_error.svg'),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textError,
                  textAlign: TextAlign.center,
                  style: textStyleDialogAddAssortimentTotal.copyWith(
                    fontSize: 22.sp,
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

  Widget _contentToastUpdate(VoidCallback dismiss) {
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
          SvgPicture.asset('assets/icons/toast/await_pop.svg'),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textError,
                  textAlign: TextAlign.center,
                  style: textStyleDialogAddAssortimentTotal.copyWith(
                    fontSize: 22.sp,
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

  Widget _contentToastUpdateSucces(VoidCallback dismiss) {
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
          SvgPicture.asset('assets/icons/toast/succes_pop.svg'),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textError,
                  textAlign: TextAlign.center,
                  style: textStyleDialogAddAssortimentTotal.copyWith(
                    fontSize: 22.sp,
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


  Widget _contentToastErrorInternet(VoidCallback dismiss) {
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
          SvgPicture.asset('assets/icons/toast/no_signal.svg'),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textError,
                  textAlign: TextAlign.center,
                  style: textStyleDialogAddAssortimentTotal.copyWith(
                    fontSize: 22.sp,
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
}
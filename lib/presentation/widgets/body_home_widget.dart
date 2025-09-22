import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales_agent/data/repositories/orders_repositori.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';

class BodyHomeWidget extends StatefulWidget {
  const BodyHomeWidget({super.key});

  @override
  State<BodyHomeWidget> createState() => _BodyHomeWidgetState();
}

class _BodyHomeWidgetState extends State<BodyHomeWidget> {
  final reposetoryOrder = OrdersRepositori();
  int totalCount = 0;
  int jobCount = 0;
  int awaitCount = 0;
  int saveCount = 0;


  @override
  void initState() {
    super.initState();
    _loadCounts();
  }

  Future<void> _loadCounts() async {
    var count = await reposetoryOrder.getOrders();

    final total = await count.length;
    final job = await reposetoryOrder.getOrdersCountByState(2);
    final awaitOrders = await reposetoryOrder.getOrdersCountByState(1);
    final save = await reposetoryOrder.getOrdersCountByState(0);

    setState(() {
      totalCount = total;
      jobCount = job;
      awaitCount = awaitOrders;
      saveCount = save;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 216.h,
      padding: EdgeInsets.only(left: 8.h),
      decoration: BoxDecoration(
        color: containerColor,
        border: BoxBorder.all(color: borderColor, width: 1.w),
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
      //  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              titleBodyCard(
                'home.bodyTotal'.tr(),
                'assets/icons/home/total.svg',
                totalCount,
              ),
              buttonBodyCard('home.bodyBtTotal'.tr(), colorBtTotal),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              titleBodyCard(
                'home.bodyJob'.tr(),
                'assets/icons/home/job.svg',
                jobCount,
              ),
              buttonBodyCard('home.bodyBtJob'.tr(), colorBtJob),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              titleBodyCard(
                'home.bodyAwait'.tr(),
                'assets/icons/home/await.svg',
                awaitCount,
              ),
              buttonBodyCard('home.bodyBtAwait'.tr(), colorBtAwait),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              titleBodyCard(
                'home.bodySave'.tr(),
                'assets/icons/home/save.svg',
                saveCount,
              ),
              buttonBodyCard('home.bodyBtSave'.tr(), colorBtSave),
            ],
          ),
          buttonNewCommand(),
        ],
      ),
    );
  }

  Widget buttonBodyCard(String text, HexColor color) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: BoxBorder.all(color: borderColor, width: 1.w),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
          ),
        ),
        width: 200.w,
        //  height: 53.h,
        margin: EdgeInsets.only(bottom: 32.h),
        padding: EdgeInsets.only(bottom: 10.h, top: 11.h),
        child: Center(child: Text(text, style: textStyleBodyBt)),
      ),
    );
  }

  Widget titleBodyCard(String title, String img, int count) {
    return Container(
      width: 200.w,
      //  height: 91.h,
      margin: EdgeInsets.only(top: 32.h, bottom: 5.h, left: 20.w),
      padding: EdgeInsets.only(top: 16.h),
      decoration: BoxDecoration(
        color: colorDividerSelected,
        border: BoxBorder.all(color: borderColor, width: 1.w),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(img, width: 24.w, height: 24.h,),
              Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text(title, style: textStyleBodyTitle),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Text(count.toString(), style: textStyleBodyTitleCount),
          ),
        ],
      ),
    );
  }

  Widget buttonNewCommand() {
    return Container(
      width: 200.w,
    //  height: 152.h,
      margin: EdgeInsets.only(left: 20.h),
     padding: EdgeInsets.only(top: 10.h, bottom: 22.h, left: 42.w, right: 42.w),
      decoration: BoxDecoration(
        color: buttonColor,
        border: BoxBorder.all(color: borderColor, width: 1.w),
        borderRadius: BorderRadius.all(
           Radius.circular(30.r),
        ),
      ),
      child: GestureDetector(
        onTap: (){},
        child: ButtonTheme(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  child: Icon(Icons.add_rounded, color: titleColorText, size: 48.r,)),
              SizedBox(
                child: Text(
                    'home.bodyBtCreateOne'.tr(),
                    maxLines: 1,
                    style: textStyleBodyBtCreate,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis
                ),
              ),
              SizedBox(
                //  padding: EdgeInsets.only(bottom: 24.w),
                child: Text(
                  'home.bodyBtCreateThee'.tr(),
                  maxLines: 1,
                  style: textStyleBodyBtCreate,
                  textAlign: TextAlign.center,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

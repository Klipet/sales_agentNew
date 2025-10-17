import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/data/repositories/orders_repositori.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../data/providers/navigator_provider.dart';

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
        width: double.infinity,
 //     padding: EdgeInsets.only(left: 8.h),
      decoration: BoxDecoration(
        color: containerColor,
        border: BoxBorder.all(color: borderColor, width: 1.w),
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
          ),
          Expanded(
            child: Column(
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
          ),
          Expanded(
            child: Column(
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
          ),
          Expanded(
            child: Column(
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
        width: 200.w,
          constraints: BoxConstraints(
              maxHeight: 53.h
      ),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: borderColor, width: 1.w),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
          ),
          margin: EdgeInsets.only(bottom: 30.h),
          padding: EdgeInsets.symmetric(
            vertical: 11.h * MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.3),
            horizontal: 16.w, // добавляем горизонтальные отступы
          ),
          child:
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(text,
                style: textStyleBodyBt,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              textScaler: TextScaler.linear(
                  MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.3)
              ),
            ),
          ),
        ),
    );
  }

  Widget titleBodyCard(String title, String img, int count) {
    return Container(
      width:  200.w,
      constraints: BoxConstraints(
        minHeight: 91.h
      ),
        margin: EdgeInsets.only(top: 30.h, bottom: 5.h, left: 20.w),
      //  padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 12.h),
        decoration: BoxDecoration(
          color: colorDividerSelected,
          border: Border.all(color: borderColor, width: 1.w),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize:MainAxisSize.min,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: SvgPicture.asset(
                        img,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                  TextSpan(text: title),
                ],
              ),
              style: textStyleBodyTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              textScaler: TextScaler.linear(
                MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.3),
              ),
            ),
            SizedBox(height: 6.h),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(count.toString(), style: textStyleBodyTitleCount),
            ),
          ],
        ),
    );
  }

  Widget buttonNewCommand() {
    return Container(
      width: 205.w,
      //  height: 152.h,
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      padding: EdgeInsets.only(top: 10.h, bottom: 22.h, left: 42.w, right: 42.w),
      decoration: BoxDecoration(
        color: buttonColor,
        border: Border.all(color: borderColor, width: 1.w),
        borderRadius: BorderRadius.all(
          Radius.circular(30.r),
        ),
      ),
      child: GestureDetector(
        onTap: (){
          Provider.of<NavigationProvider>(context, listen: false).goToPage(6);
        },
        child: ButtonTheme(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.add_rounded, color: titleColorText, size: 48.r,),
              SizedBox(
                child: Text(
                    'home.bodyBtCreateOne'.tr(),
                    maxLines: 1,
                    style: textStyleBodyBtCreate,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.linear(
                    MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.3),
                  ),
                ),
              ),
              SizedBox(
                //  padding: EdgeInsets.only(bottom: 24.w),
                child: Text(
                  'home.bodyBtCreateThee'.tr(),
                  maxLines: 1,
                  style: textStyleBodyBtCreate,
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.linear(
                    MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

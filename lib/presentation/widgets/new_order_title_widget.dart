import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/presentation/widgets/title_home_widget.dart';

import '../../core/styles_text.dart';

class NewOrderTitleWidget extends StatefulWidget {
  const NewOrderTitleWidget({super.key});

  @override
  State<NewOrderTitleWidget> createState() => _NewOrderTitleWidgetState();
}

class _NewOrderTitleWidgetState extends State<NewOrderTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 15.w),
        SizedBox(
          height: 100.h,
          child: Text(
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: false,
            ),
            "newComand.titleComand".tr(),
            style: primaFontOrders,
            textAlign: TextAlign.left,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: TitleHomeWidget(),
        ),
      ],
    );
  }
}

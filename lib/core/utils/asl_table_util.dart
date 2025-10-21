import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/models_db/model_db_assortiment/model_assortiment_db.dart';
import '../../packages/custom_tree_package.dart';
import '../colors_app.dart';
import '../styles_text.dart';

Widget folderStandart({
  required bool isSelected,
  required CustomTreeNode<ModelAssortimentDB> node,
}) {
  return Row(
    children: [
      Container(
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 12.w, right: 12.w),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : containerColor,
          border: Border(
            right: BorderSide(color: borderColor, width: 1.w),
          ),
        ),
        child: SvgPicture.asset(
          'assets/icons/assortiment/folder_open.svg',
          width: 24.w,
          height: 24.h,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        height: double.maxFinite,
        //      width: double.maxFinite,
        //   MediaQuery.of(context).size.width/ 1.4,
        padding: EdgeInsets.only(left: 15.w),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : containerColor,
        ),
        child: Text(node.displayName, style: textStyleAslContent),
      ),
    ],
  );
}

Widget selectedFolder({
  required BuildContext context,
  required bool isSelected,
  required CustomTreeNode<ModelAssortimentDB> node,
}) {
  return Expanded(
    child: Row(
      children: [
        Container(
          height: double.maxFinite,
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : containerColor,
            border: Border(
              right: BorderSide(color: borderColor, width: 1.w),
            ),
          ),
          child: SvgPicture.asset(
            'assets/icons/assortiment/folder_open.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: double.maxFinite,
                  //      width: double.maxFinite,
                  //   MediaQuery.of(context).size.width/ 1.4,
                  padding: EdgeInsets.only(left: 15.w),
                  decoration: BoxDecoration(
                    color: isSelected ? selectedColor : containerColor,
                    border: Border(
                      right: BorderSide(color: borderColor, width: 1.w),
                    ),
                  ),
                  child: Text(node.displayName, style: textStyleAslContent),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: double.maxFinite,
                width: 155.w,
                padding: EdgeInsets.only(left: 16.w),
                decoration: BoxDecoration(
                  color: isSelected ? selectedColor : containerColor,
                  border: Border(
                    right: BorderSide(color: borderColor, width: 1.w),
                  ),
                ),
                child: Text('gridColumn.price'.tr(), style: textStyleAslTitle),
              ),
              Container(
                width: 133.w,
                alignment: Alignment.centerLeft,
                height: double.maxFinite,
                padding: EdgeInsets.only(left: 16.w),
                decoration: BoxDecoration(
                  color: isSelected ? selectedColor : containerColor,
                  border: Border(
                    right: BorderSide(color: borderColor, width: 1.w),
                  ),
                ),
                child: Text('gridColumn.remain'.tr(), style: textStyleAslTitle),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget aslContentWidget({
  required bool isSelected,
  required CustomTreeNode<ModelAssortimentDB> node,
}) {
  return Expanded(
    child: Row(
      children: [
        Container(
          height: double.maxFinite,
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
          decoration: BoxDecoration(
            color: isSelected
                ? selectedColor
                : containerColor,
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 1.w,
              ),
            ),
          ),
          child: SvgPicture.asset(
            'assets/icons/assortiment/box_asl.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
        Expanded(
          child: Row(
            children: [
               Expanded(
                 child: Container(
                    alignment: Alignment.centerLeft,
                    height: double.maxFinite,
                    padding: EdgeInsets.only(left: 15.w),
                    decoration: BoxDecoration(
                      color: isSelected ? selectedColor : containerColor,
                      border: Border(
                        right: BorderSide(color: borderColor, width: 1.w),
                      ),
                    ),
                    child: Text(node.displayName, style: textStyleAslContentSub),
                  ),
               ),
              Container(
                alignment: Alignment.centerLeft,
                height: double.maxFinite,
                width: 155.w,
                padding: EdgeInsets.only(left: 16.w),
                decoration: BoxDecoration(
                  color: isSelected ? selectedColor : containerColor,
                  border: Border(
                    right: BorderSide(color: borderColor, width: 1.w),
                  ),
                ),
                child: Text(node.nodeData!.price!.toStringAsFixed(2), style: textStyleAslContentPriceSub),
              ),
              Container(
                width: 133.w,
                alignment: Alignment.centerLeft,
                height: double.maxFinite,
                padding: EdgeInsets.only(left: 16.w),
                decoration: BoxDecoration(
                  color: isSelected ? selectedColor : containerColor,
                  border: Border(
                    right: BorderSide(color: borderColor, width: 1.w),
                  ),
                ),
                child: Text(node.nodeData!.remain!.toStringAsFixed(2), style: textStyleAslContentSub),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

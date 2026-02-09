
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_agent/data/providers/api_provider/assortiment_img_api.dart';
import 'package:sales_agent/data/repositories/login_repositori.dart';
import 'package:sales_agent/logic/blocs/assortiment_image_bloc/assortiment_img_cubit.dart';
import 'package:sales_agent/presentation/widgets/loading_widget.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../data/models_db/model_db_assortiment/model_assortiment_db.dart';
import '../../logic/blocs/assortiment_image_bloc/assotriment_img_state.dart';
import '../../packages/content_image.dart';

Future assortimentInfo({
  required BuildContext context,
  required ModelAssortimentDB asl,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext contextDialog) {
      return AssortimentInfo(asl: asl);
    },
  );
}

class AssortimentInfo extends StatelessWidget {
  final ModelAssortimentDB asl;

  const AssortimentInfo({super.key, required this.asl});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AssortimentImgCubit(AssortimentImgApi(), LoginRepository())
            ..loadImg(aslUuid: asl.uid!),
      child: AssortimentInfoUI(asl: asl),
    );
  }
}

class AssortimentInfoUI extends StatefulWidget {
  final ModelAssortimentDB asl;

  const AssortimentInfoUI({super.key, required this.asl});

  @override
  State<AssortimentInfoUI> createState() => _AssortimentInfoUIState();
}

class _AssortimentInfoUIState extends State<AssortimentInfoUI> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.start,
      contentPadding: EdgeInsets.only(right: 16.h, left: 32.h),
      constraints: BoxConstraints(
        maxWidth: 600.w,
        maxHeight:  widget.asl.description!.isNotEmpty ? 571.h : 464.h,
        minHeight: widget.asl.description!.isNotEmpty ? 571.h : 464.h,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Stack(
            alignment: AlignmentGeometry.topRight,
            children: [
              _closeContainer(context),
              BlocBuilder<AssortimentImgCubit, AssotrimentImgState>(
                builder: (context, state) {
                  if (state is ImgLoading) {
                    return LoadingWidget(width: 192.w, height: 192.h);
                  } else if (state is ImgSuccess) {
                    return ContentImage(img: state.imgResponse.images);
                  } if(state is ImgFailure){
                    return ContentImage(img: []);
                  }
                  return ContentImage(img: []);
                },
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            alignment: Alignment.center,
            width: double.maxFinite,
            child: Text(widget.asl.name!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: textStyleDialogAddAssortimentTotal.copyWith(fontSize: 21.sp),),
          ),
          _infoAsl(widget.asl),
          if (widget.asl.description!.isNotEmpty)
            Container(
              margin: EdgeInsets.only(top: 15.h),
              alignment: Alignment.center,
              width: double.maxFinite,
              child: Text(widget.asl.description!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: textStyleRemainAddAssotrimentOrder.copyWith(color: subTextColor), ),
            ),
        ],
      ),
    );
  }
}

Widget _closeContainer(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: SvgPicture.asset('assets/icons/close.svg'),
  );
}

Widget _infoAsl(ModelAssortimentDB asl) {
  return Container(
    margin: EdgeInsets.only(right: 16.h, top: 16.h),
    decoration: BoxDecoration(
      border: Border.symmetric(
        horizontal: BorderSide(color: borderColor, width: 1.w),
      ),
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.h, left: 5.w, right: 5.h),
          child: Row(
            children: [
              Text('newOrderdialog.price'.tr(), style: textStyleRemainAddAssotrimentOrder.copyWith(color: subTextColor, fontSize: 22.sp),),
              Spacer(),
              Text(asl.price!.toStringAsFixed(2), style: textStyleDialogAddAssortimentTotal.copyWith(fontSize: 22.sp),),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 16.h, left: 5.w, right: 5.w, top: 16.h,),
          child: Row(
            children: [
              Text('newOrderdialog.stok'.tr(), style: textStyleRemainAddAssotrimentOrder.copyWith(color: subTextColor, fontSize: 22.sp),),
              Spacer(),
              Text('${asl.remain!.toStringAsFixed(2)} ${asl.unitName}', style: textStyleRemainAddAssotrimentOrder.copyWith(fontSize: 22.sp),),
            ],
          ),
        ),
      ],
    ),
  );
}



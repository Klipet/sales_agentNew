import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_agent/data/models_api/models_assortiment/image_item.dart';
import 'package:sales_agent/data/providers/api_provider/assortiment_img_api.dart';
import 'package:sales_agent/data/repositories/login_repositori.dart';
import 'package:sales_agent/logic/blocs/assortiment_image_bloc/assortiment_img_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../data/models_api/models_client_prices/prices.dart';
import '../../data/models_db/model_db_assortiment/model_assortiment_db.dart';
import '../../logic/blocs/assortiment_image_bloc/assotriment_img_state.dart';

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
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ImgSuccess) {
                    print(state.contragrnt.images);
                    return ContentImage(img: state.contragrnt.images);
                  } return ContentImage(img: []);
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
          margin: EdgeInsets.only(top: 16.h, left: 5.w, right: 5.h),
          child: Row(
            children: [
              Text('Preț unitar', style: textStyleRemainAddAssotrimentOrder.copyWith(color: subTextColor, fontSize: 22.sp),),
              Spacer(),
              Text(asl.price!.toStringAsFixed(2), style: textStyleDialogAddAssortimentTotal.copyWith(fontSize: 22.sp),),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 16.h, left: 5.w, right: 5.w, top: 16.h,),
          child: Row(
            children: [
              Text('Stocuri', style: textStyleRemainAddAssotrimentOrder.copyWith(color: subTextColor, fontSize: 22.sp),),
              Spacer(),
              Text('${asl.remain!.toStringAsFixed(2)} ${asl.unitName}', style: textStyleRemainAddAssotrimentOrder.copyWith(fontSize: 22.sp),),
            ],
          ),
        ),
      ],
    ),
  );
}

class ContentImage extends StatefulWidget {
  final List<ImageItem> img;
  const ContentImage({super.key, required this.img});

  @override
  State<ContentImage> createState() => _ContentImageState();
}

class _ContentImageState extends State<ContentImage> {

  List<Uint8List> images = [];
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();
  @override
  void initState() {
    super.initState();
    image(widget.img);
  }

  void image(List<ImageItem> img) {
    for (var image in img) {
      if (image.image1 != null && image.image1!.isNotEmpty) {
        setState(() {});
        images.add(Uint8List.fromList(image.image1!));
      }
      if (image.image2 != null && image.image2!.isNotEmpty) {
        setState(() {});
        images.add(Uint8List.fromList(image.image2!));
      }
      if (image.image3 != null && image.image3!.isNotEmpty) {
        setState(() {});
        images.add(Uint8List.fromList(image.image3!));
      }
      if (image.image4 != null && image.image4!.isNotEmpty) {
        setState(() {});
        images.add(Uint8List.fromList(image.image4!));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                  images.isNotEmpty ?  _carouselController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ) : null;
                  },
                  child: SvgPicture.asset('assets/icons/info_asl/arrow_left.svg', color: images.isNotEmpty ? Colors.black : borderColor,)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 48.h),
                padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 16.w),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: borderColor, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                ),
                child: images.isNotEmpty
                    ? Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 192.w,
                          height: 192.h,
                          child: CarouselSlider(
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              viewportFraction: 1,
                              // Уменьшаем для создания отступов
                              padEnds: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              enableInfiniteScroll: true,
                              autoPlay: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                            items: images.map((bytes) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                // Отступы между фотками
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.r),
                                    ),
                                    boxShadow: [
                                      // Необязательно: добавить тень для глубины
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 4.r,
                                        offset: Offset(0, 2.h),
                                      ),
                                    ],
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  // Обрезаем содержимое по закругленным краям
                                  child: Image.memory(
                                    bytes,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),

                  ],
                )
                    : Column(
                  children: [
                    SvgPicture.asset('assets/icons/info_asl/non_image.svg', ),
                    Text('Nu s-au găsit imagini...', style: textStyleRemainAddAssotrimentOrder.copyWith(color: subTextColor, fontSize: 15.sp),),
                  ],
                ),
              ),
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                  images.isNotEmpty ? _carouselController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ): null;
                  },
                  child: SvgPicture.asset('assets/icons/info_asl/arrow_right.svg', color: images.isNotEmpty ? Colors.black : borderColor,)),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 5.h),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                return Container(
                  width: _currentIndex == index ? 8.w : 6.w,
                  height: _currentIndex == index ? 8.h : 6.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: borderColor,
                  ),
                );
              }),
            ),
        ),
      ],
    );
  }
}




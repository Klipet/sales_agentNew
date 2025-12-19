import 'dart:typed_data';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../data/models_api/models_assortiment/image_item.dart';

void showImagesDialog(
    BuildContext context,
    List<ImageItem> images,
    ) {

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {


      return AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
          backgroundColor: Colors.transparent,
        content: Column(
          children: [
            // Заголовок
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon:  Icon(Icons.close, color: Colors.white,size: 52.r,),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(child: ContentImage(img: images))

          ],
        ),
      );
    },
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
                  child: SvgPicture.asset('assets/icons/info_asl/arrow_left.svg', color: images.isNotEmpty ? Colors.white : borderColor, width: 70.r,height: 70.r,)),
              Container(
              //  margin: EdgeInsets.symmetric(horizontal: 48.h),
              //  padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 16.w),
              //  decoration: BoxDecoration(
              //    border: BoxBorder.all(color: borderColor, width: 1.w),
              //    borderRadius: BorderRadius.all(Radius.circular(15.r)),
              //  ),
                child: images.isNotEmpty
                    ? Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.6,
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
                                    fit: BoxFit.fill,
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
                    Text('imgError'.tr(), style: textStyleRemainAddAssotrimentOrder.copyWith(color: subTextColor, fontSize: 15.sp),),
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
                  child: SvgPicture.asset('assets/icons/info_asl/arrow_right.svg', color: images.isNotEmpty ? Colors.white : borderColor, width: 70.r,height: 70.r,)),
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
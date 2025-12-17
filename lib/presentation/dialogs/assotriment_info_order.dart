import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:sales_agent/presentation/dialogs/show_iages_dialog.dart';


import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../data/models_api/models_client_prices/prices.dart';
import '../../data/models_db/model_db_assortiment/model_assortiment_db.dart';
import '../../logic/blocs/assortiment_image_bloc/assortiment_img_cubit.dart';
import '../../logic/blocs/assortiment_image_bloc/assotriment_img_state.dart';
import '../../logic/blocs/new_order_bloc/new_order_bloc.dart';
import '../../logic/blocs/new_order_bloc/new_order_event.dart';
import '../../logic/blocs/new_order_bloc/new_order_state.dart';
import '../widgets/counter_widget.dart';

Future<bool?> showAssortimentInfoOrder({
  required BuildContext context,
  required ModelAssortimentDB asl,
  required Prices? prices,
  required int idDocument,
}) async {
  final orderBloc = context.read<NewOrderBloc>();
  final orderBlocAls = context.read<AssortimentImgCubit>();

  return await showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      orderBlocAls.loadImg(aslUuid:asl.uid ?? '');
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: orderBloc),
          BlocProvider.value(value: orderBlocAls),
        ],
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 402.w,
              maxHeight: 336.h,
            ),
            padding: EdgeInsets.only(top: 16.r, left: 16.r, right: 16.r),
            decoration: BoxDecoration(
              color: primariColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Column(
              children: [
                // Заголовок с иконкой и кнопкой закрытия
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/assortiment/box_asl.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                    SizedBox(width: 16.w),
                    // Кнопка для просмотра изображения
                    GestureDetector(
                      onTap: () {
                        final state = context.read<AssortimentImgCubit>().state;
                        if (state is ImgSuccess && state.imgResponse.images.isNotEmpty) {
                          showImagesDialog(
                            dialogContext,
                            state.imgResponse.images,
                          );
                        }
                      },
                      child: BlocBuilder<AssortimentImgCubit, AssotrimentImgState>(
                        builder: (context, state) {
                          // Меняем иконку в зависимости от состояния
                           if (state is ImgSuccess) {
                             if(state.imgResponse.images.isNotEmpty && state.imgResponse.images != [] ){
                               return Icon(
                                 Icons.photo_camera,
                                 color: buttonColor, // Цвет если изображение есть
                               );
                             }
                          }
                          return SizedBox();
                        },
                      ),
                    ),
                  ],
                ),

                // Название товара
                Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  child: Text(
                    asl.name ?? 'Без названия',
                    style: textStyleTitleAddAssotrimentOrder,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(height: 16.h),

                // Цена
                Row(
                  children: [
                    Text(
                      'Preț unitar',
                      style: textStyleAslTitle.copyWith(
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Spacer(),
                    Text(
                      _formatPrice(asl, prices),
                      style: textStyleAslContentPriceSub.copyWith(
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                // Остатки
                Row(
                  children: [
                    Text(
                      'Stocuri',
                      style: textStyleAslTitle.copyWith(
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Spacer(),
                    Text(
                      _formatRemain(asl),
                      style: textStyleRemainAddAssotrimentOrder,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      asl.unitName ?? 'шт',
                      style: textStyleOutlandsText.copyWith(
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),
                Divider(color: borderColor),

                // Счётчик количества и кнопка подтверждения
                BlocBuilder<NewOrderBloc, NewOrderState>(
                  builder: (context, state) {

                    return CounterWidget(
                      asl: asl,
                      prices: prices,
                      onConfirm: (quantity, sum) async {

                        // Добавляем товар в заказ через BLoC
                        context.read<NewOrderBloc>().add(
                          AddLineToOrderEvent(
                            item: asl,
                            quantity: quantity,
                            priceSelected: prices,
                            id: idDocument
                          ),
                        );
                        // Закрываем диалог с успехом
                        Navigator.pop(dialogContext, true);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        );
    },
  );
}



/// Форматирование цены
String _formatPrice(ModelAssortimentDB asl, Prices? prices) {
  final price = prices?.price ?? asl.price ?? 0.0;
  return price.toStringAsFixed(2);
}

/// Форматирование остатков
String _formatRemain(ModelAssortimentDB asl) {
  if (asl.remain == null) return '0';

  if (asl.nonWhole == false) {
    return asl.remain!.toStringAsFixed(0);
  } else {
    return asl.remain!.toStringAsFixed(2);
  }
}

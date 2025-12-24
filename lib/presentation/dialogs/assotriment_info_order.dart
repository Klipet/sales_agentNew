import 'package:easy_localization/easy_localization.dart';
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
import '../widgets/loading_widget.dart';

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
      orderBlocAls.loadImg(aslUuid: asl.uid ?? '');
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: orderBloc),
          BlocProvider.value(value: orderBlocAls),
        ],
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 600.w, maxHeight: 704.h),
            padding: EdgeInsets.only(top: 16.r, left: 32.r, right: 32.r),
            decoration: BoxDecoration(
              color: titleColorText,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              children: [
                // Заголовок с иконкой и кнопкой закрытия
                Stack(
                  alignment: AlignmentGeometry.topRight,
                  children: [
                    BlocBuilder<AssortimentImgCubit, AssotrimentImgState>(
                      builder: (context, state) {
                        if (state is ImgLoading) {
                          return LoadingWidget(width: 192.w, height: 192.h);
                        } else if (state is ImgSuccess) {
                          return ContentImage(img: state.imgResponse.images);
                        }
                        if (state is ImgFailure) {
                          return ContentImage(img: []);
                        }
                        return ContentImage(img: []);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
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
                Divider(color: borderColor),
                SizedBox(height: 16.h),
                _price(prices: prices ?? null, asl: asl),
                SizedBox(height: 16.h),
                // Остатки
                _remain(asl: asl),
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
                            id: idDocument,
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

Widget _remain({required ModelAssortimentDB asl}){
  return   Row(
    children: [
      Text(
        'newOrderdialog.stok'.tr(),
        style: textStyleAslTitle.copyWith(
          decoration: TextDecoration.none,
          fontSize: 22.sp,
        ),
      ),
      Spacer(),
      Text(
        _formatRemain(asl),
        style: textStyleRemainAddAssotrimentOrder.copyWith(fontSize: 22.sp, color: textColor),
      ),
      SizedBox(width: 3.w),
      Text(
        asl.unitName ?? 'шт',
        style: textStyleOutlandsText.copyWith(
          decoration: TextDecoration.none,
          fontSize: 22.sp,
        ),
      ),
    ],
  );
}

Widget _price({required Prices? prices, required ModelAssortimentDB asl}) {
  // Цена
  return Column(
    children: [
      Row(
        children: [
          Text(
            prices == null ?
            'newOrderdialog.price'.tr() : 'Preț special',
            style: textStyleAslTitle.copyWith(
              decoration: TextDecoration.none,
              fontSize: 22.sp,
            ),
          ),
          Spacer(),
          Text(
          prices == null ? asl.price!.toStringAsFixed(2) : prices.price.toStringAsFixed(2),
            style: textStyleAslContentPriceSub.copyWith(
              decoration: TextDecoration.none,
              fontSize: 22.sp,
              color: prices != null ? Colors.red : textColor
            ),
          ),
        ],
      ),

      if (prices != null)
        Row(
          children: [
            Text(
              'newOrderdialog.price'.tr(),
              style: textStyleAslTitle.copyWith(
                decoration: TextDecoration.none,
                fontSize: 16.sp,
              ),
            ),
            Spacer(),
            Text(
              asl.price!.toStringAsFixed(2),
              style: textStyleAslContentPriceSub.copyWith(
                decoration: TextDecoration.none,
                fontSize: 16.sp,
                color: subTextColor
              ),
            ),
          ],
        ),
    ],
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

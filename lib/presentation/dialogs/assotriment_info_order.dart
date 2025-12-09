import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';


import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../data/models_api/models_client_prices/prices.dart';
import '../../data/models_db/model_db_assortiment/model_assortiment_db.dart';
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

  return await showGeneralDialog<bool>(
    context: context,
    barrierDismissible: false,
    barrierLabel: "Dialog",
    barrierColor: Colors.black.withOpacity(0.2),
    pageBuilder: (dialogContext, anim1, anim2) {
      return BlocProvider.value(
      value: orderBloc,
        child:   GlassmorphicContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        borderRadius: 0,
        blur: 2,
        alignment: Alignment.center,
        border: 0,
        linearGradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.05),
          ],
        ),
        borderGradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.5),
          ],
        ),
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
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pop(dialogContext, false),
                      child: Icon(
                        Icons.close_rounded,
                        color: textColor,
                        size: 30.r,
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
        ));
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

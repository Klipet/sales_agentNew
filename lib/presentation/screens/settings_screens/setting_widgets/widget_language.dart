import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors_app.dart';
import '../../../../core/styles_text.dart';

class WidgetLanguage extends StatefulWidget {
  const WidgetLanguage({super.key});

  @override
  State<WidgetLanguage> createState() => _WidgetLanguageState();
}

class _WidgetLanguageState extends State<WidgetLanguage> {
  final List<Locale> languageList = [
    Locale('ro', 'RO'),
    Locale('ru', 'RU'),
    Locale('en', 'GB'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(languageList.length, (int index) {
        final locale = languageList[index];
        final isSelected = context.locale == locale;

        return Container(
          constraints: BoxConstraints(
            minWidth: 126.w,
            minHeight: 48.h,
            maxWidth: 126.w,
            maxHeight: 48.h
          ),
          margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: isSelected ? primariColor : Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color:  borderColor,
              width: 1.w,
            ),
          ),
          child: InkWell(
            onTap: () => context.setLocale(locale),
            child: Center(
              child: Text(
                _getLanguageName(locale.languageCode),
                style: textStyleDialogAddAssortimentTotalNegative.copyWith(fontSize: 18.sp, color: textColor)
              ),
            ),
          ),
        );
      }),
    );
  }

  String _getLanguageName(String code) {
    switch (code) {
      case 'ro':
        return 'Română';
      case 'ru':
        return 'Русский';
      case 'en':
        return 'English';
      default:
        return code;
    }
  }
}

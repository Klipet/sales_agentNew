import 'dart:ui';

import 'package:advanced_search/advanced_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_client_db.dart';
import 'package:sales_agent/data/repositories/client_repositori.dart';
import 'package:sales_agent/packages/advance_search_widget.dart';

import '../../../core/styles_text.dart';
import '../../../data/providers/navigator_provider.dart';
import '../../widgets/title_home_widget.dart';

class FirstStepCreate extends StatefulWidget {
  const FirstStepCreate({super.key});

  @override
  State<FirstStepCreate> createState() => _FirstStepCreateState();
}

class _FirstStepCreateState extends State<FirstStepCreate> {
  late List<ModelClientDb> client = [];
  late ClientRepositori clientRepositori;
  ModelClientDb? selectedClient;

  @override
  void initState() {
    super.initState();
    loadClient();
  }

  Future<void> loadClient() async {
    clientRepositori = ClientRepositori();
    final data = await clientRepositori.getAllClients();
    setState(() {
      client = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
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
          ),
          SizedBox(height: 15.h),
          Container(
            constraints: BoxConstraints(maxHeight: 127.h),
            margin: EdgeInsets.only(left: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: BoxBorder.all(color: borderColor, width: 1.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12.w, bottom: 10),
                    child: Text('Client', style: textStyleSerachTitle,)),
                ediTextClient(context, 'Caută după denumire sau IDNO'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ediTextClient(BuildContext contextEdit, String hint) {
    return Container(
      //  width: 1134.w,
      height: 48.h,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: CustomSearchWidget<ModelClientDb>(
      //  autofocus: true,
        items: client,
        displayStringForOption: (client) => client.name ?? '',
        subtitleStringForOption: (client) => client.idnp ?? '',
        showSelectedAsHint: true,
        clearAfterSelection: true,
        onSelected: (client) {
          print('Выбран: ${client}');
          Provider.of<NavigationProvider>(contextEdit, listen: false).goToPageAndDestroy(7);
        },
        onSearchChanged: (query) {
          print('Search query: $query');
        },


        // ============ КАСТОМИЗАЦИЯ ТЕКСТОВОГО ПОЛЯ ============
        hintText: hint,
        hintStyle: textHintSearchClient,
        textStyle: textStyleSearchClient,
        fillColor: containerColor,
        borderColor: borderColor,
        focusedBorderColor: null,
        borderRadius: 10.r,
        borderWidth: 1.w,
        //   final EdgeInsets? contentPadding;
        prefixIcon: null,
        suffixPadding: EdgeInsets.symmetric(vertical: 12.h),
        suffixIcon: SvgPicture.asset(
          'assets/icons/orders/search.svg',
          width: 24.w,
          height: 24.h,
        ),
        // ============ КАСТОМИЗАЦИЯ ВЫПАДАЮЩЕГО СПИСКА ============
        dropdownBackgroundColor: containerColor,
        dropdownBorderRadius: 10.r,
        dropdownMaxHeight: 241.h,

        // ============ КАСТОМИЗАЦИЯ ЭЛЕМЕНТОВ СПИСКА ============

        itemHoverColor: borderColor.withOpacity(0.4),
        itemHeight: 47.h,
        itemTitleStyle: textStyleSearchClient,

        //    final double? textFieldHeight;
      ),
    );
  }
}

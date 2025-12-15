import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sales_agent/presentation/widgets/history_orders_list_widget.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../data/models_db/model_db_clients/model_client_db.dart';
import '../../data/repositories/client_repositori.dart';
import '../../packages/advance_search_widget.dart';
import '../widgets/new_order_title_widget.dart';

class HistortyScreen extends StatefulWidget {
  const HistortyScreen({super.key});

  @override
  State<HistortyScreen> createState() => _HistortyScreenState();
}

class _HistortyScreenState extends State<HistortyScreen> {
  late List<ModelClientDb> client = [];
  late ClientRepositori clientRepositori;
  late ModelClientDb selectedClient;

  @override
  void initState() {
    super.initState();
    selectedClient = ModelClientDb();
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
          NewOrderTitleWidget(title: 'Istoric comezi',),
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
                  child: Text('Client', style: textStyleSerachTitle),
                ),
                ediTextClient(context, 'Caută după denumire sau IDNO'),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: HistoryOrdersListWidget(client: selectedClient,),
            ),
          )
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
        autofocus: false,
        items: client,
        displayStringForOption: (client) => client.name ?? '',
        subtitleStringForOption: (client) => client.idnp ?? '',
        showSelectedAsHint: true,
        clearAfterSelection: true,
        onSelected: (client) {
          setState(() {});
          selectedClient = client;
        },
        // ============ КАСТОМИЗАЦИЯ ТЕКСТОВОГО ПОЛЯ ============
        hintText: selectedClient.name ?? hint,
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

  @override
  void dispose() {
    debugPrint('DISPOSE: CustomSearchWidget');
    super.dispose();
  }
}

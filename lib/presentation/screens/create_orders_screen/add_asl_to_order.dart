import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/models_api/models_client_prices/client_prices.dart';
import 'package:sales_agent/data/models_api/models_client_prices/price_lists.dart';
import 'package:sales_agent/data/providers/api_provider/price_list_client_api.dart';
import 'package:sales_agent/presentation/widgets/table_assortiment_widghet.dart';

import '../../../core/styles_text.dart';
import '../../../data/models_api/models_client_detail/detail_outlands.dart';
import '../../../data/models_db/model_db_clients/model_client_db.dart';
import '../../../data/providers/navigator_provider.dart';
import '../../../logic/blocs/client_detail_blocs/client_detail_bloc.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/new_order_title_widget.dart';

class AddAslToOrder extends StatefulWidget {
  const AddAslToOrder({super.key});

  @override
  State<AddAslToOrder> createState() => _AddAslToOrderState();
}

class _AddAslToOrderState extends State<AddAslToOrder> {
  late ModelClientDb clientDb;
  late DetailOutlands? outlands;
  late ClientPrices priceLists;
  bool isLoaded = false;
  String _search = '';
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    controller.dispose(); // 👈 освобождаем память
    super.dispose();
  }

  Future<void> getData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final navProvider = Provider.of<NavigationProvider>(
        context,
        listen: false,
      );
      final client = navProvider.getPageData<ModelClientDb>('client');
      final outlet = navProvider.getPageData<DetailOutlands>('outlet');
      final clientPrice = await PriceListClientApi().getClientPrice();
      if (client != null) {
        setState(() {
          clientDb = client;
          outlands = outlet ?? DetailOutlands(address: '', comment: '');
          priceLists = clientPrice;
          isLoaded = true;
        });
        // navProvider.clearPageData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return Center(
        child: LoadingWidget(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      );
    }
    return Scaffold(
      body: Column(
        children: [
          _titleSearchAsl(
            clientDb.name ?? '',
            (outlands?.comment.isEmpty ?? true)
                ? (outlands?.address ?? '')
                : (outlands?.comment ?? ''),
            clientDb.idnp ?? '',
          ),
          
          Expanded(child:
          Padding(
            padding: EdgeInsets.only(top: 16.w, left: 15.h),
            child: TableAssortimentWidghet(search: _search, clientPrices: priceLists.priceLists, onItemSelected: (item, {priceSelected}){
              print(item.pricelineUid);
              print(priceSelected?.price);
            } ),
          ))
        ],
      ),
    );
  }

  Widget _titleSearchAsl(String clientName, String outlans, String idno) {
    return Container(
      constraints: BoxConstraints(maxHeight: 112.h),
      margin: EdgeInsets.only(top: 16.w, left: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(color: borderColor, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(clientName, style: textStyleTitleAslAdd,),
              Spacer(),
              Text(outlans, style: textStyleTitleAslAdd.copyWith( fontWeight: FontWeight.w300, fontSize: 15),),
              Spacer(),
              Text(idno,  style: textStyleTitleAslAdd.copyWith(color: borderColor)),
            ],
          ),
          SizedBox(height: 6.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ediTextClient(controller, 'Caută produs'),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Provider.of<NavigationProvider>(
                    context,
                    listen: false,
                  ).goToPage(8);
                },
                child: Container(
                  constraints: BoxConstraints(maxHeight: 42.h, maxWidth: 231.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    border: Border.all(color: borderColor, width: 1.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Vizualizează comanda",style: textStyleTitleAslAdd, ),
                      SizedBox(width: 8.h),
                      SvgPicture.asset(
                        'assets/icons/shopping_cart.svg',
                        width: 20.w,
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget ediTextClient(TextEditingController controller, String hint) {
    return Container(
      width: 857.w,
      height: 42.h,
    //  margin: EdgeInsets.only(left: 10.h),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _search = value.toString();
            //  controller.text.trim(); // это обновит TableOrderWidget
          });
        },
        controller: controller,
        keyboardType: TextInputType.text,
        cursorWidth: 1.w,
        cursorColor: borderColor,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: textStyleHintOrder,
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 12.h, right: 16.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _search = controller.text;
                  if (kDebugMode) {
                    print('asl: $_search');
                  }
                });
              },
              child: SvgPicture.asset(
                'assets/icons/orders/search.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: borderColor, // цвет границы
              width: 1.r, // ширина 1px
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: borderColor, // цвет границы
              width: 1.r, // ширина 1px
            ),
          ),
        ),
      ),
    );
  }
}

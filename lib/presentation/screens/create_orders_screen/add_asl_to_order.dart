import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/models_api/models_client_prices/client_prices.dart';
import 'package:sales_agent/data/models_api/models_client_prices/price_lists.dart';
import 'package:sales_agent/data/models_db/model_db_new_order/new_model_document_id.dart';
import 'package:sales_agent/data/providers/api_provider/price_list_client_api.dart';
import 'package:sales_agent/data/repositories/new_order_repositori.dart';
import 'package:sales_agent/data/repositories/price_repositori.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_bloc.dart';
import 'package:sales_agent/logic/blocs/price_blocs/price_state.dart';
import 'package:sales_agent/presentation/widgets/table_assortiment_widghet.dart';

import '../../../core/constans.dart';
import '../../../core/styles_text.dart';
import '../../../data/models_api/models_client_detail/detail_outlands.dart';
import '../../../data/models_db/model_db_clients/model_client_db.dart';
import '../../../data/providers/navigator_provider.dart';
import '../../../logic/blocs/client_detail_blocs/client_detail_bloc.dart';
import '../../../logic/blocs/new_order_bloc/new_order_state.dart';
import '../../../logic/blocs/price_blocs/price_cubit.dart';
import '../../dialogs/assotriment_info_order.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/new_order_title_widget.dart';

class AddAslToOrder extends StatelessWidget {
  const AddAslToOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewOrderBloc(NewOrderRepository(), NewModelDocumentId(), context),
      child: AddAslToOrderUI(),
    );
  }
}

class AddAslToOrderUI extends StatefulWidget {

  const AddAslToOrderUI({super.key});

  @override
  State<AddAslToOrderUI> createState() => _AddAslToOrderState();
}

class _AddAslToOrderState extends State<AddAslToOrderUI> {
  late ModelClientDb clientDb;
  late DetailOutlands? outlands;
  late List<PriceLists>? priceLists;
  late int id;
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
      final client = navProvider.getPageData<ModelClientDb>( Constant().modelDB);
      final outlet = navProvider.getPageData<DetailOutlands>( Constant().outlet);
      final idDoc = navProvider.getPageData( Constant().id);
      final price = await PriceRepositori().getPriceListsFromIsar(
        client!.pricelistUid ?? '',
      );

      if (client != null) {
        setState(() {
          clientDb = client;
          id = idDoc;
          outlands = outlet ?? DetailOutlands(address: '', comment: '');
          priceLists = price;
          print('price: Order $priceLists');
          isLoaded = true;
        });
        // await getPrice(client.uid!);
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 16.w, left: 15.h),
              child: TableAssortimentWidghet(
                search: _search,
                clientPrices: priceLists! ?? [],
                onItemSelected: (item, {priceSelected}) {
                  //  print(item.pricelineUid);
                  //  print(priceSelected?.price);
                  showAssortimentInfoOrder(
                    asl: item,
                    prices: priceSelected,
                    context: context,
                    idDocument: id
                  );
                },
              ),
            ),
          ),
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
              Text(clientName, style: textStyleTitleAslAdd),
              Spacer(),
              Text(
                outlans,
                style: textStyleTitleAslAdd.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              Spacer(),
              Text(
                idno,
                style: textStyleTitleAslAdd.copyWith(color: borderColor),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ediTextClient(controller, 'Caută produs'),
              Spacer(),

              Stack(
                children: [

                  Container(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Stack(
                      children: [
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
                                Text("Vizualizează comanda", style: textStyleTitleAslAdd),
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
                  ),
                  counterAsl(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget counterAsl() {
    return BlocBuilder<NewOrderBloc, NewOrderState>(
      builder: (context, state) {
        int itemCount = 0;
        if (state is NewOrderLoaded) {
          itemCount = state.order.lines.length;
        } else if (state is NewOrderUpdated) {
          itemCount = state.order.lines.length;
        }

        if (itemCount == 0) {
          return SizedBox.shrink();
        }

        return Positioned(
          left: 1.w,
          bottom: 0.h,
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: buttonColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$itemCount',
                style: textStyleDialogAddAssortimentTotalInfo
              ),
            ),
          ),
        );
      },
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

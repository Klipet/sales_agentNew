import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/models_api/models_client_prices/price_lists.dart';
import 'package:sales_agent/data/repositories/new_order_repositori.dart';
import 'package:sales_agent/data/repositories/price_repositori.dart';
import 'package:sales_agent/logic/blocs/assortiment_blocs/assortiment_state.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_bloc.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_event.dart';
import 'package:sales_agent/presentation/widgets/table_assortiment_widghet.dart';
import '../../../core/constans.dart';
import '../../../core/styles_text.dart';

import '../../../data/models_api/models_client/ourlets_response.dart';
import '../../../data/models_db/model_db_clients/model_client_db.dart';
import '../../../data/providers/api_provider/assortiment_img_api.dart';
import '../../../data/providers/api_provider/assotriment_api.dart';
import '../../../data/providers/navigator_provider.dart';
import '../../../data/repositories/assortiment_repositori.dart';
import '../../../data/repositories/login_repositori.dart';
import '../../../logic/blocs/assortiment_blocs/assortiment_bloc.dart';
import '../../../logic/blocs/assortiment_image_bloc/assortiment_img_cubit.dart';
import '../../../logic/blocs/new_order_bloc/new_order_state.dart';
import '../../dialogs/assotriment_info_order.dart';
import '../../widgets/loading_widget.dart';

class AddAslToOrder extends StatelessWidget {
  const AddAslToOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NewOrderBloc(NewOrderRepository(), context),
        ),
        BlocProvider(
          create: (_) =>
              AssortimentBloc(AssortimentApi(), AssortimentRepositori())
                ..fetchAssortiment(),
        ),
        BlocProvider(
          create: (_) =>
          AssortimentImgCubit(AssortimentImgApi(), LoginRepository()),
        ),
      ],
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
  late OutletsResponse? outlands;
  late List<PriceLists>? priceLists;
  late int id;
  bool isLoaded = false;
  String _search = '';
  late int itemCount;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  //  context.read<AssortimentBloc>().fetchAssortiment();
    getData();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> getData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final navProvider = Provider.of<NavigationProvider>(
        context,
        listen: false,
      );
      final client = navProvider.getPageData<ModelClientDb>(Constant().modelDB);
      final outlet = navProvider.getPageData<OutletsResponse>(Constant().outlet);
      final idDoc = navProvider.getPageData(Constant().id);
      final price = await PriceRepositori().getPriceListsFromIsar(
        client!.pricelistUid ?? '',
      );

      if (client != null) {
        setState(() {
          clientDb = client;
          id = idDoc;
          context.read<NewOrderBloc>().add(LoadLineCountEvent(idDoc));
          outlands = outlet ?? OutletsResponse(address: '', comment: '');
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
          aslContent(),
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
              ediTextClient(controller, 'newOrder.serchAsl'.tr()),
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
                            constraints: BoxConstraints(
                              maxHeight: 42.h,
                              maxWidth: 231.w,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: containerColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                              border: Border.all(
                                color: borderColor,
                                width: 1.w,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'newOrder.btReturn'.tr(),
                                  style: textStyleTitleAslAdd,
                                ),
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
                  _counterLine(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget aslContent() {
    return BlocBuilder<AssortimentBloc, AssortimentState>(
      builder: (context, state) {
        if (state is AssortimentSuccess) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 16.w, left: 15.h),
              child: TableAssortimentWidghet(
                search: _search,
                clientPrices: priceLists! ?? [],
                onItemSelected: (item, {priceSelected}) {
                  //  print(priceSelected?.price);
                  showAssortimentInfoOrder(
                    asl: item,
                    prices: priceSelected,
                    context: context,
                    idDocument: id,
                  );
                },
              ),
            ),
          );
        } else if (state is AssortimentFailure) {
          return Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/empti.svg',
                          width: 446.w,
                          height: 259.h,
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: Text(
                            state.message,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 16.w, left: 15.h),
            child: TableAssortimentWidghet(
              search: _search,
              clientPrices: priceLists! ?? [],
              onItemSelected: (item, {priceSelected}) {
                //  print(priceSelected?.price);
                showAssortimentInfoOrder(
                  asl: item,
                  prices: priceSelected,
                  context: context,
                  idDocument: id,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _counterLine() {
    return BlocBuilder<NewOrderBloc, NewOrderState>(
      builder: (context, state) {
        final int itemCount;

        if (state is NewOrderLoaded) {
          itemCount = state.order.lines.length;
        } else if (state is NewOrderUpdated) {
          itemCount = state.order.lines.length;
        } else if (state is NewOrderLineCountUpdated) {
          itemCount = state.count; // Новое состояние
        } else {
          itemCount = 0;
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
                style: textStyleDialogAddAssortimentTotalInfo,
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

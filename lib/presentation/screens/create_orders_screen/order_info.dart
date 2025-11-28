import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:sales_agent/data/models_api/models_client_detail/detail_outlands.dart';
import 'package:sales_agent/presentation/toast/toast_response_new_order.dart';
import 'package:sales_agent/presentation/widgets/loading_widget.dart';
import 'package:sales_agent/presentation/widgets/table_new_order_asl.dart';

import '../../../core/colors_app.dart';
import '../../../core/constans.dart';
import '../../../core/styles_text.dart';
import '../../../data/models_api/new_order_post/new_order_model_post_response_api.dart';
import '../../../data/models_db/model_db_clients/model_client_db.dart';

import '../../../data/providers/navigator_provider.dart';
import '../../widgets/buttons_new_order_widget.dart';
import '../../widgets/new_order_title_widget.dart';

class FreeStepCreate extends StatefulWidget {
  const FreeStepCreate({super.key});

  @override
  State<FreeStepCreate> createState() => _FreeStepCreateState();
}

class _FreeStepCreateState extends State<FreeStepCreate> {
  late ModelClientDb? clientDb;
  late DetailOutlands? outlands;
  late int? idDocument;

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final navProvider = Provider.of<NavigationProvider>(
        context,
        listen: false,
      );
      final client = await navProvider.getPageData<ModelClientDb>(
        Constant().modelDB,
      );
      final outlet = await navProvider.getPageData<DetailOutlands>(
        Constant().outlet,
      );
      final id = await navProvider.getPageData(Constant().id);

      if (client != null) {
        setState(() {
          clientDb = client;
          outlands = outlet;
          idDocument = id;
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
          NewOrderTitleWidget(),
          SizedBox(height: 15.w),
          _infoClient(name: clientDb!.name!, idnp: clientDb!.idnp!, page: 6),
          if (outlands != null) SizedBox(height: 15.w),
          if (outlands != null)
            _infoClient(
              name: outlands!.comment == ''
                  ? outlands!.address
                  : outlands!.comment,
              idnp: '',
              page: 7,
            ),
          Expanded(child: TableNewOrderAsl(orderId: idDocument ?? 0)),
          SizedBox(height: 15.w),
          ButtonsNewOrderWidget(
            clientDb: clientDb,
            outlands: outlands,
            id: idDocument,
            onConfirm: (response, message, save ){
              if(response != null){
                ToastResponseNewOrder(context).toastSucces();
                Provider.of<NavigationProvider>(
                  context,
                  listen: false,
                ).goToPageAndDestroy(0);
              }else if(message != null){
                ToastResponseNewOrder(context).toastError();
                Provider.of<NavigationProvider>(
                  context,
                  listen: false,
                ).goToPageAndDestroy(0);
              }else if(save == true){
                ToastResponseNewOrder(context).toastSave();
                Provider.of<NavigationProvider>(
                  context,
                  listen: false,
                ).goToPageAndDestroy(0);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _infoClient({
    required String name,
    required String idnp,
    required int page,
  }) {
    return Container(
      constraints: BoxConstraints(maxHeight: 64.h, minHeight: 64.h),
      margin: EdgeInsets.only(left: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(color: borderColor, width: 1.w),
      ),
      child: Row(
        children: [
          Text(name, style: textStyleSearchClient),
          Spacer(),
          Text(idnp, style: textStyleSerachTitleIDNO),
          Spacer(),
          GestureDetector(
            onTap: () {
              Provider.of<NavigationProvider>(
                context,
                listen: false,
              ).goToPage(page);
            },
            child: Container(
              constraints: BoxConstraints(maxHeight: 32.h, maxWidth: 147.w),
              //  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 25.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.all(Radius.circular(100.r)),
                border: Border.all(color: borderColor, width: 1.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/pop/edit.svg',
                    width: 20.w,
                    height: 20.h,
                  ),
                  SizedBox(width: 8.h),
                  Text("Modifică"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

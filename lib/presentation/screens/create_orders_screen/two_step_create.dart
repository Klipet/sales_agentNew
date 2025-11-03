import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/models_api/models_client/ourlets_response.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_client_db.dart';
import 'package:sales_agent/data/providers/api_provider/client_detail_api.dart';
import 'package:sales_agent/logic/blocs/client_detail_blocs/client_detail_bloc.dart';
import 'package:sales_agent/logic/blocs/client_detail_blocs/client_detail_state.dart';
import 'package:sales_agent/presentation/widgets/loading_widget.dart';

import '../../../core/styles_text.dart';
import '../../../core/utils/costom_sidebar.dart';
import '../../../data/providers/navigator_provider.dart';
import '../../widgets/new_order_title_widget.dart';
import '../../widgets/title_home_widget.dart';

class TwoStepCreate extends StatelessWidget {
  const TwoStepCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClientDetailBloc(ClientDetailApi()),
      child: TwoStepCreateUI(),
    );
  }
}

class TwoStepCreateUI extends StatefulWidget {
  const TwoStepCreateUI({super.key});

  @override
  State<TwoStepCreateUI> createState() => _TwoStepCreateUIState();
}

class _TwoStepCreateUIState extends State<TwoStepCreateUI>
    with SingleTickerProviderStateMixin {
  late ModelClientDb clientDb;
  bool isLoaded = false;


  @override
  void initState() {
    super.initState();
    FocusManager.instance.primaryFocus?.unfocus();
    getData();
  }


  Future<void> getData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final navProvider = Provider.of<NavigationProvider>(
        context,
        listen: false,
      );
      final client = navProvider.getPageData<ModelClientDb>('client');
      await  context.read<ClientDetailBloc>().loadClient(client!.uid!);
      if (client != null) {
        setState(() {
          clientDb = client;
          isLoaded = true;
        });
        navProvider.clearPageData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return LoadingWidget(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NewOrderTitleWidget(),
          SizedBox(height: 15.h),
          _infoClient(),
          SizedBox(height: 15.h,),
          if(clientDb != null)
          Padding(
            padding: EdgeInsets.only(left: 35.h),
            child: Text('Selectează adresa:'),
          ),
          infoOutlans(),
        ],
      ),
    );
  }

  Widget _infoClient() {
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
          Text(clientDb.name!, style: textStyleSearchClient),
          Spacer(),
          Text(clientDb.idnp!, style: textStyleSerachTitleIDNO),
          Spacer(),
          GestureDetector(
            onTap: () {
              Provider.of<NavigationProvider>(
                context,
                listen: false,
              ).goToPage(6);
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


  Widget infoOutlans(){
    return BlocBuilder<ClientDetailBloc, ClientDetailState>(
        builder: (context, state){
          if(state is ClientDetailLoading){
            return Expanded(
              child: LoadingWidget(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            );
          }
          else if(state is ClientDetailFailure){
            return Text(state.message);
          }else if(state is ClientDetailSuccess){
            final outlets = state.contragrnt.outlets;
            if(outlets.isEmpty || outlets == null){
              return Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/empti.svg', width: 446.w, height: 259.h,),
                            SizedBox(height: 16),
                            Text(
                              'errors.notFound'.tr(),
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  //  SizedBox(height: 50,),
                    GestureDetector(
                      onTap: () {
                        print("Tap_tap");
                        Provider.of<NavigationProvider>(
                          context,
                          listen: false,
                        ).goToPageAndSave(8, data:{ 'client': clientDb,});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxHeight: 50.h, maxWidth: 147.w),
                            //  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 25.w),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 20.w),
                            decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.all(Radius.circular(100.r)),
                              border: Border.all(color: borderColor, width: 1.w),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.skip_next_outlined, color: Colors.white,size: 24.r,),
                                SizedBox(width: 8.h),
                                Text("Next page", style: TextStyle(
                                  color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }else {
              print('${state.contragrnt.outlets.length} state is ClientDetailSuccess');
              return Container(
                margin: EdgeInsets.only(left: 15.w),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  border: Border.all(color: borderColor, width: 1.w),
                ),
                child: Column(
                  children: state.contragrnt.outlets.map((outlet) {
                    final text = outlet.comment != '' ? outlet.comment : outlet.address;
                    return GestureDetector(
                      onTap: () {
                        Provider.of<NavigationProvider>(
                          context,
                          listen: false,
                        ).goToPageAndSave(
                          8,
                          data: {
                            'client': clientDb,
                            'outlet': outlet, // передаем конкретный outlet
                          },
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.h),
                            child: Text(
                              text,
                              style: textStyleOutlandsText,
                            ),
                          ),
                          Divider(color: borderColor, thickness: 1, height: 1),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            }}
          return Expanded(
            child: LoadingWidget(
              width: double.maxFinite,
              height: double.maxFinite,
            ),
          );
        }
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sales_agent/core/utils/asl_table_util.dart';
import 'package:sales_agent/data/providers/api_provider/assotriment_api.dart';
import 'package:sales_agent/data/repositories/assortiment_repositori.dart';
import 'package:sales_agent/logic/blocs/assortiment_blocs/assortiment_bloc.dart';
import 'package:sales_agent/logic/blocs/assortiment_blocs/assortiment_state.dart';
import 'package:sales_agent/presentation/dialogs/assortiment_info.dart';
import 'package:sales_agent/presentation/toast/toast_response_error.dart';
import 'package:sales_agent/presentation/widgets/loading_widget.dart';
import 'package:sales_agent/presentation/widgets/table_assortiment_widghet.dart' hide AssortimentRepositori;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/colors_app.dart';
import '../../core/errors/error_toast.dart';
import '../../core/styles_text.dart';
import '../widgets/button_widget.dart';
import '../widgets/title_home_widget.dart';

class AssortimentScreen extends StatelessWidget {
  const AssortimentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AssortimentBloc(AssortimentApi(), AssortimentRepositori())
            ..fetchAssortiment(),
      child: AssortimentUI(),
    );
  }
}

class AssortimentUI extends StatefulWidget {
  const AssortimentUI({super.key});

  @override
  State<AssortimentUI> createState() => _AssortimentUIState();
}

class _AssortimentUIState extends State<AssortimentUI> {
  String _search = "";
  final TextEditingController _editingController = TextEditingController();



  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssortimentBloc, AssortimentState>(
      listener: (BuildContext context, AssortimentState state) {
    //    print('LISTENER: State type: ${state.runtimeType}'); // ДОБАВЬТЕ

        if (state is AssortimentFailure) {
          ToastResponseError(context: context, textError: state.message).showError();
        }
        if(state is AssortimentFailureNonInternet){
          ToastResponseError(context: context, textError: 'я не смог загрузить и сохранить ассортимент').showError();
        }
      },
      builder: (context, state) {
    //    print('BUILDER: State type: ${state.runtimeType}'); // ДОБАВЬТЕ
        if (state is AssortimentSuccess) {
    //      print('SUCCESS: Orders count: ${state.orders.length}'); // ДОБАВЬТЕ
        }

        if (state is AssortimentLoading) {
          return LoadingWidget(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          );
        }

        if (state is AssortimentSuccess) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 40.w),
                  SizedBox(
                    height: 100.h,
                    child: Text(
                      textHeightBehavior: TextHeightBehavior(
                          applyHeightToFirstAscent: false
                      ),
                      "asl.title".tr(),
                      style: primaFontOrders,
                    //  textAlign: TextAlign.left,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: TitleHomeWidget(),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: ediTextClient(_editingController, 'asl.search'.tr())),
                  SizedBox(width: 15.w),
                  btCreate(context: context),
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: TableAssortimentWidghet(search: _search, onItemSelected: (item, {priceSelected}) {
                    //  print(priceSelected?.price);
                    assortimentInfo(
                        asl: item,
                      context: context
                    );
                  },)),
              )
            ],
          );
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 40.w),
                SizedBox(
                  height: 100.h,
                  child: Text(
                    textHeightBehavior: TextHeightBehavior(
                        applyHeightToFirstAscent: false
                    ),
                    "asl.title".tr(),
                    style: primaFontOrders,
                    //  textAlign: TextAlign.left,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: TitleHomeWidget(),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: ediTextClient(_editingController, 'asl.search'.tr())),
                SizedBox(width: 15.w),
                btCreate(context: context),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: TableAssortimentWidghet(search: _search, onItemSelected: (item, {priceSelected}) {
                    //  print(priceSelected?.price);
                    assortimentInfo(
                        asl: item,
                        context: context
                    );
                  },)),
            )
          ],
        );
      },
    );
  }
  Widget ediTextClient(TextEditingController controller, String hint) {
    return Container(
   //   width: 800.w,
      height: 48.h,
      margin: EdgeInsets.only(left: 10.h),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        onChanged: (value){
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
              onTap: (){
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
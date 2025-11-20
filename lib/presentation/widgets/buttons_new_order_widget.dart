
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_bloc.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_state.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../data/models_api/models_client_detail/detail_outlands.dart';
import '../../data/models_db/model_db_clients/model_client_db.dart';
import '../../data/models_db/model_db_new_order/new_model_document_id.dart';
import '../../data/providers/navigator_provider.dart';
import '../../data/repositories/new_order_repositori.dart';
class ButtonsNewOrderWidget extends StatelessWidget {
  final ModelClientDb? clientDb;
  final DetailOutlands? outlands;
  const ButtonsNewOrderWidget({super.key, this.clientDb, this.outlands});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NewOrderBloc( NewOrderRepository(), NewModelDocumentId())),
      ],
      child: BlocConsumer<NewOrderBloc, NewOrderState>(
          listener: (context, state){

          },
          builder:(context, state){
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buttonAddAsl(context, clientDb,outlands),
              ],
            );
          }
      )
    );
  }
}

Widget buttonAddAsl(BuildContext context, ModelClientDb? clientDb, DetailOutlands? outlands ){
  return GestureDetector(
    onTap: () {
      print("T");
      Provider.of<NavigationProvider>(
        context,
        listen: false,
      ).goToPageAndSave(
        9,
        data: {'client': clientDb, 'outlet': outlands},
      );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 50.h,
            maxWidth: 316.w,
          ),
          //  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 25.w),
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 20.w),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(100
                .r)),
            border: Border.all(color: borderColor, width: 1.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 32.r,
              ),
              SizedBox(width: 8.h),
              Text("Adaugă asortiment", style: textStyleBtAslAdd),
            ],
          ),
        ),
      ],
    ),
  );
}
Widget buttonSaveOrder(BuildContext context, ModelClientDb? clientDb, DetailOutlands? outlands ){
  return GestureDetector(
    onTap: () {
      print("T");
      Provider.of<NavigationProvider>(
        context,
        listen: false,
      ).goToPageAndSave(
        9,
        data: {'client': clientDb, 'outlet': outlands},
      );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 50.h,
            maxWidth: 316.w,
          ),
          //  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 25.w),
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 20.w),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(100
                .r)),
            border: Border.all(color: borderColor, width: 1.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 32.r,
              ),
              SizedBox(width: 8.h),
              Text("Adaugă asortiment", style: textStyleBtAslAdd),
            ],
          ),
        ),
      ],
    ),
  );
}
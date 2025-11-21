
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/data/providers/api_provider/order_post_api.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_bloc.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_state.dart';
import 'package:sales_agent/logic/blocs/new_order_post_bloc/new_order_post_bloc.dart';

import '../../core/colors_app.dart';
import '../../core/constans.dart';
import '../../core/styles_text.dart';
import '../../data/models_api/models_client_detail/detail_outlands.dart';
import '../../data/models_db/model_db_clients/model_client_db.dart';
import '../../data/models_db/model_db_new_order/new_model_document_id.dart';
import '../../data/providers/navigator_provider.dart';
import '../../data/repositories/new_order_repositori.dart';
import '../../logic/blocs/new_order_post_bloc/new_order_post_event.dart';
class ButtonsNewOrderWidget extends StatelessWidget {
  final ModelClientDb? clientDb;
  final DetailOutlands? outlands;
  final int? id;

  const ButtonsNewOrderWidget({super.key, this.clientDb, this.outlands,  this.id});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NewOrderBloc( NewOrderRepository(), NewModelDocumentId(), context)),
        BlocProvider(create: (_) => NewOrderPostBloc(OrderPostApi(), NewOrderRepository(), NewModelDocumentId()))
      ],
      child: BlocConsumer<NewOrderBloc, NewOrderState>(
          listener: (context, state){

          },
          builder:(context, state){
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buttonSaveOrder(context),
                SizedBox(width: 16.w,),
                buttonSendServerOrder(context),
                SizedBox(width: 16.w,),
                buttonAddAsl(context, clientDb,outlands, id),

              ],
            );
          }
      )
    );
  }
}

Widget buttonAddAsl(BuildContext context, ModelClientDb? clientDb, DetailOutlands? outlands, int? idDocument ){
  return GestureDetector(
    onTap: () {
      print("T");
      Provider.of<NavigationProvider>(
        context,
        listen: false,
      ).goToPageAndSave(
        9,
        data: {Constant().modelDB: clientDb, Constant().outlet: outlands, Constant().id: idDocument},
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


Widget buttonSendServerOrder(BuildContext context){
  return GestureDetector(
    onTap: () {
    //  context.read<NewOrderPostBloc>().add(
    //     NewOrderPostEvent()
   //   );
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
            color: colorBtJob,
            borderRadius: BorderRadius.all(Radius.circular(100
                .r)),
            border: Border.all(color: borderColor, width: 1.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_outlined,
                color: Colors.white,
                size: 32.r,
              ),
              SizedBox(width: 8.h),
              Text("Transmite comanda", style: textStyleBtAslAdd),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buttonSaveOrder(BuildContext context){
  return GestureDetector(
    onTap: () {
      //  context.read<NewOrderPostBloc>().add(
      //     NewOrderPostEvent()
      //   );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 50.h,
            maxWidth: 265.w,
          ),
          //  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 25.w),
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 20.w),
          decoration: BoxDecoration(
            color: colorBtAwait,
            borderRadius: BorderRadius.all(Radius.circular(100
                .r)),
            border: Border.all(color: borderColor, width: 1.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/dawn.svg'),
              SizedBox(width: 8.h),
              Text("Salvează șablon", style: textStyleBtAslAdd),
            ],
          ),
        ),
      ],
    ),
  );
}
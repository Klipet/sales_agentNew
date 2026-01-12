
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/data/models_api/models_client/ourlets_response.dart';
import 'package:sales_agent/data/providers/api_provider/order_post_api.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_bloc.dart';
import 'package:sales_agent/logic/blocs/new_order_post_bloc/new_order_post_bloc.dart';
import 'package:sales_agent/logic/blocs/new_order_post_bloc/new_order_post_state.dart';
import '../../core/colors_app.dart';
import '../../core/constans.dart';
import '../../core/styles_text.dart';
import '../../data/models_api/new_order_post/new_order_model_post_response_api.dart';
import '../../data/models_db/model_db_clients/model_client_db.dart';
import '../../data/providers/navigator_provider.dart';
import '../../data/repositories/new_order_repositori.dart';
import '../../logic/blocs/new_order_post_bloc/new_order_post_event.dart';
import '../dialogs/dialog_comment.dart';
class ButtonsNewOrderWidget extends StatelessWidget {
  final ModelClientDb? clientDb;
  final OutletsResponse? outlands;
  final int? id;
  final Function(NewOrderModelPostResponseApi? response, bool save) onConfirm;

  const ButtonsNewOrderWidget({super.key, this.clientDb, this.outlands,  this.id,  required this.onConfirm});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NewOrderBloc( NewOrderRepository(), context)),
        BlocProvider(create: (_) => NewOrderPostBloc(OrderPostApi(), NewOrderRepository()))
      ],
      child: BlocConsumer<NewOrderPostBloc, NewOrderPostState>(
          listener: (context, state){
            if(state is OrderPostLoaded){
              onConfirm(state.response,  false);
            }else if(state is OrderPostError){
              onConfirm( state.response, false);
              print(' Error OrderStatePost: ${state.response.errorMessage}');
            }
          },
          builder:(context, state){
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 10.w,),
                buttonAddCommentOrder(context, id ?? -1),
                SizedBox(width: 10.w,),
                buttonSaveOrder(context, onConfirm),
                SizedBox(width: 10.w,),
                buttonSendServerOrder(context, id ?? -1),
                SizedBox(width: 10.w,),
                buttonAddAsl(context, clientDb,outlands, id),

              ],
            );
          }
      )
    );
  }
}

Widget buttonAddAsl(BuildContext context, ModelClientDb? clientDb, OutletsResponse? outlands, int? idDocument ){
  return GestureDetector(
    onTap: () {
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
            maxWidth: 310.w,
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
              Text('newOrder.btAsl'.tr(), style: textStyleBtAslAdd),
            ],
          ),
        ),
      ],
    ),
  );
}


Widget buttonSendServerOrder(BuildContext context, int id){
  return GestureDetector(
    onTap: () {
      context.read<NewOrderPostBloc>().add(
        FetchOrderPostData(id),   // передаём ID заказа в Isar
      );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 50.h,
            maxWidth: 310.w,
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
              Text('newOrder.btSend'.tr(), style: textStyleBtAslAdd),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buttonSaveOrder(BuildContext context,  Function(NewOrderModelPostResponseApi? response,  bool save) onConfirm){
  return GestureDetector(
    onTap: (){
      onConfirm(null,  true);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 50.h,
            maxWidth: 255.w,
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
              Text('newOrder.btSablon'.tr(), style: textStyleBtAslAdd),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buttonAddCommentOrder(BuildContext context, int id){
  return  GestureDetector(
    onTap: () {
   //   dialogComment(context: context, order: id);

      showDialog(
          context: context,
          builder: (context) => DialogCommentUI(orderId: id,)
      );

    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 50.h,
            maxWidth: 240.w,
          ),
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 20.w),
          decoration: BoxDecoration(
            color: colorBtTotal,
            borderRadius: BorderRadius.all(Radius.circular(100
                .r)),
            border: Border.all(color: borderColor, width: 1.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mode_comment,
                color: Colors.white,
                size: 30.r,
              ),
              SizedBox(width: 8.h),
              Text('newOrder.btComment'.tr(), style: textStyleBtAslAdd),
            ],
          ),
        ),
      ],
    ),
  );
}
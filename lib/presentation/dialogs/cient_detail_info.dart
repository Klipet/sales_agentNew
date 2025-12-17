import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_agent/core/constans.dart';
import 'package:sales_agent/data/models_api/models_client_detail/client_detail.dart';
import 'package:sales_agent/logic/blocs/client_detail_blocs/client_detail_state.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../../data/models_api/models_client/ourlets_response.dart';
import '../../data/models_db/model_db_clients/model_client_db.dart';
import '../../data/providers/api_provider/client_detail_api.dart';
import '../../data/providers/navigator_provider.dart';
import '../../data/repositories/client_repositori.dart';
import '../../data/repositories/new_order_repositori.dart';
import '../../logic/blocs/client_detail_blocs/client_detail_bloc.dart';
import '../../logic/blocs/new_order_bloc/new_order_bloc.dart';
import '../../logic/blocs/new_order_bloc/new_order_event.dart';
import '../../logic/blocs/new_order_bloc/new_order_state.dart';

Future clientDetailInfo({
  required BuildContext context,
  required ModelClientDb clientInfo,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return ClientInfoDialog(info: clientInfo);
    },
  );
}

class ClientInfoDialog extends StatelessWidget {
  final ModelClientDb info;

  const ClientInfoDialog({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              ClientDetailBloc(ClientDetailApi(), ClientRepositori())
                ..loadClient(info.uid!),
        ),
        BlocProvider(
          create: (_) => NewOrderBloc(NewOrderRepository(), context),
        ),
      ],
      child: ClientDialogUI(clientDetail: info),
    );
  }
}

class ClientDialogUI extends StatelessWidget {
  final ModelClientDb clientDetail;

  const ClientDialogUI({super.key, required this.clientDetail});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      constraints: BoxConstraints(
        maxHeight: 736.h,
        maxWidth: 666.w,
        minHeight: 736.h,
        minWidth: 666.w,
      ),
      actionsAlignment: MainAxisAlignment.start,
      contentPadding: EdgeInsets.all(16.r),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      content: BlocBuilder<ClientDetailBloc, ClientDetailState>(
        builder: (BuildContext context, ClientDetailState state) {
          if (state is ClientDetailSuccess) {
            return _contentDialog(
              context: context,
              clientApi: state.contragrnt,
              clientDb: clientDetail,
            );
          } else if (state is ClientDetailFailure) {
            return _contentDialog(
              context: context,
              clientApi: null,
              clientDb: clientDetail,
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  Widget _contentDialog({
    required BuildContext context,
    required ClientDetail? clientApi,
    required ModelClientDb? clientDb,
  }) {
    final outletsDb = clientDb?.outlets.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.r),
              child: Text(
                clientApi?.code ?? clientDb?.code ?? '',
                style: textStyleDialogClient,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/icons/close.svg'),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 16.h),
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
          ),
          child: _contentTitleInfo(clientApi, clientDb),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:
              (outletsDb?.isNotEmpty == true) ||
                  (clientApi?.outlets.isNotEmpty == true)
              ? List.generate(
                  clientApi?.outlets.length ?? clientDb?.outlets.length ?? 0,
                  (int index) {
                    final address =
                        clientApi?.outlets[index].address ??
                        outletsDb?[index].address;
                    final comment =
                        clientApi?.outlets[index].comment ??
                        outletsDb?[index].comment;
                    final String outletAddress =
                        comment?.trim().isNotEmpty == true
                        ? comment!
                        : address ?? 'Нет данных';
                    return BlocBuilder<NewOrderBloc, NewOrderState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            try {
                              if (outletsDb != null ||
                                  clientApi!.outlets.isNotEmpty) {
                                context.read<NewOrderBloc>().add(
                                  CreateOrderEvent(
                                    client:
                                        clientDb ??
                                        ModelClientDb(
                                          balance: clientApi!.balance,
                                          code: clientApi.code,
                                          idnp: clientApi.idnp,
                                          image: clientApi.image,
                                          name: clientApi.name,
                                          pricelistUid: clientApi.pricelistUid,
                                          tvaCode: clientApi.tvaCode,
                                          uid: clientApi.uid,
                                        ),
                                    outlet:
                                        clientApi?.outlets[index] ??
                                        OutletsResponse(
                                          address: address ?? '',
                                          comment: comment ?? '',
                                        ),
                                    page: 8,
                                  ),
                                );
                                Navigator.pop(context);
                              } else {}
                            } catch (e) {
                              // Если bloc недоступен, просто закрываем диалог
                              print('NwOrderBloc not aevailable: $e');
                              //  Navigator.pop(context);
                            }
                          },
                          child: _outlandContent(outletAddress),
                        );
                      },
                    ); // Замените на ваш виджет
                  },
                )
              : [
                  _buttonOutlentNull(
                    context: context,
                    clientDb: clientDb,
                    clientApi: clientApi,
                  ),
                ],
        ),
      ],
    );
  }

  Widget _buttonOutlentNull({
    required BuildContext context,
    required ClientDetail? clientApi,
    required ModelClientDb? clientDb,
  }) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20.h,),
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SvgPicture.asset(
               'assets/icons/empti.svg',
               width: 446.w,
               height: 259.h,
             ),
             SizedBox(height: 16),
             Text(
               'Nu am gasti adrese......'.tr(),
               style: TextStyle(
                 fontSize: 18,
                 color: Colors.grey[600],
               ),
             ),
           ],
         ),
        SizedBox(height: 80.h,),
        GestureDetector(
          onTap: () {
            context.read<NewOrderBloc>().add(
              CreateOrderEvent(
                client:
                clientDb ??
                    ModelClientDb(
                      balance: clientApi!.balance,
                      code: clientApi.code,
                      idnp: clientApi.idnp,
                      image: clientApi.image,
                      name: clientApi.name,
                      pricelistUid: clientApi.pricelistUid,
                      tvaCode: clientApi.tvaCode,
                      uid: clientApi.uid,
                    ),
                page: 8,
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: 50.h,
                  maxWidth: 200.w,
                ),
                //  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 25.w),
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 20.w),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.r),
                  ),
                  border: Border.all(color: borderColor, width: 1.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.moped_sharp,
                      color: Colors.white,
                      size: 24.r,
                    ),
                    SizedBox(width: 8.h),
                    Text(
                      "Creaza document",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contentTitleInfo(ClientDetail? clientApi, ModelClientDb? clientDb) {
    final nullStringIDNO = '-------------';
    final nullStringTVA = '-------';
    final Uint8List img = Uint8List.fromList(
      clientApi?.image ?? clientDb?.image ?? [],
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        img.isNotEmpty
            ? Image.memory(
                img,
                width: 96.w,
                height: 96.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return SvgPicture.asset(
                    'assets/icons/info_asl/non_image.svg',
                    width: 96.w,
                    height: 96.h,
                  );
                },
              )
            : SvgPicture.asset(
                'assets/icons/info_asl/non_image.svg',
                width: 96.w,
                height: 96.h,
              ),
        SizedBox(width: 32.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Denumire juridică',
              style: textStyleDialogClientInfo.copyWith(
                color: subTextColor,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              width: 330.w,
              child: Text(
                clientApi?.name ?? clientDb?.name ?? '',
                style: textStyleDialogClientInfo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            //  SizedBox(height: 10.h),
            Text(
              'IDNO',
              style: textStyleDialogClientInfo.copyWith(
                color: subTextColor,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              width: 330.w,
              child: Text(
                (clientApi?.idnp == '' ? nullStringIDNO : clientApi?.idnp) ??
                    (clientDb?.idnp == '' ? nullStringIDNO : clientDb?.idnp) ??
                    nullStringIDNO,
                style: textStyleDialogClientInfo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(right: 60.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TVA',
                style: textStyleDialogClientInfo.copyWith(
                  color: subTextColor,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                (clientApi?.tvaCode == ''
                        ? nullStringTVA
                        : clientApi?.tvaCode) ??
                    (clientDb?.tvaCode == ''
                        ? nullStringTVA
                        : clientDb?.tvaCode) ??
                    nullStringTVA,
                style: textStyleDialogClientInfo,
              ),
              //  SizedBox(height: 10.h),
              Text(
                'Sold',
                style: textStyleDialogClientInfo.copyWith(
                  color: subTextColor,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                (clientApi?.balance.toString() == ''
                        ? '0.0'
                        : clientApi?.balance.toString()) ??
                    (clientDb?.balance.toString() == ''
                        ? '0.0'
                        : clientDb?.balance.toString()) ??
                    '0.0',
                style: textStyleDialogClientInfo.copyWith(
                  color: colorSold(clientApi, clientDb),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color colorSold(ClientDetail? clientApi, ModelClientDb? clientDb) {
    if (clientApi != null) {
      if (clientApi.balance != null && clientApi!.balance.isNegative) {
        return Colors.redAccent;
      } else {
        return Colors.black;
      }
    } else if (clientDb != null) {
      if (clientDb.balance != null && clientDb.balance!.isNegative) {
        return Colors.redAccent;
      } else {
        return Colors.black;
      }
    }
    return Colors.blue;
  }

  Widget _outlandContent(String outlend) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.w),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Adresa',
            style: textStyleDialogClientInfo.copyWith(
              color: subTextColor,
              fontSize: 12.sp,
            ),
          ),
          Text(outlend, style: textStyleDialogClientInfo),
        ],
      ),
    );
  }
}

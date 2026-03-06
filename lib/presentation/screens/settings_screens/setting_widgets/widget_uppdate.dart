import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/providers/api_provider/assotriment_api.dart';
import 'package:sales_agent/data/repositories/assortiment_repositori.dart';
import 'package:sales_agent/data/repositories/client_repositori.dart';
import 'package:sales_agent/logic/blocs/assortiment_blocs/assortiment_bloc.dart';
import 'package:sales_agent/logic/blocs/client_detail_blocs/client_detail_bloc.dart';
import 'package:sales_agent/logic/blocs/clients_bloc/clients_cubit.dart';
import 'package:sales_agent/logic/blocs/document_bloc/documants_state.dart';
import 'package:sales_agent/presentation/toast/toast_response_error.dart';

import '../../../../core/styles_text.dart';
import '../../../../data/providers/api_provider/client_api.dart';
import '../../../../data/providers/api_provider/orders_api.dart';
import '../../../../data/providers/api_provider/price_list_client_api.dart';
import '../../../../data/repositories/orders_repositori.dart';
import '../../../../data/repositories/price_repositori.dart';
import '../../../../logic/blocs/assortiment_blocs/assortiment_state.dart';
import '../../../../logic/blocs/clients_bloc/clients_state.dart';
import '../../../../logic/blocs/document_bloc/documents_cubit.dart';
import '../../../../logic/blocs/price_blocs/price_cubit.dart';
import '../../../../logic/blocs/price_blocs/price_state.dart';
import '../../../../packages/toast_costom.dart';

class WidgetUppdate extends StatelessWidget {
  const WidgetUppdate({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AssortimentBloc>(create: (_) => AssortimentBloc(AssortimentApi(), AssortimentRepositori())),
      BlocProvider<DocumentsCubit>(create: (_) => DocumentsCubit(OrdersApi(), OrdersRepositori())),
      BlocProvider<ClientsCubit>(create: (_) => ClientsCubit(ClientApi(), ClientRepositori())),
      BlocProvider<PriceCubit>(create:(_) => PriceCubit(PriceListClientApi(), PriceRepositori()))
    ], 
        child: WidgetUppdateUI());
  }
}
class WidgetUppdateUI extends StatefulWidget {
  @override
  State<WidgetUppdateUI> createState() => _WidgetUppdateUIState();
}

class _WidgetUppdateUIState extends State<WidgetUppdateUI> {
  int _loadedCount = 0;
  int _totalCount = 4; // Количество блоков

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AssortimentBloc, AssortimentState>(
          listener: (context, state) {
            if (state is AssortimentSuccess) {
              _onModuleLoaded('Ассортимент');
            } else if (state is AssortimentFailure) {
              _onModuleError('Ассортимент', state.message);
            }
          },
        ),
        BlocListener<DocumentsCubit, DocumentState>(
          listener: (context, state) {
            if (state is OrdersLoaded) {
              _onModuleLoaded('Документы');
            } else if (state is OrdersError) {
              _onModuleError('Документы', 'Ошибка загрузки');
            }
          },
        ),
        BlocListener<ClientsCubit, ClientsState>(
          listener: (context, state) {
            if (state is ClientsLoaded) {
              _onModuleLoaded('Клиенты');
            } else if (state is ClientsError) {
              _onModuleError('Клиенты', 'Ошибка загрузки');
            }
          },
        ),
        BlocListener<PriceCubit, PriceState>(
          listener: (context, state) {
            if (state is PriceLoaded) {
              _onModuleLoaded('Цены');
            } else if (state is PriceError) {
              _onModuleError('Цены', 'Ошибка загрузки');
            }
          },
        ),
      ],
      child:  GestureDetector(
        onTap: _refreshAllData,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 48.h,
            minHeight: 48.h,
            maxWidth: 311.w,
            minWidth: 311.w
          ),
          margin: EdgeInsets.only(top: 32.w, left: 16.h, bottom: 16.w),
          decoration: BoxDecoration(
            color: primariColor,
            borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: borderColor, // цвет границы
            width: 1.r, // ширина 1px
          ),
          ),
            child: Center(child: Text('settings.update'.tr(), style: textStyleDialogAddAssortimentTotal.copyWith(fontSize: 18.sp),))),
      ),
    );
  }

  void _refreshAllData() {
    setState(() {
      _loadedCount = 0;
    });

    context.read<AssortimentBloc>().fetchAssortiment();
    context.read<DocumentsCubit>().fetchOrders();
    context.read<ClientsCubit>().fetchClients();
    context.read<PriceCubit>().fetchPriceList();

    ToastResponseError(context: context, textError: 'toast.update'.tr()).showUpdate();
  }

  void _onModuleLoaded(String moduleName) {
    setState(() {
      _loadedCount++;
    });

    print('✅ $moduleName загружен ($_loadedCount/$_totalCount)');

    if (_loadedCount == _totalCount) {
      CustomToast.dismissAll();
      Future.delayed(Duration(seconds: 1), () {
        ToastResponseError(context: context, textError: 'toast.updateSuccess'.tr()).showUpdateSucces();
      });
    }
  }

  void _onModuleError(String moduleName, String error) {
    ToastResponseError(context: context, textError: 'toast.updateFault'.tr()).showError();
  }
}


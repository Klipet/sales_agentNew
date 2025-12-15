import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales_agent/data/providers/api_provider/client_api.dart';
import 'package:sales_agent/data/providers/api_provider/login_api.dart';
import 'package:sales_agent/data/providers/api_provider/orders_api.dart';
import 'package:sales_agent/data/repositories/client_repositori.dart';
import 'package:sales_agent/data/repositories/login_repositori.dart';
import 'package:sales_agent/data/repositories/orders_repositori.dart';
import 'package:sales_agent/data/repositories/price_repositori.dart';
import 'package:sales_agent/logic/blocs/clients_bloc/clients_state.dart';
import 'package:sales_agent/logic/blocs/document_bloc/documants_state.dart';
import 'package:sales_agent/logic/blocs/document_bloc/documents_cubit.dart';
import 'package:sales_agent/logic/blocs/login_bloc/login_bloc.dart';
import 'package:sales_agent/logic/blocs/login_bloc/login_event.dart';
import 'package:sales_agent/logic/blocs/login_bloc/login_state.dart';
import 'package:sales_agent/logic/blocs/price_blocs/price_cubit.dart';
import 'package:sales_agent/presentation/widgets/home_drawer.dart';
import 'package:sales_agent/presentation/widgets/loading_widget.dart';

import '../../core/colors_app.dart';
import '../../core/errors/error_toast.dart';
import '../../core/styles_text.dart';
import '../../data/providers/api_provider/assotriment_api.dart';
import '../../data/providers/api_provider/price_list_client_api.dart';
import '../../data/repositories/assortiment_repositori.dart';
import '../../logic/blocs/assortiment_blocs/assortiment_bloc.dart';
import '../../logic/blocs/assortiment_blocs/assortiment_state.dart';
import '../../logic/blocs/clients_bloc/clients_cubit.dart';
import '../../logic/blocs/price_blocs/price_state.dart';
import '../toast/toast_response_error.dart';

class AuthLoginWidget extends StatelessWidget {
  final bool internet;

  const AuthLoginWidget({super.key, required this.internet});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(LoginRepository(), LoginApi()),
        ),
        BlocProvider<AssortimentBloc>(
          create: (_) =>
              AssortimentBloc(AssortimentApi(), AssortimentRepositori()),
        ),
        BlocProvider<DocumentsCubit>(
          create: (_) => DocumentsCubit(OrdersApi(), OrdersRepositori()),
        ),
        BlocProvider<ClientsCubit>(
          create: (_) => ClientsCubit(ClientApi(), ClientRepositori()),
        ),
        BlocProvider<PriceCubit>(
          create: (_) => PriceCubit(PriceListClientApi(), PriceRepositori()),
        ),
      ],
      child: AuthLoginWidgetUI(connectInternet: internet),
    );
  }
}

class AuthLoginWidgetUI extends StatefulWidget {
  final bool connectInternet;

  const AuthLoginWidgetUI({super.key, required this.connectInternet});

  @override
  State<AuthLoginWidgetUI> createState() => _AuthLoginWidgetUIState();
}

class _AuthLoginWidgetUIState extends State<AuthLoginWidgetUI>
    with TickerProviderStateMixin {
  bool hidePassword = true;
  bool savePass = false;
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  int _loadedCount = 0;
  final int _totalCount = 4; // Количество блоков

  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(
      CheckSavedLogin(),
    ); // проверка сохранённых данных
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              print(state.message);
              if(state.message == ''){
                _onModuleError('Login','LoginFailure: Nu este conectiune cu internet');
              }else if(state.message == 'login nu concide'){
                _onModuleErrorAuth('Login','Login sau parola nu concide');
              }
            } else if (state is LoginSuccess) {
              // Сбрасываем счётчик модулей
              _loadedCount = 0;
              _refreshAllData();
              _controllerPassword.clear();
              _controllerLogin.clear();
            }
          },
        ),
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
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, loginState) {
          final clientsState = context.watch<ClientsCubit>().state;
          // Показ загрузки
          if (loginState is LoginLoading) {
            if(_loadedCount != _totalCount){
              return LoadingWidget(width: 464.w, height: 448.h);
            }
          }
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 464.h, maxWidth: 448.w),
            child: Container(
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: borderColor, width: 1.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 48.r),
                    child: Center(
                      child: Text('auth'.tr(), style: autentificare),
                    ),
                  ),
                  SizedBox(
                    width: 328.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.r,
                            top: 32.r,
                            bottom: 8.r,
                          ),
                          child: Text('user'.tr(), style: titleCardInfo),
                        ),
                        Center(
                          child: ediTextAut(_controllerLogin, 'userHint'.tr()),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.r,
                            top: 16.r,
                            bottom: 8.r,
                          ),
                          child: Text('pass'.tr(), style: titleCardInfo),
                        ),
                        Center(
                          child: ediTextAut(
                            _controllerPassword,
                            'passHint'.tr(),
                            obscureText: hidePassword,
                            suffixIcon: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16.r, left: 15.r),
                          child: GestureDetector(
                            onTap: () => setState(() => savePass = !savePass),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  savePass
                                      ? 'assets/icons/chek_box.svg'
                                      : 'assets/icons/chec_unbox.svg',
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'saveAuth'.tr(),
                                      style: titleCardInfo,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 48.r),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                          FetchLoginData(
                            _controllerLogin.text,
                            _controllerPassword.text,
                            savePass,
                          ),
                        );
                      },
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(Size(175.w, 48.h)),
                        backgroundColor: WidgetStateProperty.all(buttonColor),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        ),
                      ),
                      child: Text(
                        'connect'.tr(),
                        style: buttonTextStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear(
                          MediaQuery.of(
                            context,
                          ).textScaleFactor.clamp(1.0, 1.3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget ediTextAut(
    TextEditingController controller,
    String hint, {
    bool obscureText = false,
    bool suffixIcon = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    bool hideIcon = true;
    return SizedBox(
      width: 328.w, // ширина
      height: 48.h, // высота
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: textHint,
          suffixIcon: suffixIcon
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      hidePassword = !hidePassword; // переключаем видимость
                    });
                  },
                  child: suffixIcon
                      ? Padding(
                          padding: EdgeInsetsGeometry.only(
                            right: 15.r,
                            top: 12.r,
                            bottom: 12.r,
                          ),
                          child: Image.asset(
                            hidePassword
                                ? 'assets/icons/pass_enable.png' // скрытый пароль
                                : 'assets/icons/pass_hide.png', // видимый пароль
                          ),
                        )
                      : null,
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r), // radius 10px
            borderSide: BorderSide(
              color: Colors.grey, // цвет границы
              width: 1.r, // ширина 1px
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Colors.blue, // цвет при фокусе
              width: 1.r,
            ),
          ),
        ),
      ),
    );
  }

  void _refreshAllData() {
    setState(() {
      _loadedCount = 0;
    });
    if (widget.connectInternet) {
      context.read<AssortimentBloc>().fetchAssortiment();
      context.read<DocumentsCubit>().fetchOrders();
      context.read<ClientsCubit>().fetchClients();
      context.read<PriceCubit>().fetchPriceList();
    } else {
      _onModuleError('все модули', 'Datele nu au fost actualizate');
    }

    //  ToastResponseError(context: context, textError: 'Datele se sincronizează, așteptați').showUpdate();
  }

  void _onModuleLoaded(String moduleName) {
    setState(() {
      _loadedCount++;
    });

    print('✅ $moduleName загружен ($_loadedCount/$_totalCount)');
    ToastResponseError(
      context: context,
      textError: 'Datele au fost actualizate cu succes $moduleName',
    ).showUpdate();


    if (_loadedCount == _totalCount) {
      ToastResponseError(
        context: context,
        textError: 'Datele au fost actualizate cu succes',
      ).showUpdateSucces();

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => HomeDrawer()),
        (route) => false,
      );
    }
  }

  void _onModuleError(String moduleName, String error) {
    ToastResponseError(
      context: context,
      textError: error,
    ).showError();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => HomeDrawer()),
          (route) => false,
    );
  }
  void _onModuleErrorAuth(String moduleName, String error) {
   return ToastResponseError(
      context: context,
      textError: error,
    ).showError();
  }
}

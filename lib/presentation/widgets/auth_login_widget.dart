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
  final lastAcess = LoginRepository();
  final int _totalCount = 4; // Количество блоков

  bool _isLoading = false;

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
  void _setLoading(bool value) {
    if (_isLoading != value) {
      setState(() {
        _isLoading = value;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) async {
            if (state is LoginFailure) {
              print(state.message);
              if(state.message == ''){
                _onModuleError('Login','toast.loginError'.tr());
              }else if(state.message == 'login nu concide'){
                _onModuleErrorAuth('Login','toast.loginNotMatch'.tr());
              }
            } else if (state is LoginSuccess) {
              // Сбрасываем счётчик модулей
              _loadedCount = 0;
              final access = await lastAcess.getLastAces();
              if(access?.day != DateTime.now().day){
                lastAcess.setLastAces(DateTime.now());
                _refreshAllData(lastAces: state.lastAcces);
              }else{
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomeDrawer()),
                      (route) => false,
                );
              }
              _controllerPassword.clear();
              _controllerLogin.clear();
            }
          },
        ),
        BlocListener<AssortimentBloc, AssortimentState>(
          listener: (context, state) {
            if (state is AssortimentSuccess) {

              _onModuleLoaded('documents.asl');
            } else if (state is AssortimentFailure) {
              _onModuleError('Ассортимент', 'toast.loadError'.tr(namedArgs: { 'documents':'documents.asl'.tr()}));
            }else if(state is AssortimentLoading){
              _setLoading(true);
            }
          },
        ),
        BlocListener<DocumentsCubit, DocumentState>(
          listener: (context, state) {
            if (state is OrdersLoaded) {
              LoadingWidget(width: 464.w, height: 448.h);
              _onModuleLoaded('documents.doc');
            } else if (state is OrdersError) {
              _onModuleError('Документы', 'toast.loadError'.tr(namedArgs: {'documents': 'documents.doc'.tr()}));
            }
            else if(state is OrdersLoading){
              _setLoading(true);
            }
          },
        ),
        BlocListener<ClientsCubit, ClientsState>(
          listener: (context, state) {
            if (state is ClientsLoaded) {
              LoadingWidget(width: 464.w, height: 448.h);
              _onModuleLoaded('documents.client');
            } else if (state is ClientsError) {
              _onModuleError('Клиенты', 'toast.loadError'.tr(namedArgs: {'documents': 'documents.client'.tr()}));
            }
            else if(state is ClientsLoading){
              _setLoading(true);
            }
          },
        ),
        BlocListener<PriceCubit, PriceState>(
          listener: (context, state) {
            if (state is PriceLoaded) {
              LoadingWidget(width: 464.w, height: 448.h);
              _onModuleLoaded('documents.price');
            } else if (state is PriceError) {
              _onModuleError('Цены', 'toast.loadError'.tr(namedArgs: {'documents': 'documents.price'.tr()}));
            }else if(state is PriceLoading){
              _setLoading(true);
            }
          },
        ),
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, loginState) {
          // Показ загрузки
          if (loginState is LoginLoading) {
            if(_loadedCount != _totalCount){
              return LoadingWidget(width: 464.w, height: 448.h);
            }
          } if(!_isLoading){
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
        }else{
            return LoadingWidget(width: 464.w, height: 448.h);
          }
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

  void _refreshAllData({required DateTime lastAces}) {
    setState(() {
      _loadedCount = 0;
    });
    print('_refreshAllData: internet ${widget.connectInternet} ${lastAces.day}');


      context.read<AssortimentBloc>().fetchAssortiment();
      context.read<DocumentsCubit>().fetchOrders();
      context.read<ClientsCubit>().fetchClients();
      context.read<PriceCubit>().fetchPriceList();
  }

  void _onModuleLoaded(String moduleName) {
    setState(() {
      _loadedCount++;
    });

    print('✅ ${moduleName.tr()} загружен ($_loadedCount/$_totalCount)');

    ToastResponseError(
      context: context,
      textError: 'toast.loadSuccess'.tr(namedArgs: {
        'documents' : moduleName.tr()
      } ),
    ).showUpdateSucces();

    if (_loadedCount == _totalCount) {
      ToastResponseError(
        context: context,
        textError: 'toast.updateSuccess'.tr(),
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

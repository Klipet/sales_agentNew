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
import '../../data/providers/api_provider/price_list_client_api.dart';
import '../../logic/blocs/clients_bloc/clients_cubit.dart';

class AuthLoginWidget extends StatelessWidget {
  const AuthLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(LoginRepository(), LoginApi()),
        ),
        BlocProvider<DocumentsCubit>(
          create: (_) => DocumentsCubit(OrdersApi(), OrdersRepositori()),
        ),
        BlocProvider<ClientsCubit>(
          create: (_) => ClientsCubit(ClientApi(), ClientRepositori()),
        ),
        BlocProvider<PriceCubit>(
            create:(_) => PriceCubit(PriceListClientApi(), PriceRepositori()))
      ],
      child: AuthLoginWidgetUI(),
    );
  }
}

class AuthLoginWidgetUI extends StatefulWidget {
  const AuthLoginWidgetUI({super.key});

  @override
  State<AuthLoginWidgetUI> createState() => _AuthLoginWidgetUIState();
}

class _AuthLoginWidgetUIState extends State<AuthLoginWidgetUI> with TickerProviderStateMixin {
  bool hidePassword = true;
  bool savePass = false;
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  late AnimationController _controller1;
  late AnimationController _controller2;

  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(
      CheckSavedLogin(),
    ); // проверка сохранённых данных
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Второй круг — против часовой стрелки
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  Future<void> documant(BuildContext context) async {
    return await context.read<DocumentsCubit>().fetchOrders();
  }
  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              showMesageError(state.message, context);
            } else if (state is LoginSuccess) {
              documant(context);
              context.read<PriceCubit>().fetchPriceList();
              context.read<ClientsCubit>().fetchClients();
              _controllerPassword.clear();
              _controllerLogin.clear();
            }
          },
        ),
        BlocListener<ClientsCubit, ClientsState>(
          listener: (context, state) {
            if (state is ClientsLoaded) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomeDrawer()),
                (route) => false,
              );
            } else if (state is ClientsError) {
              showMesageError(state.message, context);
            }
          },
        ),
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, loginState) {
          final clientsState = context.watch<ClientsCubit>().state;
          // Показ загрузки
          if (loginState is LoginLoading || clientsState is ClientsLoading) {
            return
              LoadingWidget(width: 464.w, height: 448.h);
          }
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 464.h, maxWidth: 448.w),
            child: Container(
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: HexColor('#E5E5E5'), width: 1.r),
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
}

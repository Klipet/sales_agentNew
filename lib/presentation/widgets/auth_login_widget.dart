import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales_agent/data/providers/api_provider/client_api.dart';
import 'package:sales_agent/data/providers/api_provider/login_api.dart';
import 'package:sales_agent/data/providers/api_provider/orders_api.dart';
import 'package:sales_agent/data/repositories/client_repositori.dart';
import 'package:sales_agent/data/repositories/login_repositori.dart';
import 'package:sales_agent/data/repositories/orders_repositori.dart';
import 'package:sales_agent/logic/blocs/login_bloc/login_bloc.dart';
import 'package:sales_agent/logic/blocs/login_bloc/login_event.dart';
import 'package:sales_agent/logic/blocs/login_bloc/login_state.dart';
import 'package:sales_agent/presentation/widgets/home_drawer.dart';

import '../../core/colors_app.dart';
import '../../core/errors/error_toast.dart';
import '../../core/styles_text.dart';

class AuthLoginWidget extends StatelessWidget {
  const AuthLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoginBloc(LoginRepository(), LoginApi(), OrdersApi(), OrdersRepositori(), ClientRepositori(), ClientApi()),
      child: AuthLoginWidgetUI(),
    );
  }
}

class AuthLoginWidgetUI extends StatefulWidget {
  const AuthLoginWidgetUI({super.key});

  @override
  State<AuthLoginWidgetUI> createState() => _AuthLoginWidgetUIState();
}

class _AuthLoginWidgetUIState extends State<AuthLoginWidgetUI> {
  bool hidePassword = true;
  bool savePass = false;
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(CheckSavedLogin()); // проверка сохранённых данных
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if(state is LoginFailure){
          showMesageError(state.message, context);
        }else if(state is LoginSuccess){
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => HomeDrawer()),
              (Route<dynamic> route) => false
          );
          _controllerPassword.clear();
          _controllerLogin.clear();
        }else if(state is LoginLoading){
          Container(
            width: 448.w,
            height: 464.h,
            child: CircularProgressIndicator(color: textColor,),
          );
        }
      },
      builder: (BuildContext context, LoginState state) {
        return Container(
          width: 448.w,
          height: 464.h,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.all(Radius.circular(30.r)),
            border: Border.all(color: HexColor('#E5E5E5'), width: 1.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Padding(
                padding: EdgeInsets.only(top: 48.r),
                child: Center(child: Text('auth'.tr(), style: autentificare)),
              ),
              Container(
                width: 328.w,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.r, top: 32.r, bottom: 8.r),
                      child: Text('user'.tr(), style: titleCardInfo),
                    ),
                    Center(
                      child: ediTextAut(
                        _controllerLogin,
                        'userHint'.tr(),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.r, top: 16.r, bottom: 8.r),
                      child: Text('pass'.tr(), style: titleCardInfo),
                    ),
                    Center(
                      child: ediTextAut(
                        _controllerPassword,
                        'passHint'.tr(),
                        obscureText: hidePassword,
                        suffixIcon: true,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.r, left: 15.r),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                savePass = !savePass;
                              });
                            },
                            child: Image.asset(
                              savePass
                                  ? 'assets/icons/chek_box.png'
                                  : 'assets/icons/chec_unbox.png',
                            ),
                          ),
                          SizedBox(
                            width: 250.w,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('saveAuth'.tr(),
                                  style: titleCardInfo,
                                maxLines: 2,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 48.r),
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                          FetchLoginData(
                              _controllerLogin.text,
                              _controllerPassword.text,
                              savePass)
                        );
                      },
                      style: ButtonStyle(
                          fixedSize: WidgetStateProperty.all(Size(175.w, 48.h)),
                          backgroundColor: WidgetStateProperty.all(buttonColor),
                          shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(100.r)
                              )
                          )
                      ),
                      child: Text('connect'.tr(),
                        style: buttonTextStyle,
                          maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                      )
                  ),
                ),
              ),
            ],
          ),
        );
      }
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

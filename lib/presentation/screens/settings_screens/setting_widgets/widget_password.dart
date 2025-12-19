import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/providers/api_provider/login_api.dart';
import 'package:sales_agent/data/repositories/login_repositori.dart';
import 'package:sales_agent/logic/blocs/login_bloc/login_bloc.dart';
import 'package:sales_agent/logic/blocs/login_bloc/login_state.dart';
import 'package:sales_agent/presentation/widgets/loading_widget.dart';

import '../../../../core/styles_text.dart';
import '../../../../data/providers/navigator_provider.dart';
import '../../../../logic/blocs/login_bloc/login_event.dart';
import '../../login_screen.dart';

class WidgetPassword extends StatelessWidget {
  const WidgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(LoginRepository(), LoginApi()),
      child: WidgetPasswordUI(),
    );
  }
}

class WidgetPasswordUI extends StatefulWidget {
  const WidgetPasswordUI({super.key});

  @override
  State<WidgetPasswordUI> createState() => _WidgetPasswordUIState();
}

class _WidgetPasswordUIState extends State<WidgetPasswordUI> {
  final LoginRepository loginRepository = LoginRepository();
  late bool isLoad = false;
  late bool isSaved;
  final NavigationProvider navigationProvider = NavigationProvider();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    isSaved = await loginRepository.getSavePassword() ?? false;
    setState(() {});
    print('_load $isSaved');
    isLoad = true;
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoad) {
      return Expanded(
        child: LoadingWidget(width: double.maxFinite, height: double.maxFinite),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.h, bottom: 32.w),
          child: GestureDetector(
            onTap: () {
              isSaved = !isSaved;
              setState(() {
                context.read<LoginBloc>().add(SavedLogin(isSaved));
              });
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  isSaved
                      ? 'assets/icons/chek_box.svg'
                      : 'assets/icons/chec_unbox.svg',
                  width: 32.w,
                  height: 32.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'settings.save'.tr(),
                    style: titleCardInfo.copyWith(color: textColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap:(){
            Provider.of<NavigationProvider>(context, listen: false).reset();
            Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
                (Route<dynamic> route) => false,
          );},
          child: Container(
            constraints: BoxConstraints(
              minWidth: 141.w,
              minHeight: 48.h,
              maxWidth: 141.w,
              maxHeight: 48.h,
            ),
            margin: EdgeInsets.only(right: 32.h, bottom: 32.w),
            decoration: BoxDecoration(
              color: primariColor,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: borderColor, width: 1.w),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'settings.exit'.tr(),
                  style: textStyleDelogare
                ),
                SizedBox(width: 8.w,),
                SvgPicture.asset('assets/icons/exit.svg', width: 24.w, height: 24.h,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

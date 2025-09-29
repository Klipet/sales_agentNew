
import 'dart:async';


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isar/isar.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/core/utils/convert_data.dart';
import 'package:sales_agent/data/models_api/model_login.dart';
import 'package:sales_agent/data/models_db/model_login.dart';

import '../../core/styles_text.dart';

import '../../data/repositories/db_provider.dart';
import '../../data/repositories/login_repositori.dart';

class TitleHomeWidget extends StatefulWidget {
  const TitleHomeWidget({super.key});

  @override
  State<TitleHomeWidget> createState() => _TitleHomeWidgetState();
}

class _TitleHomeWidgetState extends State<TitleHomeWidget> {
  final LoginRepository repository = LoginRepository();
  late Stream<String> _userNameStream;
  String time = '';

  @override
  void initState()  {
    super.initState();
    timeToken();
    _userNameStream = _createUserNameStream();
  }

  Stream<String> _createUserNameStream() async* {
    // Первоначальное значение
    final initialName = await repository.getUserName();
    yield initialName ?? '';

    // Подписка на изменения
    final isar = await DbProvider.instance();
    await for (final _ in isar.modelLogins.watchLazy()) {
      final updatedName = await repository.getUserName();
      yield updatedName ?? '';
    }
  }
  Future<String> timeToken() async {
    String dataTime = await repository.getValodTo()?? '';
    time = ConvertData().convertDateString(dataTime);
    return time;
}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<String>(
        stream: _userNameStream,
        builder: (context, snapshot)
    {
      final userName = snapshot.data ?? '';

      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
          //  width: 452.w,
          //  height: 65.h,
            padding: EdgeInsets.only(right: 29.h, left: 8.h, top: 9.w, bottom: 9.w),
            margin: EdgeInsets.only(),
            decoration: BoxDecoration(
                color: containerColor,
                border: BoxBorder.all(
                    color: borderColor,
                    width: 1.w
                ),
                borderRadius: BorderRadius.all(Radius.circular(30.r))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               // Padding(
                //  padding: EdgeInsets.only(left: 8.h),
                //  child:
                SvgPicture.asset('assets/icons/home/human.svg', color: textColor,),
              //  ),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('home.titleName'.tr(), style: textStyleHomeTitle,),
                        Text(userName , style: textStyleHomeSubTitle,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 41.w),
                  child: SizedBox(
                    height: 50.h,
                    child: VerticalDivider(
                      color: borderColor,
                      thickness: 1,
                        indent: 5.h,
                       endIndent: 5.h,
                        width: 1
                        // отступ вокруг линии
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('home.titleSesion'.tr(), style: textStyleHomeTitle,),
                        Text(time , style: textStyleHomeTime,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }
    );
  }
}

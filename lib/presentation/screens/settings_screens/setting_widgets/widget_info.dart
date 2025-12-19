import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/data/models_db/model_apikey.dart';

import '../../../../core/styles_text.dart';
import '../../../../data/repositories/apikey_repositori.dart';

class WidgetInfo extends StatefulWidget {
  const WidgetInfo({super.key});

  @override
  State<WidgetInfo> createState() => _WidgetInfoState();
}

class _WidgetInfoState extends State<WidgetInfo> {
  final ApikeyRepository modalApi = ApikeyRepository();
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FutureBuilder<String?>(
          future: modalApi.getApiKey(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text("Загрузка API KEY...");
            }
            return textInfo('settings.licensia'.tr(), snapshot.data ?? '' );
          },
        ),

        FutureBuilder<String?>(
          future: modalApi.getUrl(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text("Загрузка URL...");
            }
            return textInfo('URL' , snapshot.data ?? "");
          },
        ),
      ],
    );
  }
  
  Widget textInfo(String title, String content){
    return Container(
      margin: EdgeInsets.only(top: 16.h, left: 40.w ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: textStyleSerachTitleIDNO.copyWith(fontWeight: FontWeight.w300),),
          Text(content, style: textStyleTitleAslAdd,)
        ],
      ),
    );
  }
}

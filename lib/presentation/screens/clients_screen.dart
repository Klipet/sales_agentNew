import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/colors_app.dart';
import '../../core/styles_text.dart';
import '../widgets/table_client_widget.dart';
import '../widgets/title_home_widget.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {

  final TextEditingController _editingController = TextEditingController();
  String _search = "";


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 40.w),
                  SizedBox(
                    width: 386.w,
                    height: 100.h,
                    child: Text(
                      "client.title".tr(),
                      style: primaFontOrders,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: TitleHomeWidget(),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              ediTextClient(_editingController, 'Caută'),
              SizedBox(height: 16.h),
              Expanded(child: Padding(
                padding: EdgeInsets.only(left: 10.h,),
                child: TableClientWidget( search: _search,),
              ))

            ])
    );
  }



  Widget ediTextClient(TextEditingController controller, String hint) {
    return Container(
    //  width: 1134.w,
      margin: EdgeInsets.only(left: 10.h),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        onChanged: (value){
          setState(() {
            _search = value;
            //   controller.text.trim(); // это обновит TableOrderWidget
          });
        },
        controller: controller,
        keyboardType: TextInputType.text,
        cursorWidth: 1.w,
        cursorColor: borderColor,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: textStyleHintOrder,
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 12.h, right: 16.w),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _search = controller.text;
                  if (kDebugMode) {
                    print('tap Client: $_search');
                  }
                });
              },
              child: SvgPicture.asset(
                'assets/icons/orders/search.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: borderColor, // цвет границы
              width: 1.r, // ширина 1px
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: borderColor, // цвет границы
              width: 1.r, // ширина 1px
            ),
          ),
        ),
      ),
    );
  }
}


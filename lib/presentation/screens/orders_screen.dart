import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/core/styles_text.dart';

import '../widgets/title_home_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final TextEditingController _editingController = TextEditingController();
  int selectedIndex = 0; // индекс активной кнопки

  List<String> icons = [
    'assets/icons/home/total.svg',
    'assets/icons/home/job.svg',
    'assets/icons/home/await.svg',
    'assets/icons/home/save.svg',
  ];
  List<String> textBt = [
    'Toate comenzile',
    'Comenzi în lucru',
    'Comenzi în așteptare',
    'Șabloane',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 30.w),
                SizedBox(
                  width: 386.w,
                  height: 100.h,
                  child: Text(
                    "orders".tr(),
                    style: primaFontOrders,
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: TitleHomeWidget(),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ediText(_editingController, 'Caută'),
                SizedBox(width: 15.w),
                btCreate(),
              ],
            ),
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  final isSelected = selectedIndex == index;
                  final icon = icons.elementAt(index);
                  final text = textBt.elementAt(index);
                  return Padding(
                    padding: EdgeInsets.only(right: 14.w),
                    child: btStatut(index: index,isSelected:  isSelected, assetName: icon, textBtHint: text)
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ediText(TextEditingController controller, String hint) {
    return Container(
      width: 850.w, // ширина
      //  height: 48.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        cursorWidth: 1.w,
        cursorColor: borderColor,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: textStyleHintOrder,
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 12.h, right: 16.w),
            child: SvgPicture.asset(
              'assets/icons/orders/search.svg',
              width: 24.w,
              height: 24.h,
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

  Widget btCreate() {
    return GestureDetector(
      onTap: () {
        print("create");
      },
      child: Container(
        width: 272.w,
        height: 48.h,
        //  padding: EdgeInsets.only(top: 8.h, bottom: 7.h),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.add_rounded, size: 32.sp, color: containerColor),
            SizedBox(height: 4.h),
            Text("Comandă nouă", style: textStyleBtCreateOrder),
          ],
        ),
      ),
    );
  }

  Widget btStatut( {
    required int index,
    required bool isSelected,
    required String assetName,
  required String textBtHint}){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: 273.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: isSelected ? btSelectedColor :containerColor,
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
          border: BoxBorder.all(
            color: borderColor, // цвет границы
            width: 1.r, // ширина 1px
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(assetName, color: isSelected ? containerColor :textColor,),
            SizedBox(width: 8.w,),
            Container(
              child: Text(textBtHint, style:  textStyleBtOrderRow.copyWith(
                color: isSelected ? containerColor : textColor,
              ),),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/presentation/widgets/body_home_widget.dart';
import 'package:sales_agent/presentation/widgets/title_home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TitleHomeWidget(),
              Padding(
                padding: EdgeInsets.only(top: 17.h, left: 16.w),
                child: BodyHomeWidget(),
              )
            ],
          ),
    );
  }
}

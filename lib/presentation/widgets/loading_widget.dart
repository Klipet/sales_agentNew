

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/colors_app.dart';

class LoadingWidget extends StatefulWidget {
  final double width;
  final double height;
  const LoadingWidget({super.key, required this.width, required this.height});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;


  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: containerColor, width: 1.r),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Первая орбита (горизонтальная)
            RotationTransition(
              turns: _controller1,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(1.3) // это уже создаёт овал!
                  ..scale(1.2, 1.0, 1.0), // дополнительно растянуть
                child: SizedBox(
                  height: 120.h,
                  width: 120.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.w,
                    valueColor: AlwaysStoppedAnimation<Color>(textColor),
                  ),
                ),
              ),
            ),

            // Вторая орбита (наклонная 60°)
            RotationTransition(
              turns: _controller2,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(1.3) // это уже создаёт овал!
                  ..scale(1.2, 1.0, 1.0), // дополнительно растянуть
                child: SizedBox(
                  height: 120.h,
                  width: 120.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.w,
                    valueColor: AlwaysStoppedAnimation<Color>(subTextColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
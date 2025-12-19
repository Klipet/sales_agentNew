import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/models_api/models_client_prices/prices.dart';
import 'package:sales_agent/data/models_db/model_db_assortiment/model_assortiment_db.dart';

import '../../core/styles_text.dart';

// Виджет счетчика
class CounterWidget extends StatefulWidget {

  final ModelAssortimentDB asl;
  final Prices? prices;
  final Function(double, double) onConfirm;

  const CounterWidget({

    required this.onConfirm,
    required this.asl,
    this.prices,
  });

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  double count = 1;
  double sum = 0;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.asl.nonWhole! ? '1.00' : '1';

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.length,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateCount(double newCount) {
    setState(() {
      // Проверка на максимальное значение
      if (newCount > widget.asl.remain!) {
        count = widget.asl.remain!;
      } else if (newCount < 0) {
        count = 1;
      } else {
        count = newCount;
      }

      if (widget.asl.nonWhole!) {
        _controller.text = count.toStringAsFixed(2);
      } else {
        _controller.text = count.toInt().toString();
      }
    });
  }

  void _increment() {
    if (widget.asl.nonWhole!) {
      _updateCount(count + 0.01);
    } else {
      _updateCount(count + 1);
    }
  }

  void _decrement() {
    if (widget.asl.nonWhole!) {
      if (count >= 0.01) {
        _updateCount(count - 0.01);
      }
    } else {
      if (count >= 1) {
        _updateCount(count - 1);
      }
    }
  }

  void _onTextChanged(String value) {
    if (value.isEmpty) {
      setState(() => count = 1);
      return;
    }

    value = value.replaceAll(',', '.');

    if (widget.asl.nonWhole!) {
      final regex = RegExp(r'^\d+([.,]\d{0,2})?$');
      if (!regex.hasMatch(value)) {
        return;
      }

      final newCount = double.tryParse(value);
      if (newCount != null && newCount >= 0) {
        setState(() {
          count = newCount > widget.asl.remain! ? widget.asl.remain! : newCount;
        });
      }
    } else {
      final newCount = int.tryParse(value);
      if (newCount != null && newCount >= 0) {
        setState(() {
          count = (newCount > widget.asl.remain! ? widget.asl.remain! : newCount).toDouble();
        });
      }
    }
  }

  String _getTotalText() {
    if(widget.prices == null || widget.prices?.price == 0){
      sum = widget.asl.price! * count;
      if (widget.asl.nonWhole!) {
        return '${sum.toStringAsFixed(2)} MDL';
      } else {
        return '${sum.toStringAsFixed(2)} MDL';
      }
    }else{
      sum = widget.prices!.price * count;
      if (widget.asl.nonWhole!) {
        return '${sum.toStringAsFixed(2)} MDL';
      } else {
        return '${sum.toStringAsFixed(2)} MDL';
      }
    }
  }

  Widget _textTotalColor(){
    if(count >= 0){
      return  Row(
        children: [
          Text(
            'newOrderdialog.total'.tr(),
            style: textStyleDialogAddAssortimentTotal
          ),
          Spacer(),
          Text(
            _getTotalText(),
            style: textStyleDialogAddAssortimentTotal
          ),
        ],
      );
    }else{
      return  Row(
        children: [
          Text(
              'newOrderdialog.total'.tr(),
              style: textStyleDialogAddAssortimentTotalNegative
          ),
          Spacer(),
          Text(
            _getTotalText(),
            style: textStyleDialogAddAssortimentTotalNegative
          ),
        ],
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Total Section
        SizedBox(height: 5.h),
        _textTotalColor(),
        // Counter Container
        SizedBox(height: 5.h),
        Row(
          children: [
            Material(
              color: Colors.transparent,
              child: Container(
                height: 64.h,
                width: 290.w,
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _CounterButton(
                      icon: Icons.remove_rounded,
                      onPressed: _decrement,
                    ),
                    Container(
                      width: 190.w,
                      alignment: Alignment.center,
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: widget.asl.nonWhole,
                        ),
                        inputFormatters: [
                          if (widget.asl.nonWhole!)
                            FilteringTextInputFormatter.allow(RegExp(r'[\d,.]'))
                          else
                            FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        style: GoogleFonts.poppins(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                        onChanged: _onTextChanged,
                        onSubmitted: (value) {
                          _focusNode.unfocus();
                          if (value.isEmpty) {
                            _updateCount(0);
                          } else {
                            _updateCount(count);
                          }
                        },
                      ),
                    ),
                    _CounterButton(
                      icon: Icons.add_rounded,
                      onPressed: _increment,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 64.h,
              width: 64.w,
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.r),
                  onTap: count > 0
                      ? () {
                    _focusNode.unfocus();
                    widget.onConfirm(count, sum);
                  }
                      : null,
                  child: Icon(
                    Icons.check_outlined,
                    size: 50.r,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _CounterButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.r),
          onTap: onPressed,
          child: Icon(
            icon,
            size: 50.r,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
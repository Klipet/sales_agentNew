import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/repositories/new_order_repositori.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_bloc.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_event.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_state.dart';

import '../../core/styles_text.dart';

Future dialogComment({required BuildContext context, required int order}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return DialogCommentUI(orderId: order);
    },
  );
}

class DialogCommentUI extends StatelessWidget {
  final int orderId;

  const DialogCommentUI({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          NewOrderBloc(NewOrderRepository(), context)
            ..add(LoadCommentEvent(orderId)),
      child: DialogContent(orderId: orderId),
    );
  }
}

class DialogContent extends StatefulWidget {
  final int orderId;

  const DialogContent({super.key, required this.orderId});

  @override
  State<DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  final TextEditingController commentController = TextEditingController();
  final TextEditingController commentControllerTel = TextEditingController();
  final TextEditingController commentControllerComment =
      TextEditingController();
  final TextEditingController commentControllerUser = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    commentControllerTel.dispose();
    commentControllerComment.dispose();
    commentControllerUser.dispose();
    super.dispose();
  }

  // Парсим комментарий из базы
  void _loadComment(String comment) {
    if (comment.isEmpty) return;

    try {
      Map<String, dynamic> data = jsonDecode(comment);
      setState(() {
        commentControllerTel.text = data['tel'] ?? '';
        commentControllerUser.text = data['person'] ?? '';
        commentControllerComment.text = data['comment'] ?? '';
        commentController.text = comment;
      });
    } catch (e) {
      // Если это не JSON, показываем в первом поле
      commentController.text = comment;
    }
  }

  // Собираем комментарий для сохранения
  String _buildComment() {
    Map<String, String> data = {
      'tel': commentControllerTel.text.trim(),
      'person': commentControllerUser.text.trim(),
      'comment': commentControllerComment.text.trim(),
    };
    return jsonEncode(data);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewOrderBloc, NewOrderState>(
      listener: (context, state) {
        if (state is CommentLoadedState) {
          print(state.comment);
          _loadComment(state.comment);
        }
      },
      child: AlertDialog(
        backgroundColor: containerColor,
        constraints: BoxConstraints(
          maxWidth: 800.w,
          maxHeight: 500.h,
          minWidth: 800.w,
          minHeight: 500.h,
        ),
        contentPadding: EdgeInsets.all(16.r),
        content: contentSupra(
          context: context,
          controllerTel: commentControllerTel,
          controllerUser: commentControllerUser,
          controllerComment: commentControllerComment,
          order: widget.orderId,
        ),
        //  contentSimp(context, commentController, widget.orderId),
      ),
    );
  }

  Widget contentSupra({
    required BuildContext context,
    required TextEditingController controllerTel,
    required TextEditingController controllerUser,
    required TextEditingController controllerComment,
    required int order,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Text('comment.title'.tr(), style: textStyleDialogClient),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/icons/close.svg'),
            ),
          ],
        ),
        Container(
          child: BlocBuilder<NewOrderBloc, NewOrderState>(
            builder: (context, state) {
              if (state is CommentLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  // Поле: Телефон
                  _buildTextField(
                    controller: controllerTel,
                    label: 'comment.tel'.tr(),
                    hint: 'comment.hintTel'.tr(),
                  ),

                  // Поле: Человек
                  _buildTextField(
                    controller: controllerUser,
                    label: 'comment.person'.tr(),
                    hint: 'comment.hintPerson'.tr(),
                  ),
                  // Поле: Адрес
                  _buildTextField(
                    controller: controllerComment,
                    label: 'comment.comment'.tr(),
                    hint: 'comment.hintComment'.tr(),
                    maxLines: 3,
                  ),
                ],
              );
            },
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            final comment = _buildComment();
            context.read<NewOrderBloc>().add(AddCommentEvent(order, comment));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: 50.h, maxWidth: 200.w),
                //  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 25.w),
                alignment: Alignment.center,
                //   margin: EdgeInsets.only(bottom: 0.w),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  border: Border.all(color: borderColor, width: 1.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save_as, color: Colors.white, size: 24.r),
                    SizedBox(width: 8.h),
                    Text(
                      'newOrder.commSave'.tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(label, style: textStyleAslTitle),
        SizedBox(height: 5.h),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textStyleDialogOrderData.copyWith(
              fontWeight: FontWeight.w600,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(16.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(16.r),
            ),
            filled: true,
            fillColor: primariColor,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
            suffixIcon: maxLines > 1
                ? IconButton(
                    color: colorBtJob,
                    icon: Icon(Icons.keyboard_hide, size: 35.r),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                    },
                  )
                : null,
          ),

          onSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }

  Widget contentSimp(
    BuildContext context,
    TextEditingController controller,
    int order,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Text('newOrder.comment'.tr(), style: textStyleDialogClient),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/icons/close.svg'),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 20.w),
          constraints: BoxConstraints(maxWidth: 800.w, maxHeight: 250.h),
          child: BlocBuilder<NewOrderBloc, NewOrderState>(
            builder: (context, state) {
              // Показываем индикатор загрузки пока данные загружаются
              if (state is CommentLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              return TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'newOrder.commHint'.tr(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  filled: true,
                  fillColor: primariColor,
                ),
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
              );
            },
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            context.read<NewOrderBloc>().add(
              AddCommentEvent(order, controller.text),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: 50.h, maxWidth: 200.w),
                //  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 25.w),
                alignment: Alignment.center,
                //   margin: EdgeInsets.only(bottom: 0.w),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  border: Border.all(color: borderColor, width: 1.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save_as, color: Colors.white, size: 24.r),
                    SizedBox(width: 8.h),
                    Text(
                      'newOrder.Save'.tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/models_api/model_comment_clietn.dart';
import 'package:sales_agent/data/repositories/new_order_repositori.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_bloc.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_event.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_state.dart';

import '../../core/styles_text.dart';

Future dialogComment({
  required BuildContext context,
  required int order,
  required int clientId,
  required String clientUUid
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return DialogCommentUI(orderId: order, clientId: clientId, clientUUid: clientUUid,);
    },
  );
}

class DialogCommentUI extends StatelessWidget {
  final int orderId;
  final int clientId;
  final String clientUUid;

  const DialogCommentUI({
    super.key,
    required this.orderId,
    required this.clientId,
    required this.clientUUid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          NewOrderBloc(NewOrderRepository(), context)
            ..add(LoadCommentEvent(orderId, clientId, clientUUid)),
      child: DialogContent(orderId: orderId, clientId: clientId, clientUUid: clientUUid,),
    );
  }
}

class DialogContent extends StatefulWidget {
  final int orderId;
  final int clientId;
  final String clientUUid;

  const DialogContent({
    super.key,
    required this.orderId,
    required this.clientId,
    required this.clientUUid,
  });

  @override
  State<DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  final TextEditingController commentControllerSimpl = TextEditingController();
  final TextEditingController commentControllerTel = TextEditingController();
  final TextEditingController commentControllerComment =
      TextEditingController();
  final TextEditingController commentControllerUserName =
      TextEditingController();
  final TextEditingController commentControllerUserSurname =
      TextEditingController();
  final TextEditingController commentControllerAddress =
      TextEditingController();
  final FocusNode telFocus = FocusNode();
  final FocusNode commentFocus = FocusNode();
  final FocusNode userNameFocus = FocusNode();
  final FocusNode userSurnameFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();
  bool saveComment = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    commentControllerSimpl.dispose();
    commentControllerTel.dispose();
    commentControllerComment.dispose();
    commentControllerUserName.dispose();
    commentControllerUserSurname.dispose();
    commentControllerAddress.dispose();

    telFocus.dispose();
    userNameFocus.dispose();
    commentFocus.dispose();
    userSurnameFocus.dispose();
    addressFocus.dispose();

    super.dispose();
  }

  // Парсим комментарий из базы
  void _loadComment(ModelCommentClient comment, String commentServer) {
    if (comment.saveComment) {
      setState(() {
        commentControllerTel.text = comment.phone ?? '';
        commentControllerUserName.text = comment.name ?? '';
        commentControllerUserSurname.text = comment.surName ?? '';
        commentControllerAddress.text = comment.address ?? '';
        commentControllerComment.text = comment.comment ?? '';
        saveComment = comment.saveComment;
      });
    }else{
      commentControllerComment.text = commentServer;
    }


  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewOrderBloc, NewOrderState>(
      listener: (context, state) {
        if (state is CommentLoadedState) {
          print(state.comment);
          _loadComment(state.comment, state.commentToServer);
        }
      },

      child: AlertDialog(
        constraints: BoxConstraints(maxWidth: 800.w, minWidth: 800.w),
        backgroundColor: containerColor,
        content: SafeArea(
          child: SingleChildScrollView(
            child: contentSupra(
              context: context,
              controllerTel: commentControllerTel,
              controllerUser: commentControllerUserName,
              controllerComment: commentControllerComment,
              controllerAddress: commentControllerAddress,
              controllerUserSurname: commentControllerUserSurname,
              saveComment: saveComment,
              order: widget.orderId,
              clientUUid: widget.clientUUid,
              clientId: widget.clientId,
              focusNode: telFocus,
            ),
          ),
          //  contentSimp(context, commentControllerSimp, widget.orderId)
        ),
      ),
    );
  }

  Widget contentSupra({
    required BuildContext context,
    required TextEditingController controllerTel,
    required TextEditingController controllerUser,
    required TextEditingController controllerComment,
    required TextEditingController controllerUserSurname,
    required TextEditingController controllerAddress,
    required bool saveComment,
    required FocusNode focusNode,
    required int order,
    required int clientId,
    required String clientUUid,
  }) {
    PhoneNumber number = PhoneNumber(isoCode: 'MD');

    return Column(
      children: [
        Row(
          children: [
            Text('comment.title'.tr(), style: textStyleDialogClient),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  saveComment = true;
                });
                final modelComment = ModelCommentClient(
                  name: controllerUser.text,
                  comment: controllerComment.text,
                  phone: controllerTel.text,
                  address: controllerAddress.text,
                  surName: controllerUserSurname.text,
                  saveComment: saveComment,
                  clientUUid: clientUUid
                );
                print(clientUUid);
                context.read<NewOrderBloc>().add(
                  AddCommentEvent(order, modelComment, clientId),
                );
                Navigator.pop(context);
              },
              icon: Icon(Icons.savings_sharp, size: 25.r),
              label: Text('comment.btSave'.tr()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1D9E75),
                foregroundColor: Colors.white,
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              ),
            ),
            SizedBox(width: 20.w),
            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor),
                ),
                child: SvgPicture.asset('assets/icons/close.svg'),
              ),
            ),
          ],
        ),
        BlocBuilder<NewOrderBloc, NewOrderState>(
          builder: (context, state) {
            if (state is CommentLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                // Поле: Телефон
                _buildTextFieldTel(
                  controller: controllerTel,
                  label: 'comment.tel'.tr(),
                  hint: 'comment.hintTel'.tr(),
                  isoCode: number,
                ),
                // Поле: Человек
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: controllerUser,
                        label: 'comment.personName'.tr(),
                        hint: 'comment.hintPerson'.tr(),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: _buildTextField(
                        controller: controllerUserSurname,
                        label: 'comment.personSurname'.tr(),
                        hint: 'comment.hintPersonSurname'.tr(),
                      ),
                    ),
                  ],
                ),
                _buildTextField(
                  controller: controllerAddress,
                  label: 'comment.address'.tr(),
                  hint: 'comment.hintAddress'.tr(),
                ),
                // Поле: Comment
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
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    FocusNode? focusNode,
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
              fontWeight: FontWeight.w200,
              color: Colors.grey
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

  Widget _buildTextFieldTel({
    required TextEditingController controller,
    required String label,
    required String hint,
    required PhoneNumber isoCode,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(label, style: textStyleAslTitle),
        SizedBox(height: 5.h),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            color: primariColor,
          ),
          child: InternationalPhoneNumberInput(
            initialValue: isoCode,
            onInputChanged: (PhoneNumber value) {
              //  controller.text = value.phoneNumber.toString();
              print('onInputChanged: ${value.phoneNumber}');
            },
            selectorConfig: SelectorConfig(showFlags: true),
            ignoreBlank: true,
            autoValidateMode: AutovalidateMode.disabled,
            textFieldController: controller,
            formatInput: false,
            keyboardType: const TextInputType.numberWithOptions(
              signed: false,
              decimal: false,
            ),
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hint,
              hintStyle: textStyleDialogOrderData.copyWith(
                fontWeight: FontWeight.w200,
                color: Colors.grey
              ),
            ),
          ),
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
            //  context.read<NewOrderBloc>().add(
            //    AddCommentEvent(order, controller.text),
            //   );
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

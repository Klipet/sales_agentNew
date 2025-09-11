import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:number_pad_keyboard/number_pad_keyboard.dart';
import 'package:pinput/pinput.dart';
import 'package:sales_agent/data/providers/api_provider/activarion_api.dart';
import 'package:sales_agent/data/repositories/apikey_repositori.dart';
import 'package:sales_agent/logic/blocs/activation_blocs/activation_bloc.dart';
import 'package:sales_agent/logic/blocs/activation_blocs/activation_state.dart';
import 'package:sales_agent/presentation/screens/login_screen.dart';

import '../../logic/blocs/activation_blocs/activation_event.dart';

class ActivationScreen extends StatelessWidget {
  const ActivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ActivationBloc(ApikeyRepository(), ActivationApi()),
      child: ActivationScreenUi(),
    );
  }
}

class ActivationScreenUi extends StatefulWidget {
  const ActivationScreenUi({super.key});

  @override
  State<ActivationScreenUi> createState() => _ActivationScreenUiState();
}

class _ActivationScreenUiState extends State<ActivationScreenUi> {
  final TextEditingController _controller = TextEditingController();

  String code = '';
  bool isHeid = false;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(3),
    ),
  );

  final putTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      //      color: questionsGroupColor,
      borderRadius: BorderRadius.circular(3),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivationBloc, ActivationState>(
      listener: (context, state) {
        if (state is ActivationSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        } else if (state is ActivationFailure) {
          print("Error: ${state.message}");
          _showMesageError(state.message);
        }
      },
      builder: (context, state) {
        String? errorText;
        if (state is ActivationFailure) {
          errorText = state.message;
        }
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //const SizedBox(height: 64),
                      Text(
                        'licenseCode'.tr(),
                        style: const TextStyle(
                          fontFamily: 'RobotoBlack',
                          fontSize: 48,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'codeDigits'.tr(),
                        style: const TextStyle(
                          fontFamily: 'RobotoRegular',
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Pinput(
                        closeKeyboardWhenCompleted: true,
                        keyboardAppearance: Brightness.dark,
                        autofocus: true,
                        length: 8,
                        defaultPinTheme: defaultPinTheme,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        controller: _controller,
                        showCursor: false,
                        readOnly: true,
                        submittedPinTheme: putTheme,
                      ),
                      //const SizedBox(height: 10),
                      _keybord(),
                      if (errorText != null) ...[],
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _keybord() {
    return SizedBox(
      width: 450,
      height: 300,
      child: NumberPadKeyboard(
        backgroundColor: Colors.transparent,
        deleteIconSize: 50,
        numberStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        enterButtonTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        enterButtonText: 'enter'.tr(),
        addDigit: (int cod) {
          if (_controller.text.length < 8) {
            _controller.text = _controller.text + cod.toString();
          }
        },
        backspace: () {
          setState(() {});
          if (_controller.text.isNotEmpty) {
            _controller.text = _controller.text.substring(
              0,
              _controller.text.length - 1,
            );
          }
        },
        onEnter: () {
          context.read<ActivationBloc>().add(
            FetchActivationData(_controller.text),
          );
          print(_controller.text.toString());
        },
      ),
    );
  }

  _showMesageError(String errorText) {
    showToast(
      errorText,
      context: context,
      duration: const Duration(seconds: 10),
    );
  }
}

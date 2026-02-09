import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

ToastFuture showMesageError(String errorText, BuildContext context) {
  return showToast(
    errorText,
    context: context,
    duration: const Duration(seconds: 10),
  );
}
import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

void showSuccessToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    title: const Text('Success!'),
    description: Text(message),
    alignment: Alignment.topRight,
    autoCloseDuration: const Duration(seconds: 5),
  );
}
void showWarningToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    type: ToastificationType.warning,
    style: ToastificationStyle.fillColored,
    title: const Text('Warning!'),
    description: Text(message),
    alignment: Alignment.topRight,
    autoCloseDuration: const Duration(seconds: 5),
  );
}
void showErrorToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    title: const Text('Error!'),
    description: Text(message),
    alignment: Alignment.topRight,
    autoCloseDuration: const Duration(seconds: 5),
  );
}
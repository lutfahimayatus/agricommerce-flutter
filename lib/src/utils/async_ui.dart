import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUI on AsyncValue {
  void showSnackbarOnError(BuildContext context) {
    final message = error.toString();
    if (!isLoading && hasError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ));
    }
  }

  void showSnackbarOnSuccess(BuildContext context, String message) {
    if (!isLoading && !hasError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ));
    }
  }
}

import 'package:flutter/material.dart';

class DialogHelper {

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
  
  static void showLoading(
    BuildContext context, {
    String message = 'Loading...',
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 15),
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
  }

  static void showSuccess(
    BuildContext context, {
      required String message, 
      VoidCallback? onOk
    }
  ) {
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: const Text('Berhasil'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onOk?.call();
            }, 
            child: const Text('Ok')
            )
        ],
      )
      );
  }

  static void showError(
    BuildContext context, {
      required String message
    }) {
      showDialog(
        context: context, 
        builder: (_) => AlertDialog(
          title: const Text('Gagal'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('OK')
              )
          ],
        )
        );
    }

}

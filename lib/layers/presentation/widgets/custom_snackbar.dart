import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void customSnackBar(
  BuildContext context,
  String message,
  AnimatedSnackBarType type,
) {
  AnimatedSnackBar(
    builder: ((context) {
      return Container(
        padding: const EdgeInsets.all(8),
        color: Colors.amber,
        height: 50,
        child: const Text('A custom snackbar'),
      );
    }),
  ).show(context);

  AnimatedSnackBar.material(
    message,
    type: type,
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
  ).show(context);
}

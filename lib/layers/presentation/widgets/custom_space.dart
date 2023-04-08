import 'package:flutter/material.dart';

class CustomSpace extends StatelessWidget {
  const CustomSpace({
    super.key,
    this.width = 0.0,
    this.height = 0.0,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}

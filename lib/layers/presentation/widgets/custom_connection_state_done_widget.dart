import 'package:flutter/material.dart';

class CustomConnectionStateDoneWidget extends StatelessWidget {
  final AsyncSnapshot<dynamic> snapshot;
  final Widget Function(BuildContext, AsyncSnapshot<dynamic>) builder;

  const CustomConnectionStateDoneWidget({
    super.key,
    required this.snapshot,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.done) {
      return builder(context, snapshot);
    } else {
      return const Scaffold();
    }
  }
}

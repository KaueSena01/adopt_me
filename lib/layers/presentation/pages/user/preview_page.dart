import 'dart:io';

import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    super.key,
    required this.file,
  });

  final File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.file(
                    file,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(AppSizes.size20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomOutlinedButton(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          label: "label",
                          backgroundColor: Colors.transparent,
                          onPressed: () {},
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomOutlinedButton(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          label: "label",
                          onPressed: () {},
                        ),
                      ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

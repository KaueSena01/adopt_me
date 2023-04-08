import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final Color? labelTextColor;
  final String? hintText;
  final Color? hintTextColor;
  final Color? inputTextColor;
  final IconData? icon;
  final bool isSecret;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final GlobalKey<FormFieldState>? formFieldKey;
  final EdgeInsets? margin;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.labelTextColor,
    this.hintText,
    this.hintTextColor,
    this.inputTextColor,
    this.initialValue,
    this.icon,
    this.isSecret = false,
    this.readOnly = false,
    this.inputFormatters,
    this.textInputType,
    this.controller,
    this.validator,
    this.onSaved,
    this.formFieldKey,
    this.margin,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        key: widget.formFieldKey,
        controller: widget.controller,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        validator: widget.validator,
        onSaved: widget.onSaved,
        keyboardType: widget.textInputType,
        style: AppTextStyles.textTheme.labelSmall!.apply(
          color: widget.inputTextColor ?? AppColors.whiteColor,
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: AppTextStyles.textTheme.labelSmall!.apply(
            color: widget.labelTextColor ?? AppColors.lighterColor,
          ),
          hintText: widget.hintText,
          hintStyle: AppTextStyles.textTheme.labelSmall!.apply(
            color: widget.hintTextColor ?? AppColors.lighterColor,
          ),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primaryColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

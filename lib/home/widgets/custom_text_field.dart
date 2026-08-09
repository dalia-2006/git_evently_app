import 'package:flutter/material.dart';
import 'package:islami/utils/app_color.dart';

typedef OnChanged = void Function(String)?;
typedef OnValidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  final double? radius;

  final TextStyle? errorStyle;
  final Color? borderColor;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final Widget? label;
  final int? maxLines;
  final TextEditingController? controller;
  final OnChanged? onChanged;

  final OnValidator? validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomTextField({
    super.key,
    this.obscureText = false,
    this.label,
    this.radius,
    this.suffixIcon,
    this.borderColor,
    this.hintStyle,
    this.hintText,
    this.labelStyle,
    this.labelText,
    this.prefixIcon,
    this.color,
    this.controller,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
    this.errorStyle,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: builtDecorationItem(
          radius: radius ?? 16,
          borderColor: borderColor ?? Theme.of(context).canvasColor,
        ),
        focusedBorder: builtDecorationItem(
          radius: radius ?? 16,
          borderColor: borderColor ?? Theme.of(context).canvasColor,
        ),
        errorBorder: builtDecorationItem(
          radius: radius ?? 16,
          borderColor: borderColor ?? AppColor.redColor,
        ),
        focusedErrorBorder: builtDecorationItem(
          radius: radius ?? 16,
          borderColor: borderColor ?? AppColor.redColor,
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Theme.of(context).dividerColor,
        label: label,
        errorStyle: errorStyle,
      ),
      maxLines: maxLines,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,

      // obscuringCharacter: '*',
    );
  }

  OutlineInputBorder builtDecorationItem({
    required double radius,
    required Color borderColor,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: borderColor, width: 2),
    );
  }
}

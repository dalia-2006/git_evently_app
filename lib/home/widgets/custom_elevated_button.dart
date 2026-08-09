import 'package:flutter/material.dart';
import 'package:islami/utils/size_utils.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? radius;

  final VoidCallback onPressed;
  final Widget? child;
  final Color? backgroundColor;

  final Color? sideColor;

  const CustomElevatedButton({
    super.key,
    this.radius,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.sideColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.04,
          horizontal: context.width * 0.4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
          side: BorderSide(color: sideColor ?? Colors.transparent, width: 2),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

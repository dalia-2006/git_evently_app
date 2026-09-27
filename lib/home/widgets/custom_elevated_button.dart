import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? radius;
  final VoidCallback onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final Color? sideColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const CustomElevatedButton({
    super.key,
    this.radius,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.sideColor,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
            side: BorderSide(color: sideColor ?? Colors.transparent, width: 2),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
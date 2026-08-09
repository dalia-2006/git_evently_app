import 'package:flutter/material.dart';

class ArrowBackWidget extends StatelessWidget {
  final Widget icon;

  const ArrowBackWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        border: Border.all(width: 1, color: Theme.of(context).canvasColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: icon,
    );
  }
}

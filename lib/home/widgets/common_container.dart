import 'package:flutter/material.dart';

import '../../utils/size_utils.dart';

class CommonContainer extends StatelessWidget {
  final Widget child;

  CommonContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.02,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).canvasColor, width: 2),
      ),
    );
  }
}

class CommonContainer1 extends StatelessWidget {
  final Widget? child;
  String img;

  CommonContainer1({super.key, this.child, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).canvasColor, width: 2),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';

class TabBarItemWidget extends StatelessWidget {
  final bool isSelected;
  final String eventName;
  final Widget? img;

  const TabBarItemWidget({
    super.key,
    required this.isSelected,
    required this.eventName,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.01,
        horizontal: context.width * 0.04,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).cardColor
            : Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: isSelected
              ? Theme.of(context).cardColor
              : Theme.of(context).canvasColor,
        ),
      ),
      child: Text(
        eventName,
        style: isSelected
            ? AppStyles.med16White
            : Theme.of(context).textTheme.labelMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}

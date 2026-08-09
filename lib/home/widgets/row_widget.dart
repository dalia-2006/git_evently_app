import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_theme_Provider.dart';

class RowWidget extends StatelessWidget {
  String img;
  String title;
  String description;
  final VoidCallback onChooseClick;

  RowWidget({
    super.key,
    required this.img,
    required this.title,
    required this.description,
    required this.onChooseClick,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Row(
      children: [
        Image.asset(img, height: 25, width: 25),
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        Spacer(),
        TextButton(
          onPressed: onChooseClick,
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: Theme.of(context).cardColor,
              decorationThickness: 2,
            ),
          ),
        ),
      ],
    );
  }
}

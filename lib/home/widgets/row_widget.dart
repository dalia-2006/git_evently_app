import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String img;
  final String title;
  final String description;
  final VoidCallback onChooseClick;

  const RowWidget({
    super.key,
    required this.img,
    required this.title,
    required this.description,
    required this.onChooseClick,
  });

  @override
  Widget build(BuildContext context) {
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

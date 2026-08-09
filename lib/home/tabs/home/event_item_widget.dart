import 'package:flutter/material.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/size_utils.dart';
import 'package:provider/provider.dart';

import '../../../provider/app_theme_Provider.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = context.height;
    var width = context.width;
    return Container(
      height: height * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            themeProvider.isDark
                ? AppAssets.birthday_dark
                : AppAssets.birthday_light,
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).canvasColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(16),
            width: width * 0.07,
            height: height * 0.07,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(
                color: Theme.of(context).canvasColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('12 JUN'),
          ),
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(
                color: Theme.of(context).canvasColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "This is a Birthday Party",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () {
                    // todo: add to favourite
                  },
                  icon: Image.asset(
                    themeProvider.appTheme.isDark
                        ? AppAssets.heartDarkSelected
                        : AppAssets.heartLightSelected,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

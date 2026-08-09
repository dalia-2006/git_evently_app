import 'package:flutter/material.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../provider/app_theme_Provider.dart';
import '../utils/size_utils.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.02,
        horizontal: context.width * 0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: context.height * 0.02,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              //todo:change theme to dark
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.appTheme == ThemeMode.dark
                ? getSelectedItemTheme(
                    theme: AppLocalizations.of(context)!.dark,
                  )
                : getUnSelectedItemTheme(
                    theme: AppLocalizations.of(context)!.dark,
                  ),
          ),
          InkWell(
            onTap: () {
              //todo: change theme to light
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: themeProvider.appTheme == ThemeMode.light
                ? getSelectedItemTheme(
                    theme: AppLocalizations.of(context)!.light,
                  )
                : getUnSelectedItemTheme(
                    theme: AppLocalizations.of(context)!.light,
                  ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemTheme({required String theme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(theme, style: AppStyles.semi24Main),
        Icon(Icons.check, color: AppColor.mainLightColor, size: 30),
      ],
    );
  }

  Widget getUnSelectedItemTheme({required String theme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(theme, style: AppStyles.med18Black)],
    );
  }
}

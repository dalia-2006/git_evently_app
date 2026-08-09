import 'package:flutter/material.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/provider/app_theme_Provider.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/size_utils.dart';
import 'package:provider/provider.dart';

import '../../language_bottom_sheet.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  double? height;

  double? width;

  @override
  Widget build(BuildContext context) {
    height = context.height;
    width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.04,
        horizontal: context.width * 0.04,
      ),
      child: Column(
        spacing: 4,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage(AppAssets.route_logo),
              radius: 50,
            ),
          ),
          Text('John Safwat', style: Theme.of(context).textTheme.titleSmall),
          Text('johnsafwat.route@gmail.com', style: AppStyles.reg14grey),
          BuildItemWidget(
            text: themeProvider.appTheme.isDark
                ? AppLocalizations.of(context)!.darkMode
                : AppLocalizations.of(context)!.light,
            item: Switch(
              value: themeProvider.appTheme.isDark,
              activeThumbColor: AppColor.whiteColor,
              activeTrackColor: AppColor.mainDarkColor,
              inactiveThumbColor: AppColor.whiteColor,
              inactiveTrackColor: AppColor.disableColor,
              onChanged: (value) {
                themeProvider.changeTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
            ),
          ),
          BuildItemWidget(
            text: AppLocalizations.of(context)!.language,
            item: IconButton(
              onPressed: () {
                //todo: change language
                showLanguageBottomSheet();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).cardColor,
                size: 30,
              ),
            ),
          ),
          BuildItemWidget(
            text: AppLocalizations.of(context)!.logout,
            item: IconButton(
              onPressed: () {
                //todo: logout
                Navigator.of(context).pushNamed(AppRoutes.loginRouteName);
              },
              icon: Icon(Icons.logout, color: AppColor.redColor, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildItemWidget({required String text, required Widget item}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).canvasColor, width: 2),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: width! * 0.001,
          horizontal: height! * 0.01,
        ),
        title: Text(text, style: Theme.of(context).textTheme.headlineMedium),
        trailing: item,
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
}

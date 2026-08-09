import 'package:flutter/material.dart';
import 'package:islami/home/tabs/favourite/favourite_tab.dart';
import 'package:islami/home/tabs/home/home_tab.dart';
import 'package:islami/home/tabs/profile/profile_tab.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../provider/app_language_provider.dart';
import '../provider/app_theme_Provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget> homeTabs = [HomeTab(), FavouriteTab(), ProfileTab()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: homeTabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo:navigate to add event screen
          Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
        },
        child: Icon(Icons.add, color: AppColor.whiteColor, size: 40),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          buildBottomNavItem(
            selectedIcon: ImageIcon(
              AssetImage(
                themeProvider.appTheme.isDark
                    ? AppAssets.homeDarkSelected
                    : AppAssets.homeLightSelected,
              ),
            ),
            unSelectedIcon: ImageIcon(AssetImage(AppAssets.home)),
            isSelected: selectedIndex == 0,
            label: AppLocalizations.of(context)!.home,
          ),
          buildBottomNavItem(
            selectedIcon: ImageIcon(
              AssetImage(
                themeProvider.appTheme.isDark
                    ? AppAssets.heartDarkSelected
                    : AppAssets.heartLightSelected,
              ),
            ),
            unSelectedIcon: ImageIcon(AssetImage(AppAssets.heart)),
            isSelected: selectedIndex == 1,
            label: AppLocalizations.of(context)!.favourite,
          ),
          buildBottomNavItem(
            selectedIcon: ImageIcon(
              AssetImage(
                themeProvider.appTheme.isDark
                    ? AppAssets.profileDarkSelected
                    : AppAssets.profileLightSelected,
              ),
            ),
            unSelectedIcon: ImageIcon(AssetImage(AppAssets.profile)),
            isSelected: selectedIndex == 2,
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavItem({
    required Widget selectedIcon,
    required Widget unSelectedIcon,
    required bool isSelected,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: isSelected ? selectedIcon : unSelectedIcon,
      label: label,
    );
  }
}

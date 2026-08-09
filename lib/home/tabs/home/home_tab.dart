import 'package:flutter/material.dart';
import 'package:islami/home/tabs/home/event_item_widget.dart';
import 'package:islami/home/tabs/home/tab_bar_item_widget.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../provider/app_language_provider.dart';
import '../../../provider/app_theme_Provider.dart';
import '../../../utils/size_utils.dart';

class HomeTab extends StatefulWidget {
  int selectedIndex = 0;

  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.birthday,
    ];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.04,
            horizontal: context.width * 0.04,
          ),
          child: DefaultTabController(
            length: eventsNameList.length,
            child: Column(
              spacing: context.height * 0.01,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.welcome,
                        style: AppStyles.reg14grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: themeProvider.appTheme.isDark
                          ? Icon(
                              Icons.brightness_2_outlined,
                              color: AppColor.mainDarkColor,
                              size: 25,
                            )
                          : Icon(
                              Icons.wb_sunny_outlined,
                              color: AppColor.mainLightColor,
                              size: 25,
                            ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.en,
                        style: AppStyles.semi14White,
                      ),
                    ),
                  ],
                ),
                Text(
                  'John Safwat',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                TabBar(
                  isScrollable: true,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.01,
                  ),
                  tabAlignment: TabAlignment.start,
                  tabs: eventsNameList.map((eventName) {
                    return TabBarItemWidget(
                      isSelected:
                          selectedIndex == eventsNameList.indexOf(eventName),
                      eventName: eventName,
                    );
                  }).toList(),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return EventItemWidget();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: context.height * 0.01);
                    },
                    itemCount: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

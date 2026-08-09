import 'package:flutter/material.dart';
import 'package:islami/home/widgets/arrow_back_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../provider/app_theme_Provider.dart';
import '../utils/app_routes.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: ArrowBackWidget(
            icon: IconButton(
              onPressed: () {
                //todo : navigate to login
                Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Theme.of(context).focusColor,
                size: 30,
              ),
            ),
          ),
          title: Text(
            AppLocalizations.of(context)!.addEvent,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          centerTitle: true,
          actions: [
            Row(
              children: [
                ArrowBackWidget(
                  icon: IconButton(
                    onPressed: () {
                      // todo : edit event
                    },
                    icon: ImageIcon(
                      (AssetImage(
                        themeProvider.appTheme.isDark
                            ? AppAssets.editDark
                            : AppAssets.editLight,
                      )),
                      size: 30,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ),
                ArrowBackWidget(
                  icon: IconButton(
                    onPressed: () {
                      // todo : delete event
                    },
                    icon: ImageIcon(
                      (AssetImage(AppAssets.delete)),
                      color: AppColor.redColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

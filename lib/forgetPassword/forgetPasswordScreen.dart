import 'package:flutter/material.dart';
import 'package:islami/home/widgets/arrow_back_widget.dart';
import 'package:islami/home/widgets/custom_elevated_button.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../provider/app_theme_Provider.dart';
import '../utils/size_utils.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: ArrowBackWidget(
            icon: IconButton(
              onPressed: () {
                //todo : navigate to login
                Navigator.of(context).pushNamed(AppRoutes.loginRouteName);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Theme.of(context).focusColor,
                size: 30,
              ),
            ),
          ),
          title: Text(
            AppLocalizations.of(context)!.forgetPassword,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.04,
            horizontal: width * 0.04,
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  themeProvider.appTheme.isDark
                      ? AppAssets.forget_password_dark
                      : AppAssets.forget_password_light,
                ),
              ),
              CustomElevatedButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.resetPass,
                  style: AppStyles.med20White,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

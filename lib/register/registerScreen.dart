import 'package:flutter/material.dart';
import 'package:islami/home/widgets/custom_elevated_button.dart';
import 'package:islami/home/widgets/custom_text_field.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../provider/app_theme_Provider.dart';
import '../utils/app_routes.dart';
import '../utils/size_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var width = context.width;
    var height = context.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.04,
              horizontal: width * 0.04,
            ),
            child: Form(
              child: Column(
                spacing: 16,
                children: [
                  Image.asset(
                    themeProvider.appTheme.isDark
                        ? AppAssets.eventlyLogoDark
                        : AppAssets.eventlyLogoLight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.registerTitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  CustomTextField(
                    hintText: AppLocalizations.of(context)!.enterYourName,
                    prefixIcon: ImageIcon(
                      AssetImage(AppAssets.profile),
                      size: 30,
                    ),
                    hintStyle: AppStyles.reg14grey,
                  ),
                  CustomTextField(
                    hintText: AppLocalizations.of(context)!.enterEmail,
                    prefixIcon: ImageIcon(AssetImage(AppAssets.sms), size: 30),
                    hintStyle: AppStyles.reg14grey,
                  ),
                  CustomTextField(
                    hintText: AppLocalizations.of(context)!.enterPass,
                    prefixIcon: ImageIcon(AssetImage(AppAssets.lock), size: 30),
                    suffixIcon: IconButton(
                      onPressed: () {
                        //todo:showPassword
                      },
                      icon: ImageIcon(
                        AssetImage(AppAssets.unVisible),
                        size: 30,
                      ),
                    ),
                    hintStyle: AppStyles.reg14grey,
                  ),
                  CustomTextField(
                    hintText: AppLocalizations.of(context)!.confirmPass,
                    prefixIcon: ImageIcon(AssetImage(AppAssets.lock), size: 30),
                    suffixIcon: IconButton(
                      onPressed: () {
                        //todo:showPassword
                      },
                      icon: ImageIcon(
                        AssetImage(AppAssets.unVisible),
                        size: 30,
                      ),
                    ),
                    hintStyle: AppStyles.reg14grey,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      //todo: navigate to loginScreen
                      Navigator.of(context).pushNamed(AppRoutes.loginRouteName);
                      register;
                    },
                    child: Text(
                      AppLocalizations.of(context)!.signUp,
                      style: AppStyles.med20White,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.alreadyHaveAnAccount,
                        style: AppStyles.reg14grey,
                      ),
                      TextButton(
                        onPressed: () {
                          //todo : navigate to login screen
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.loginRouteName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).cardColor,
                                decorationThickness: 2,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColor.disableColor,
                          thickness: 2,
                          indent: width * 0.05,
                          endIndent: width * 0.05,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColor.disableColor,
                          thickness: 2,
                          indent: width * 0.05,
                          endIndent: width * 0.05,
                        ),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    sideColor: Theme.of(context).canvasColor,
                    backgroundColor: Theme.of(context).dividerColor,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(AppAssets.google_logo),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.signUp,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() {}
}

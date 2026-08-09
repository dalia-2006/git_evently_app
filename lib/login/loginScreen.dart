import 'package:flutter/material.dart';
import 'package:islami/home/widgets/custom_elevated_button.dart';
import 'package:islami/home/widgets/custom_text_field.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../provider/app_theme_Provider.dart';
import '../utils/size_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              key: formKey,
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
                        AppLocalizations.of(context)!.loginTitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  CustomTextField(
                    errorStyle: AppStyles.reg12Red,
                    hintText: AppLocalizations.of(context)!.enterEmail,
                    prefixIcon: ImageIcon(AssetImage(AppAssets.sms), size: 30),
                    hintStyle: AppStyles.reg14grey,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter Email ';
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(emailController.text ?? "");
                      if (!emailValid) {
                        return 'Please Enter Valid Email ';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    errorStyle: AppStyles.reg12Red,
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
                    controller: passwordController,
                    keyboardType: TextInputType.phone,
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter Password ';
                      }
                      // final bool passwordValid = RegExp(
                      //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                      // ).hasMatch(passwordController.text ?? "");
                      // if (!passwordValid ){
                      //   return 'Please Enter Valid Password ';
                      // }
                      if (text.length < 6) {
                        return 'Password must be at least 6 chars.';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          //todo : navigate to forget screen
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.forgetPasswordRouteName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgetPassword,
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
                  CustomElevatedButton(
                    onPressed: () {
                      //todo: navigate to homescreen
                      login();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: AppStyles.med20White,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dontHaveAnAccount,
                        style: AppStyles.reg14grey,
                      ),
                      TextButton(
                        onPressed: () {
                          //todo : navigate to register screen
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.registerRouteName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signup,
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
                            AppLocalizations.of(context)!.login,
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

  void login() {
    //todo : login
    if (formKey.currentState?.validate() == true) {
      Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
    }
  }
}

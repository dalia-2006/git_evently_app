import 'package:flutter/material.dart';
import 'package:islami/add_event/add_event_screen.dart';
import 'package:islami/event_details/event_details_screen.dart';
import 'package:islami/forgetPassword/forgetPasswordScreen.dart';
import 'package:islami/login/loginScreen.dart';
import 'package:islami/provider/app_language_provider.dart';
import 'package:islami/provider/app_theme_Provider.dart';
import 'package:islami/register/registerScreen.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:provider/provider.dart';

import 'home/homeScreen.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      title: 'Evently',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => Homescreen(),
        AppRoutes.loginRouteName: (context) => LoginScreen(),
        AppRoutes.registerRouteName: (context) => RegisterScreen(),
        AppRoutes.forgetPasswordRouteName: (context) => ForgetPasswordScreen(),
        AppRoutes.addEventRouteName: (context) => AddEventScreen(),
        AppRoutes.eventDetailsRouteName: (context) => EventDetailsScreen(),
      },
      locale: Locale(languageProvider.appLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}

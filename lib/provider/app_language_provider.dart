import 'package:flutter/material.dart';
import 'package:islami/l10n/app_localizations.dart';

class AppLanguageProvider extends ChangeNotifier {
  //todo:data
  String appLanguage = 'en';

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  bool get isEnglish => appLanguage == "en";
}

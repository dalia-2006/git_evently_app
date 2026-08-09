import 'package:flutter/material.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../provider/app_language_provider.dart';
import '../utils/size_utils.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.02,
        horizontal: context.width * 0.02,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        spacing: context.height * 0.02,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              //todo:change language to english
              languageProvider.changeLanguage('en');
            },
            child: languageProvider.appLanguage == 'en'
                ? getSelectedItemLanguage(
                    language: AppLocalizations.of(context)!.english,
                  )
                : getUnSelectedItemLanguage(
                    language: AppLocalizations.of(context)!.english,
                  ),
          ),
          InkWell(
            onTap: () {
              //todo: change language to arabic
              languageProvider.changeLanguage('ar');
            },
            child: languageProvider.appLanguage == 'ar'
                ? getSelectedItemLanguage(
                    language: AppLocalizations.of(context)!.arabic,
                  )
                : getUnSelectedItemLanguage(
                    language: AppLocalizations.of(context)!.arabic,
                  ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemLanguage({required String language}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language, style: Theme.of(context).textTheme.titleMedium),
        Icon(Icons.check, color: Theme.of(context).cardColor, size: 30),
      ],
    );
  }

  Widget getUnSelectedItemLanguage({required String language}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(language, style: AppStyles.reg14grey)],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/tabs/setting/show_bottom_sheet_language.dart';
import 'package:islami_app/tabs/setting/show_bottom_sheet_theme.dart';
import 'package:provider/provider.dart';

class SettingsScrren extends StatefulWidget {
  const SettingsScrren({Key? key}) : super(key: key);

  @override
  State<SettingsScrren> createState() => _SettingsScrrenState();
}

class _SettingsScrrenState extends State<SettingsScrren> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProviderApp>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${AppLocalizations.of(context)!.language}',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              ShowBottomSheetLanguage();
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    provider.AppLanguage == 'en' ? 'English' : 'العربية',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${AppLocalizations.of(context)!.theme}',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              ShowBottomSheetTheme();
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    provider.themeMode == ThemeMode.light
                        ? '${AppLocalizations.of(context)!.light}'
                        : '${AppLocalizations.of(context)!.dark}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void ShowBottomSheetTheme() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ShowThemeBottomSheet();
        });
  }

  void ShowBottomSheetLanguage() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ShowlanguageBottomSheet();
        });
  }
}

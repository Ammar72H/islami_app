import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ShowThemeBottomSheet extends StatefulWidget {
  @override
  State<ShowThemeBottomSheet> createState() => _ShowThemeBottomSheet();
}

class _ShowThemeBottomSheet extends State<ShowThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProviderApp>(context);
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                pro.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: showThemeSelected('${AppLocalizations.of(context)!.light}',
                  pro.themeMode == ThemeMode.light ? false : true)),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                pro.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: showThemeSelected('${AppLocalizations.of(context)!.dark}',
                  pro.themeMode == ThemeMode.light ? true : false)),
        ],
      ),
    );
  }

  Widget showThemeSelected(String text, bool selected) {
    if (selected) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$text',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Theme.of(context).primaryColorDark),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$text',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Icon(
            Icons.check,
          )
        ],
      );
    }
  }
}

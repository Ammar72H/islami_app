import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioScreen extends StatelessWidget {
  static const String routeName = 'quran';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 60),
      child: Column(
        children: [
          Image.asset(
            'assets/images/radio2.png',
            height: 222,
            width: 412,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '${AppLocalizations.of(context)!.holy_quran_radio}',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 60,
          ),
          Image.asset('assets/images/radio_play.png')
        ],
      ),
    );
  }
}

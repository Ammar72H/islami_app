import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../my_theme.dart';
import 'hadeth_item.dart';

class AhadethScreen extends StatefulWidget {
  static const String routeName = 'quran';

  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<AhadethModel> AllAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (AllAhadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Image.asset('assets/images/ahadeth_header_bg.png'),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 2,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 2,
        ),
        AllAhadeth.length == 0
            ? Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.separated(
                    itemBuilder: (_, index) {
                      return HadethItem(AllAhadeth[index]);
                    },
                    separatorBuilder: (_, index) {
                      return Container(
                        height: 1,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        color: MyThemeData.primaryColor,
                      );
                    },
                    itemCount: AllAhadeth.length),
              )
      ],
    );
  }

  void loadHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadeth = content.trim().split('#\r\n');
    for (int i = 0; i < hadeth.length; i++) {
      String AllHadethText = hadeth[i];
      List<String> lines = AllHadethText.split('\n');
      String title = lines[0];
      lines.removeAt(0);
      AhadethModel ahadethModel = AhadethModel(title, lines);
      AllAhadeth.add(ahadethModel);
    }
    setState(() {});
  }
}

class AhadethModel {
  String title;
  List<String> content;

  AhadethModel(this.title, this.content);
}

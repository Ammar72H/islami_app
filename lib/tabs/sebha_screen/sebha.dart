import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../providers/my_provider.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<String> tesbih = ['سبحان الله ', 'الحمد لله', 'الله أكبر'];
  int numSebha = 0;
  int count = 1;

  String nameSebha = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProviderApp>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Center(
                child: Container(
                    margin: EdgeInsets.only(
                      left: 50,
                    ),
                    child: Image.asset(
                      'assets/images/headSebha.png',
                    ))),
            Container(
                margin: EdgeInsets.only(
                  top: 85,
                ),
                child: Center(
                    child: InkWell(
                        onTap: () {
                          addTesbih(count);
                        },
                        child: Image.asset('assets/images/bodySebha.png')))),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context)!.sebha_counter,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 40,
          width: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25)),
          child:
              Text('$numSebha', style: Theme.of(context).textTheme.headline2),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: 140,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25)),
          child:
              Text('$nameSebha', style: Theme.of(context).textTheme.headline2),
        ),
      ],
    );
  }

  void addTesbih(index) {
    numSebha++;
    if (numSebha == 33) {
      nameSebha = tesbih[index];
      numSebha = 0;
      count++;
    }
    if (nameSebha == 'الله أكبر') {
      count = 0;
    }
    setState(() {});
  }
}

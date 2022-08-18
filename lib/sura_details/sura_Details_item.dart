import 'package:flutter/material.dart';

class SyraDetailsItem extends StatelessWidget {
  String SuraName;

  SyraDetailsItem(this.SuraName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        SuraName,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}

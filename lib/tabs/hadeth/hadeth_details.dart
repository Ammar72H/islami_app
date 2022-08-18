import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:islami_c6_online_2/tabs/hadeth/ahadeth.dart';

import '../../providers/my_provider.dart';
import 'ahadeth.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'ahadeth';

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProviderApp>(context);

    AhadethModel model =
        ModalRoute.of(context)!.settings.arguments as AhadethModel;

    return Stack(
      children: [
        Image.asset(
          pro.getBackGround(),
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              '${model.title}',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                '${model.content}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

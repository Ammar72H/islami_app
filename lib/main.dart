import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/sura_details/sura_details_screen.dart';
import 'package:islami_app/tabs/hadeth/hadeth_details.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_layout.dart';
import 'my_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return MyProviderApp();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late MyProviderApp myProviderApp;

  @override
  Widget build(BuildContext context) {
    myProviderApp = Provider.of<MyProviderApp>(context);
    initSharedPref();
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(myProviderApp.AppLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: myProviderApp.themeMode,
    );
  }

  void initSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('language') ?? 'ar';
    myProviderApp.changeLanguage(lang);
    if (prefs.getString('theme') == 'dark') {
      myProviderApp.changeTheme(ThemeMode.dark);
    } else if (prefs.getString('theme') == 'light') {
      myProviderApp.changeTheme(ThemeMode.light);
    }
  }
}

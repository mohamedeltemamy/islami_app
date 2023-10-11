import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/sura_details.dart';
import 'package:islami_app/tabs/ahadeth_details.dart';
import 'package:islami_app/theme_data.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Sura_Details.routeName: (context) => Sura_Details(),
        Hadeth_Details.routeName: (context) => Hadeth_Details(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.light,
      darkTheme: MyThemeData.dark,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // arabic
      ],
    );
  }
}

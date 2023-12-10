import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saitamasays/Colors/Colors.dart';
import 'package:saitamasays/Pages/SavedQuotes.dart';
import 'package:saitamasays/Pages/MainLayout.dart';
import 'package:saitamasays/SaitamaPhrases/SaitamaPhrases.dart';


void main() {
  final phrases = SaitamaLines();
  final rand = Random();
  final int StartQuoteInd = rand.nextInt(phrases.lines.length);
  runApp(MyApp(startInd: StartQuoteInd));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,
  required this.startInd}) : super(key: key);
  static const colors = AppColors();
  final int startInd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 3,
        ),
      ),
      routes: {
        '/MainLayout': (context) => MainLayout(IntroQuoteInd: startInd),
        '/SavedQuotes': (context) => SavedQuotes(),
      },
      initialRoute: '/MainLayout',
    );
  }
}

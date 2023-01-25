import 'package:flutter/material.dart';
import 'package:quran/screens/MyHomePage.dart';
import 'package:quran/screens/onborading.dart';
import 'package:quran/screens/surah.dart';
import 'package:quran/screens/widgets/menu.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:ThemeData(
            primaryColor:Colors.white,
           secondaryHeaderColor:Colors.purpleAccent
        ),
      home:        OnBorading (),
    );
  }
}

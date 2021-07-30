import 'package:ewallet/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        fontFamily: 'Roboto Regular',
        textTheme:
            TextTheme(headline1: TextStyle(fontFamily: 'Roboto Regular')),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: PRIMARY_COLOR,
            padding: EdgeInsets.all(10),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}

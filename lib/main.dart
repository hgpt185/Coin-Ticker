import 'package:flutter/material.dart';
import 'price_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //     primaryColor: Colors.lightBlue,
      //     scaffoldBackgroundColor: Colors.white),
      theme: ThemeData.dark(),
      home: PriceScreen(),
    );
  }
}

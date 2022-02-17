import 'package:flutter/material.dart';
import 'package:flutter_social_ui/screen/splash.dart';

import 'config/config.dart';
import 'screen/homescree.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity:VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
        primaryColor: Colors.yellow[200],
      ),
      home: Spash(),
    );
  }
}

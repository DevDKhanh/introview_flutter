import 'package:flutter/material.dart';
import 'package:intro_screen/pages/home.dart';
import 'package:intro_screen/pages/intro.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      "/": (context) => const IntroView(),
      "/home": (context) => const Home(),
    },
  ));
}

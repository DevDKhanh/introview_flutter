import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/home.dart';
import './pages/intro.dart';

Future main() async {
  WidgetsFlutterBinding().ensureVisualUpdate();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      "/": (context) => showHome ? const Home(): const IntroView(),
    },
  ));
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './intro.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', false);

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const IntroView(),
                ));
              },
              icon: const Icon(Icons.logout_sharp))
        ],
      ),
    );
  }
}

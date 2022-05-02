import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intro_screen/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  final controller = PageController();
  bool islastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              islastPage = index == 2;
            });
          },
          children: [
            Container(
              color: Colors.blueAccent,
              child: const Center(
                child: Text(
                  'Page 1',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            Container(
              color: Colors.deepOrange,
              child: const Center(
                child: Text(
                  'Page 2',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            Container(
              color: Colors.amberAccent,
              child: const Center(
                child: Text(
                  'Page 3',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: islastPage
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 80.0,
              color: Colors.blue,
              child: Center(
                child: TextButton(
                    onPressed: () async {
                      /*---------- Set local value show home ----------*/
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
                    },
                    child: const Text(
                      'Bắt đầu ngay',
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    )),
              ))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: const Text('Bỏ qua')),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                          spacing: 16.0,
                          dotColor: Colors.grey.shade400,
                          activeDotColor: Colors.orange.shade700),
                    ),
                  ),
                  TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                      child: const Text('Tiếp theo')),
                ],
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.title});

  final String title;

  @override
  State<SplashPage> createState() => _MainPageState();
}

class _MainPageState extends State<SplashPage> {
  String mainFont = "AppleGothic";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              "Recycling Assistant",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: mainFont,
              ),
            ),
            SizedBox(
              height: 60,
              child: Column(
                children: [
                  const Text("Thank you for being part of our community"),
                  const Text("and commitment to keeping our community clean!"),
                ],
              ),
            ),
            SizedBox(
              width: 100.0,
              height: 200.0,
              child: Image(image: AssetImage('assets/recycling.png')),
            ),
            SizedBox(height: 100),
            SizedBox(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AppleGothic',
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: AnimatedTextKit(
                  animatedTexts: [FadeAnimatedText('Get Started')],
                  repeatForever: true,
                  onTap: () => context.go('/scan'),
                  controller: AnimatedTextController(),
                ),
              ),
            ),

            //animated text that when tapped it transitions to scan page
          ],
        ),
      ),
    );
  }
}

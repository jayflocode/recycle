import 'package:flutter/material.dart';

//replace Sample with Class Type, ex. Sample w/ Oil, etc
void main() {
  runApp(const Sample());
}

final String mainFont = "AppleGothic";

//class
class Sample extends StatelessWidget {
  const Sample({super.key});
  //color of background
  static const color = Color(0xFFB6E8C6);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'no title',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
        ),
        //sets the background color of the scene completely
        scaffoldBackgroundColor: const Color(0xFFB6E8C6),
        fontFamily: mainFont,
      ),
      //homepage text
      home: const SamplePage(title: 'Sample'),
    );
  }
}

class SamplePage extends StatefulWidget {
  const SamplePage({super.key, required this.title});

  final String title;

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  /* This is the Area of the Project where you set up the Structure of the
  app.
  */
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent,
        border: Border.all(color: Colors.blue, width: 50),
      ),
    );
  }
}

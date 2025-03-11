import 'package:flutter/material.dart';

// this is a sample template of a properly formatted page
// that I created to start.

// state class with upper case, ex. Sample
void main() {
  runApp(const Sample());
}

//class Sample
class Sample extends StatelessWidget {
  const Sample({super.key});
  //color of background
  static const color = Color(0xFFB6E8C6);

  // This widget object Required class
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*this "title" value appears to only be used in Android
       learn more by using your ide's info overlay
       long story short, in menu items, recents app, and etc use this
       */
      title: 'Sample Text',
      theme: ThemeData(
        //sets the background color of the scene completely
        scaffoldBackgroundColor: const Color(0xFFB6E8C6),
      ),
      //homepage text on the upper app bar
      home: const MyHomePage(title: 'sample title'),
    );
  }
}

// elements that require "change" go in stateful
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /* This is the Area of the Project where you set up the Structure of the
  app.
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB6E8C6),
        title: Text(widget.title),
      ),
      /* In this area you will set up columns and items and etc
         study the code in the main, and scan page I already made
     */
      body: Center(child: Column()),
    );
  }
}

import 'package:flutter/material.dart';

//
void main() {
  runApp(const MyApp());
}

//class
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const color = Color(0xFFB6E8C6);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycling Application',
      theme: ThemeData(
        //sets the background color of the scene completely
        scaffoldBackgroundColor: const Color(0xFFB6E8C6),
      ),
      //homepage text
      home: const MyHomePage(title: 'City of Orlando'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
      /*there is an app bar that acts as a divider but because we set up the
     same color as the background we can can't tell the difference
     as a test, hover over the hex code and use another color. 
     */
      appBar: AppBar(
        backgroundColor: Color(0xFFB6E8C6),
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          /*cross axis alignment spaces the elements evenly center
          remove center and allow code to auto complete to see other options
          */
          crossAxisAlignment: CrossAxisAlignment.center,
          /* All the text attributes are included in children
             think of all eggs in one basket
             Text is declared using const, as you can see commas
             separate text modifications
 
            */
          children: [
            const Text(
              "Recycling Assistant",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'AppleGothic',
              ),
            ),
            /* In my opinion, the most useful tool is Sized Box
              because it allows you to do a lot of manipulation
              I simply wanted to group these two items
              I used height to create "spacing" or "padding"
            */
            SizedBox(
              height: 50,
              child: Column(
                children: [
                  const Text("Thank you for being part of our community!"),
                  const Text(
                    "and your commitment to keeping our community clean",
                  ),
                ],
              ),
            ),
            /* In my opinion, the most useful tool is Sized Box
               if you simply just declare the image it will 
               look awkard and huge, so the sized box here acts
               as a restrain to allow you to easily 
               adjust size.
            */
            SizedBox(
              width: 100.0,
              height: 200.0,
              /*if you are adding a component inside the sized box then
              you must declare it as a child followed by closing comma etc
              */
              child: Image(image: AssetImage('assets/recycling.png')),
            ),
            /* this sized box here is used for padding to shift
            let's get started towards the middle
            */
            SizedBox(height: 100),
            const Text(
              "Let's Get Started!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'AppleGothic',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

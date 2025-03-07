import 'package:flutter/material.dart';

void main() {
  runApp(const Aluminum());
}

//class
class Aluminum extends StatelessWidget {
  const Aluminum({super.key});
  //color of background
  static const color = Color(0xFFB6E8C6);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'no title',
      theme: ThemeData(
        //sets the background color of the scene completely
        scaffoldBackgroundColor: const Color(0xFFB6E8C6),
      ),
      //homepage text
      home: const ScanHomePage(title: 'Aluminum'),
    );
  }
}

class ScanHomePage extends StatefulWidget {
  const ScanHomePage({super.key, required this.title});

  final String title;

  @override
  State<ScanHomePage> createState() => _ScanHomePageState();
}

class _ScanHomePageState extends State<ScanHomePage> {
  String mainFont = "AppleGothic";
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: 75.0,
              height: 150.0,
              /*if you are adding a component inside the sized box then
              you must declare it as a child followed by closing comma etc
              */
              child: Image(image: AssetImage('assets/recycling.png')),
            ),
            SizedBox(),
            RichText(
              text: TextSpan(
                text: 'This item contains Aluminum',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: null,
                  fontFamily: mainFont,
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 350,
              child: RichText(
                text: TextSpan(
                  text:
                      '   In 2018, 3.9 million of aluminum'
                      'municipal solid\n\nwaste was generated,'
                      'The total recycling rate for\n\naluminum items'
                      'was 34.9 percent. Both aluminum\n\ncans and'
                      'foil can be recycled.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: null,
                    fontFamily: mainFont,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

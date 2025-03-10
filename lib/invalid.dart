import 'package:flutter/material.dart';
import 'package:recycle/scan.dart';

//stored upc is located here

void main() {
  runApp(const Invalid());
}

//class
class Invalid extends StatelessWidget {
  const Invalid({super.key});
  //color of background
  static const color = Color(0xFFB6E8C6);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String mainFont = "AppleGothic";
    return MaterialApp(
      title: 'no title',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
        ),
        //sets the background color of the scene completely
        scaffoldBackgroundColor: const Color(0xFFB6E8C6),
        fontFamily: mainFont,
        //sets the background color of the scene completely
      ),
      //homepage text
      home: const InvalidHomepage(title: 'Not Found'),
    );
  }
}

class InvalidHomepage extends StatefulWidget {
  const InvalidHomepage({super.key, required this.title});

  final String title;

  @override
  State<InvalidHomepage> createState() => _InvalidHomepageState();
}

class _InvalidHomepageState extends State<InvalidHomepage> {
  String mainFont = "AppleGothic";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            SizedBox(
              child: RichText(
                text: TextSpan(
                  text: "Incompatible Code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: null,
                    fontFamily: mainFont,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 50,
              width: 150,
              // row to place two images side by side
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(image: AssetImage('assets/recycling.png')),
                  Image(image: AssetImage('assets/missing.png')),
                ],
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 320,
              child: RichText(
                text: TextSpan(
                  text:
                      '  The system only uses compatible UPC or QR\n\n'
                      'Codes. Make sure the code you are scanning\n\n'
                      'is not a code intended for other purposes. Such\n\n'
                      'as website redirection, redemption, or other\n\n'
                      'purposes. Contact us if this is an error.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: null,
                    fontFamily: mainFont,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(
                  Color.fromARGB(255, 169, 240, 191),
                ),
              ),
              child: const Text('Return to Scan another Item'),
              onPressed: () {
                Navigator.of(context).push(_switchToScan());
              },
            ),
          ],
        ),
      ),
    );
  }
}

Route _switchToScan() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const ScanPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

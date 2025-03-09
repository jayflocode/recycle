import 'package:flutter/material.dart';
import 'package:recycle/scan.dart';

//stored upc is located here
var upcCode = '000000';

void main() {
  runApp(const Notfound());
}

//class
class Notfound extends StatelessWidget {
  const Notfound({super.key});
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
      home: const MyHomePage(title: 'Not Found'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              child: Text(
                "UPC code $upcCode can't be found",
                style: TextStyle(fontSize: 20),
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
              child: RichText(
                text: TextSpan(
                  text:
                      '  The system is unable to determine the contents\n\n'
                      'or the materials that you scanned. Either item\n\n'
                      'has been discontinued, or we are working hard to\n\n'
                      'include this item in our database. Please submit\n\n'
                      'valuable feedback to our website when possible!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: null,
                    fontFamily: mainFont,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
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

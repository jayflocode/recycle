import 'package:flutter/material.dart';
import 'package:recycle/scan.dart';
import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp(const Lawn());
}

//class
class Lawn extends StatelessWidget {
  const Lawn({super.key});
  //color of background
  static const color = Color(0xFFB6E8C6);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'no title',
      theme: ThemeData(
        //sets the background color of the scene completely
        scaffoldBackgroundColor: const Color(0xFFB6E8C6),
      ),
    
      home: const MyHomePageHomePage(title: 'Aluminum'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
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
   
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: 75.0,
              height: 150.0,
  
              child: Image(image: AssetImage('assets/recycling.png')),
            ),
            SizedBox(),
            RichText(
              text: TextSpan(
                text: 'The item you scanned contains Lawn Materials',
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
                  '   In 2018, 35.4 million tons of yard'
                      'trimmings were generated. Lawn materials'
                      'cannot be recycled, but they can be'
                      'composted. If you are unable to compost,'
                      'check with your local community to learn if'
                      'there is a yard trimming collection service'
                      'near you.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: null,
                    fontFamily: mainFont,
                  ),
                ),
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

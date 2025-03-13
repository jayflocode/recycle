import 'package:flutter/material.dart';
import 'package:recycle/scan.dart';
import 'package:url_launcher/url_launcher.dart';

String mainFont = "AppleGothic";
void main() {
  runApp(const Plastic());
}

class Plastic extends StatelessWidget {
  const Plastic({super.key});

  static const color = Color(0xFFB6E8C6); // Background color

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plastic Recycling',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFB6E8C6)),
      home: const MyHomePage(title: 'Plastic'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  //This contains the logo of the recycling app
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/recycling.png', height: 80),

            const SizedBox(height: 20),

            // Main text
            Text(
              "The item you scanned contains plastic",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: mainFont,
              ),
            ),

            const SizedBox(height: 20),

            // Description text
            Text(
              "More than 35 million tons of plastics were generated in the United States in 2018 and only 8.7 percent was recycled. "
              "Some types of plastics are not accepted in community recycling programs. "
              "Check with your local recycling program to find out which types of plastic they accept. "
              "When possible, purchase products made from recycled plastic materials. "
              "\nFor more information on plastics: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: null,
                fontFamily: mainFont,
              ),
            ),

            const SizedBox(height: 20),

            // Clickable link 1
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                  "https://www.epa.gov/recycle/how-do-i-recycle-common-recyclables#pla",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text(
                "https://www.epa.gov/recycle/how-do-i-recycle-common-recyclables#pla",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 30),

            // Additional info text
            const Text(
              "For more information on what is recycable: ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            // Clickable link 2
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                  "https://www.orlando.gov/Trash-Recycling/What-Goes-Where",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                  LaunchMode mode = LaunchMode.platformDefault;
                  mode == LaunchMode.inAppBrowserView;
                }
              },
              child: const Text(
                "www.orlando.gov/Trash-Recycling",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            //This is the button used for going back to the scan page
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
//Route that links the plastic page with the scan page
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
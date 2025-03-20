import 'package:flutter/material.dart';
import 'package:recycle/scan.dart';
import 'package:url_launcher/url_launcher.dart';

String mainFont = "AppleGothic";
void main() {
  runApp(const Oil());
}

class Oil extends StatelessWidget {
  const Oil({super.key});

  static const color = Color(0xFFB6E8C6); // Background color

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oil Products',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFB6E8C6)),
      home: const OilPage(title: 'Oil Products'),
    );
  }
}

class OilPage extends StatelessWidget {
  final String title;
  const OilPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/oil.png', height: 80),

            const SizedBox(height: 20),

            // Main text
            Text(
              "The item you scanned contains oil-based products",
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
              "Oil-based products, including motor oil, cooking oil, and industrial lubricants, require proper disposal to prevent environmental contamination."
              " Improper disposal can lead to water pollution, soil degradation, and harm to wildlife."
              " Many communities offer recycling programs or hazardous waste collection sites for used oil and related products.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: mainFont,
              ),
            ),

            const SizedBox(height: 20),

            // Clickable link 1
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                  "https://www.epa.gov/recycle/managing-used-oil",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text(
                "https://www.epa.gov/recycle/managing-used-oil",
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
              "Find local oil recycling facilities:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            // Clickable link 2
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                  "https://earth911.com/recycling-guide/how-to-recycle-motor-oil/",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text(
                "www.earth911.com/recycling-guide/how-to-recycle-motor-oil/",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Button to return to scan page
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

// Route that links the oil page with the scan page
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

import 'package:flutter/material.dart';
import 'package:recycle/scan.dart';
import 'package:url_launcher/url_launcher.dart';

String mainFont = "AppleGothic";
void main() {
  runApp(const Hazardous());
}

class Hazardous extends StatelessWidget {
  const Hazardous({super.key});

  static const color = Color(0xFFB6E8C6); // Background color

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hazardous Materials',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFB6E8C6)),
      home: const HazardousPage(title: 'Hazardous Material'),
    );
  }
}

class HazardousPage extends StatelessWidget {
  final String title;
  const HazardousPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/hazardous.png', height: 80),

            const SizedBox(height: 20),

            // Main text
            Text(
              "The item you scanned is hazardous material",
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
              "Leftover household products that can catch fire, react, or explode under certain circumstances,or that are corrosive are considered household hazardous waste (HHW)."
              "Although it depends on your local solid waste agency/recycling facility, some examples include pesticides, herbicides, insecticides, paints, solvents, oil filters, light bulbs, batteries, unemptied aerosol cans, ammunition, ammonia, antifreeze, and nail polish."
              "These products require special care when you dispose of them. HHW may be dangerous to people and bad for the environment if they are poured down the drain, dumped on the ground, or thrown out with regular trash.",
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
                  "https://www.epa.gov/hw/household-hazardous-waste-hhw",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text(
                "https://www.epa.gov/hw/household-hazardous-waste-hhw",
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
              "Find local hazardous waste disposal sites:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            // Clickable link 2
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                  "https://www.orlando.gov/Trash-Recycling/Household-Hazardous-Waste",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text(
                "www.orlando.gov/Trash-Recycling/Household-Hazardous-Waste",
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

// Route that links the hazardous page with the scan page
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

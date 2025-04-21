import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/main_p_routes.dart';
import 'package:url_launcher/url_launcher.dart';

// attn this page is not finished

final String mainFont = "AppleGothic";

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key, required this.title});

  final String title;

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
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
                text: 'This item contains Batteries',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: null,
                  fontFamily: mainFont,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              child: RichText(
                text: TextSpan(
                  text:
                      "Lead-acid batteries are one of the most recycled\n\n"
                      "products. In 2018, 2.9 million were recycled,\n\n"
                      "representing 99 percent of generation. Recycling\n\n"
                      "rates of other battery types are not as well tracked.\n\n"
                      "Although batteries are recyclable, most batteries,\n\n"
                      "including lithium-ion, lithium metal, lead-acid, nickel\n\n"
                      "cadmium, and other rechargeable batteries, should\n\n"
                      "NOT go in household garbage or recycling",
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
            SizedBox(height: 30),
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                  "https://www.epa.gov/recycle/how-do-i-recycle-common-recyclables#batteries",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text(
                "https://www.epa.gov/recycle/how-do-i-recycle-common-recyclables#batteries",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 10),

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
                  "https://recycling.x10.mx/pages/info-pages/batteries.html",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                  LaunchMode mode = LaunchMode.platformDefault;
                  mode == LaunchMode.inAppBrowserView;
                }
              },
              child: const Text(
                "https://recycling.x10.mx/pages/info-pages/batteries.html",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(
                  Color.fromARGB(255, 169, 240, 191),
                ),
              ),
              child: const Text('Return to Scan another Item'),
              onPressed: () {
                context.push(Routes.scan);
              },
            ),
          ],
        ),
      ),
    );
  }
}

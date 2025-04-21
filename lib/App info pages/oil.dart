import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/main_p_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class OilPage extends StatefulWidget {
  const OilPage({super.key, required this.title});

  final String title;

  @override
  State<OilPage> createState() => _OilPageState();
}

class _OilPageState extends State<OilPage> {
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
                text: 'The item scanned contains Used Oil',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: null,
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              child: RichText(
                text: TextSpan(
                  text:
                      "Never dump your used motor oil down the drain\n\n"
                      "the used oil from one oil change can contaminate\n\n"
                      "one million gallons of fresh water. By recycling\n\n"
                      "your used oil, you help keep our water supply clean.\n\n"
                      "Additionally, it takes only one gallon of used oil\n\n"
                      "to produce 2.5 quarts of new motor oil compared to\n\n"
                      "42 gallons of crude oil. Many garages and auto-supply\n\n"
                      "stores that sell motor oil also accept oil for recycling.\n\n",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: null,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                  "https://www.epa.gov/recycle/how-do-i-recycle-common-recyclables#oil",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text(
                "https://www.epa.gov/recycle/how-do-i-recycle-common-recyclables#oils",
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
            SizedBox(height: 50),
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
            SizedBox(height: 50),
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

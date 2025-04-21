import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class Help extends StatefulWidget {
  const Help({super.key, required this.title});

  final String title;

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
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
                text: 'Help Central',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: null,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 400,
              child: RichText(
                text: TextSpan(
                  text:
                      '"Thank you for being a valuable part of our\n\n'
                      "community. We strive to make our community\n\n"
                      "a cleaner place, and if you have any questions\n\n"
                      "please use the information below to contact us\n\n"
                      "us, or submit any feedback to make our service\n\n"
                      'better. Thank you for using our application!"',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 18,
                    fontWeight: null,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: 'Resources',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: null,
                ),
              ),
            ),

            SizedBox(height: 20),

            RichText(
              text: TextSpan(
                text: 'Links',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: null,
                ),
              ),
            ),
            // Clickable link 2
            SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                  "https://recycling.x10.mx/pages/contact.html",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                  LaunchMode mode = LaunchMode.platformDefault;
                  mode == LaunchMode.inAppBrowserView;
                }
              },
              child: const Text(
                "App Feedback Form",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            // Clickable link 2
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                  "https://recycling.x10.mx/pages/contact.html",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                  LaunchMode mode = LaunchMode.platformDefault;
                  mode == LaunchMode.inAppBrowserView;
                }
              },
              child: const Text(
                "https://www.epa.gov",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'Phone Numbers',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: null,
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'City Hall:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: null,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () async {
                      final url = Uri.parse("tel:4072462121");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                        LaunchMode mode = LaunchMode.platformDefault;
                        mode == LaunchMode.platformDefault;
                      }
                    },
                    child: const Text(
                      "407-246-2121",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Orlando Recycling:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: null,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () async {
                      final url = Uri.parse("tel:4072462121");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                        LaunchMode mode = LaunchMode.platformDefault;
                        mode == LaunchMode.inAppBrowserView;
                      }
                    },
                    child: const Text(
                      "407-246-2121",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

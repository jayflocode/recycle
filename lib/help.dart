import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

//replace Help with Class Type, ex. Help w/ Oil, etc

final String mainFont = "General Sans";

void main() {
  runApp(const Help());
}

//class
class Help extends StatelessWidget {
  const Help({super.key});
  //color of background
  static const color = Color(0xFFB6E8C6);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'no title',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
        ),
        //sets the background color of the scene completely
        scaffoldBackgroundColor: const Color(0xFFB6E8C6),
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      //homepage text
      home: const HelpPage(title: 'Help'),
    );
  }
}

class HelpPage extends StatefulWidget {
  const HelpPage({super.key, required this.title});

  final String title;

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
                text: 'Help Central',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: null,
                  fontFamily: mainFont,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 400,
              child: RichText(
                text: TextSpan(
                  text:
                      "Thank you for being a valuable part of our\n\n"
                      "community. We strive to make our community\n\n"
                      "a cleaner place, and if you have any questions\n\n"
                      "please use the information below to contact us\n\n"
                      "us, or submit any feedback to make our service\n\n"
                      "better. Thank you for using our application!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: null,
                    fontFamily: mainFont,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: 'Resources',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: mainFont,
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
                  fontFamily: mainFont,
                ),
              ),
            ),
            // Clickable link 2
            SizedBox(height: 10),
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
                "Feedback Form",
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
                  "https://www.orlando.gov/Trash-Recycling/What-Goes-Where",
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
                  fontFamily: mainFont,
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
                        fontFamily: mainFont,
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
                        fontFamily: mainFont,
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

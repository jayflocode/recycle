import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/main_p_routes.dart';
import 'package:url_launcher/url_launcher.dart';

final String mainFont = "AppleGothic";

void main() {
  runApp(const Aluminum());
}

//class
class Aluminum extends StatelessWidget {
  const Aluminum({super.key});
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
        fontFamily: mainFont,
        //sets the background color of the scene completely
      ),
      //homepage text
      home: const AluminumPage(title: 'Aluminum'),
    );
  }
}

class AluminumPage extends StatefulWidget {
  const AluminumPage({super.key, required this.title});

  final String title;

  @override
  State<AluminumPage> createState() => _AluminumPageState();
}

class _AluminumPageState extends State<AluminumPage> {
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
              /*if you are adding a component inside the sized box then
              you must declare it as a child followed by closing comma etc
              */
              child: Image(image: AssetImage('assets/recycling.png')),
            ),
            SizedBox(),
            RichText(
              text: TextSpan(
                text: 'This item contains Aluminum',
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
              child: RichText(
                text: TextSpan(
                  text:
                      '   In 2018, 3.9 million of aluminum'
                      'municipal solid\n\nwaste was generated,'
                      'The total recycling rate for\n\naluminum items'
                      'was 34.9 percent. Both aluminum\n\ncans and'
                      'foil can be recycled.',
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
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                  "https://www.epa.gov/recycle/how-do-i-recycle-common-recyclables#aluminum",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text(
                "https://www.epa.gov/recycle/how-do-i-recycle-common-recyclables#aluminum",
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
            SizedBox(height: 100),
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

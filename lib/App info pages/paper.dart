import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/main_p_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class PaperPage extends StatefulWidget {
  const PaperPage({super.key, required this.title});

  final String title;

  @override
  State<PaperPage> createState() => _PaperPageState();
}

class _PaperPageState extends State<PaperPage> {
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
                text: 'This item contains Paper/Cardboard',
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
                      "Paper makes up 23 percent of municipal solid waste\n\n"
                      "(trash) generated each year, more than any other\n\n"
                      "material. Americans recycled about 68 percent of th\n\n"
                      "paper they used in 2018. This recovered paper is used\n\n"
                      "to make new paper products, which saves trees and\n\n"
                      "other natural resources. Most community or office\n\n"
                      "recycling programs accept paper and paper products.\n\n"
                      "Check what your community or office program accepts\n\n"
                      "before you put it in the bin.",
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
                  "https://www.epa.gov/recycle/how-do-i-recycle-common-recyclables#pap",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text(
                "https://www.epa.gov/recycle/how-do-i-recycle-common-recyclables#pap",
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

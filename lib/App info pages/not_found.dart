import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/main_p_routes.dart';

//stored upc is located here
var upcCode = '';

class NotFound extends StatefulWidget {
  const NotFound({super.key, required this.title});

  final String title;

  @override
  State<NotFound> createState() => _NotFoundState();
}

class _NotFoundState extends State<NotFound> {
  String mainFont = "AppleGothic";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            SizedBox(
              child: RichText(
                text: TextSpan(
                  text: "UPC Code: $upcCode\nIt's not a valid UPC code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: null,
                    fontFamily: mainFont,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 50,
              width: 150,
              // row to place two images side by side
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(image: AssetImage('assets/recycling.png')),
                  Image(image: AssetImage('assets/missing.png')),
                ],
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 340,
              child: RichText(
                text: TextSpan(
                  text:
                      '  The system is unable to determine the\n\n'
                      'content, or the materialthat you scanned.\n\n'
                      'Either the item has been discontinued, or\n\n'
                      'we are working hard to include this item \n\n'
                      'in our database. Please contacts us to\n\n'
                      'submit your feedback when possible.',
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/main_p_routes.dart';

class Invalid extends StatefulWidget {
  const Invalid({super.key, required this.title});

  final String title;

  @override
  State<Invalid> createState() => _InvalidState();
}

class _InvalidState extends State<Invalid> {
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
                  text: "Incompatible Code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: null,
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
              width: 320,
              child: RichText(
                text: TextSpan(
                  text:
                      '  The system only uses compatible UPC or QR\n\n'
                      'Codes. Make sure the code you are scanning\n\n'
                      'is not a code intended for other purposes. Such\n\n'
                      'as website redirection, redemption, or other\n\n'
                      'purposes. Contact us if this is an error.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: null,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
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

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:recycle/aluminum.dart';
import 'package:recycle/not_found.dart';
import 'dart:convert';

import 'package:recycle/plastic.dart';

void main() {
  runApp(const ScanPage());
}

//class
class ScanPage extends StatelessWidget {
  const ScanPage({super.key});
  static const color = Color(0xFFB6E8C6);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycling Application',
      theme: ThemeData(
        //sets the background color of the scene completely
        scaffoldBackgroundColor: const Color(0xFFB6E8C6),
      ),
      //homepage text
      home: const ScanHomePage(title: 'Scan your Product'),
    );
  }
}

class ScanHomePage extends StatefulWidget {
  const ScanHomePage({super.key, required this.title});

  final String title;

  @override
  State<ScanHomePage> createState() => _ScanHomePageState();
}

class _ScanHomePageState extends State<ScanHomePage> {
  /* This is the Area of the Project where you set up the Structure of the
  app.
  */

  // search data method is used to check the upc code against database
  Future searchData(var code) async {
    var urlWeb = Uri.parse('https://recycling.x10.mx/get.php');

    code = code.toString().replaceAll("-", "");

    debugPrint("Removed Dashes: $code");

    //php file storing get command

    final response = await http.post(
      urlWeb,
      body: {"code": code},
    ); //awaits response

    // data = data.toString();  // json data converted into string
    // stored in a dynamic list

    dynamic stringList = json.decode(response.body);

    String storedCode = stringList[0].toString();

    debugPrint("Code is: $storedCode");

    changePage(storedCode);
  }

  changePage(String code) {
    if (code.contains("aluminum")) {
      Navigator.of(context).push(_switchToAluminum());
    }
    if (code.contains("plastic")) {
      Navigator.of(context).push(_switchToPlastic());
    } else {
      Navigator.of(context).push(_switchToNotFound());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB6E8C6),
        title: Text(widget.title),

        //Tutorial implementation
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "scan");
            },
            icon: const Icon(Icons.qr_code_scanner),
          ),
        ],

        //Tutorial implementation
      ),
      /*there is an app bar that acts as a divider but because we set up the
     same color as the background we can can't tell the difference
     as a test, hover over the hex code and use another color. 
     */
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //padding to create room
            SizedBox(height: 20),
            Text("Scan item's UPC Code or QR Code"),
            Text("to determine if your item is recycleable"),
            //padding to create room
            SizedBox(height: 100),
            SizedBox(
              height: 100,
              width: 300,
              // row to place two images side by side
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(image: AssetImage('assets/scan.png')),
                  Image(image: AssetImage('assets/bar.png')),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 200,
              width: 320,
              child: MobileScanner(
                controller: MobileScannerController(
                  detectionSpeed: DetectionSpeed.noDuplicates,
                  returnImage: true,
                ),

                //scanner gathers information
                onDetect: (capture) {
                  // list is created to store value
                  final List<Barcode> barcodes = capture.barcodes;
                  var code = barcodes[0].rawValue;
                  // value is printed
                  debugPrint("Value from scan is $code");

                  // insert method to look up code in database

                  searchData(code);

                  // method returns material

                  /* navigator is launched to isolate material
                  // note this is imcomplete code used to reroute to method to
                  stop debugging in console after scan. It will be isolated to
                  its own method later */
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//nesting method to traverse across pages
// imcomplete for now will revisit after completing other methods

Route _switchToAluminum() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Aluminum(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

Route _switchToNotFound() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Notfound(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

Route _switchToPlastic() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Plastic(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

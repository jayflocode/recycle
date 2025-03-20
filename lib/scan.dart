import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:recycle/aluminum.dart';
import 'package:recycle/batteries.dart';
import 'package:recycle/electronics.dart';
import 'package:recycle/glass.dart';
import 'package:recycle/hazardous.dart';
import 'package:recycle/lawn.dart';
import 'package:recycle/not_found.dart';
import 'package:recycle/invalid.dart';
import 'package:recycle/oil.dart';

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
  late MobileScannerController _scannerController;

  @override
  void initState() {
    super.initState();
    _scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }
  /* This is the Area of the Project where you set up the Structure of the
  app.
  */

  // search data method is used to check the upc code against database
  Future searchData(var code) async {
    // removes dashes from barcode since barcodes are stored without them in DB
    code = code.toString().replaceAll("-", "");

    // checks if barcode is only numbers
    if (code.contains(RegExp(r'^[0-9]+$'))) {
      debugPrint("Only numbers Detected");
      /*flutter requires http package to fetch data from the internet
    data is fetch using php
    */
      var urlWeb = Uri.parse('https://recycling.x10.mx/get.php');

      //php file storing get command

      final response = await http.post(
        urlWeb,
        body: {"code": code},
      ); //awaits response

      // json body response which is stored as "dynamic" data type
      //FYI: Source has info on data types https://treeindev.net/article/dart-data-types
      //dynamic is used for json type data, other reasons var is desired
      dynamic stringList = json.decode(response.body);

      // a list is created to access internal methods from List class
      List<String> queryList = [];

      for (int i = 0; i < stringList.length; i++) {
        queryList.add(stringList[i].toString());
      }
      // if query list is empty it means code is not valid
      if (queryList.isEmpty) {
        debugPrint("list is empty");
        changePage(code);
      } else if (queryList.isNotEmpty) {
        code = queryList[0];
        debugPrint("Query: $code");
        changePage(code);
      }
    } else {
      debugPrint("Invalid Code: $code");
      // switch to different page later
      Navigator.of(context).push(_switchToInvalid());
    }
  }

  // change page is a method used to switch to the page

  Future changePage(String material) async {
    //conditional statements after scan to determine material

    if (material.contains("aluminum")) {
      Navigator.of(context).push(_switchToAluminum());
    } else if (material.contains("batteries}")) {
      Navigator.of(context).push(_switchToBattery());
    } else if (material.contains("plastic")) {
      Navigator.of(context).push(_switchToPlastic());
    } else if (material.contains("lawn")) {
      Navigator.of(context).push(_switchToLawn());
    } else if (material.contains("plastic")) {
      Navigator.of(context).push(_switchToPlastic());
    } else if (material.contains("hazardous")) {
      Navigator.of(context).push(_switchToHazardous());
    } else if (material.contains("oil")) {
      Navigator.of(context).push(_switchToOil());
    } else if (material.contains("electronics")) {
      Navigator.of(context).push(_switchToElectronics());
    } else if (material.contains("glass")) {
      Navigator.of(context).push(_switchToGlass());
    }
    // when database has not found the material or does not exist
    else {
      upcCode = material;
      debugPrint("Upc Code: $material");
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
                controller: _scannerController,
                onDetect: (barcodes) async {
                  // list is created to store value
                  final List<Barcode> barCodesCaptured = barcodes.barcodes;
                  String? data;
                  for (final barCode in barCodesCaptured) {
                    if (barCode.rawValue != null) {
                      data = barCode.rawValue;
                    }
                  }
                  // value is printed
                  debugPrint("Value from scan is $data");

                  // insert method to look up code in database --

                  if (data != null) {
                    _scannerController.stop();
                    searchData(data);
                  }

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

Route _switchToOil() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Oil(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

Route _switchToHazardous() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Hazardous(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

//not complete

Route _switchToBattery() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Battery(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

// work in progress

Route _switchToLawn() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Lawn(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

Route _switchToGlass() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Glass(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

Route _switchToElectronics() {
  return PageRouteBuilder(
    pageBuilder:
        (context, animation, secondaryAnimation) => const Electronics(),
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

// switches to another page if the code scanned is invalid
Route _switchToInvalid() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Invalid(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

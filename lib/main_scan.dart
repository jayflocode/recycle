import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:recycle/history_repository.dart';
import 'package:recycle/main_p_routes.dart';
import 'package:recycle/App%20info%20pages/not_found.dart';

// repository to store history of scanned items
final historyRepositoryMain =
    HistoryRepository(); //declaring as global variable

class ScanHomePage extends StatefulWidget {
  const ScanHomePage({super.key, required this.title});

  final String title;

  @override
  State<ScanHomePage> createState() => _ScanHomePageState();
}

class _ScanHomePageState extends State<ScanHomePage> {
  // controller required by the mobile scanner to initiate and store scanning results
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

  // search data method is used to check the upc code against database
  searchData(var code) async {
    var codeWithdash = code;
    // removes dashes from barcode since barcodes are stored without them in DB
    code = code.toString().replaceAll("-", "");

    // checks if barcode is only numbers
    if (code.contains(RegExp(r'^[0-9]+$'))) {
      debugPrint("Only numbers Detected");
      /*flutter requires http package to fetch data from the internet
    data is fetch using php
    */
      var urlWeb = Uri.parse('https://recycling.x10.mx/get.php');

      // passing code variable to body of the request

      final response = await http.post(
        urlWeb,
        body: {"code": code},
      ); //awaits response

      // json body response which is stored as "dynamic" data type

      dynamic stringList = json.decode(response.body);

      // a list is created to access internal methods from List class
      List<String> queryList = [];

      // adding response to the first element of list

      for (int i = 0; i < stringList.length; i++) {
        queryList.add(stringList[i].toString());
      }
      // if query list is empty it means code is not valid
      if (queryList.isEmpty) {
        debugPrint("list is empty");
        changePage(code, codeWithdash);
        //if the response is not empty storing results
      } else if (queryList.isNotEmpty) {
        code = queryList[0];
        debugPrint("Query: $code");
        changePage(code, codeWithdash);
      }
    } else {
      // if the code is not valid
      debugPrint("Invalid Code: $code");
      // switch to different page later
      context.go(Routes.nestedInvalid);
    }
  }

  // method used to route to different pages

  changePage(String material, String code) {
    //conditional statements after scan to determine materia
    if (material.contains("aluminum")) {
      material = 'Aluminum';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedAluminum);
    } else if (material.contains("batteries}")) {
      material = 'Battery';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedBatteries);
    } else if (material.contains("plastic")) {
      material = 'Plastic';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedPlastic);
    } else if (material.contains("lawn")) {
      material = 'lawn';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedLawn);
    } else if (material.contains("hazardous")) {
      material = 'hazardous';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedHazard);
    } else if (material.contains("oil")) {
      material = 'oil';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedOil);
    } else if (material.contains("electronics")) {
      material = 'electronics';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedElectronics);
    } else if (material.contains("glass")) {
      material = 'Glass';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedGlass);
    } else if (material.contains("food")) {
      material = 'food';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedFood);
    } else if (material.contains("tires")) {
      material = 'tires';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedTires);
    } else if (material.contains("paper")) {
      material = 'paper';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedPaper);
    } else if (material.contains("oil")) {
      material = 'oil';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedOil);
    } else if (material.contains("metal")) {
      material = 'metal';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedMetal);
    } else if (material.contains("miscellaneous")) {
      material = 'miscellaneous';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedMiscellaneous);
    } else if (material.contains("paper")) {
      material = 'paper';
      historyRepositoryMain.historyAdd(material, code);
      context.go(Routes.nestedPaper);
    }
    // when database has not found the material or does not exist
    else {
      upcCode = code;

      context.go(Routes.nestedNotFound);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Tutorial implementatio
      /*there is an app bar that acts as a divider but because we set up the
     same color as the background we can can't tell the difference
     as a test, hover over the hex code and use another color. 
     */
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            RichText(
              text: TextSpan(
                text: 'Scan your Product',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: null,
                  fontFamily: null,
                ),
              ),
            ),

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

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<String> searchData(var code) async {
  // removes dashes from barcode since barcodes are stored without them in DB
  code = code.toString().replaceAll("-", "");

  // checks if barcode is only numbers
  if (code.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(code)) {
    return "{Material: error}";
  }

  var urlWeb = Uri.parse('https://recycling.x10.mx/get.php');

  //php file storing get command
  final response = await http.post(
    urlWeb,
    body: {"code": code},
  ); //awaits response

  try {
    // json body response which is stored as "dynamic" data type
    //FYI: Source has info on data types https://treeindev.net/article/dart-data-types
    //dynamic is used for json type data, other reasons var is desired
    dynamic stringList = json.decode(response.body);

    // a list is created to access internal methods from List class
    List<String> queryList = [];

    for (int i = 0; i < stringList.length; i++) {
      queryList.add(stringList[i].toString());
    }

    // check if query list has results
    if (queryList.isEmpty) {
      return "{Material: unknown}";
    }

    var query = queryList[0];

    debugPrint("Query: $query");

    return query;
  } catch (e) {
    debugPrint("Error decoding response: $e");
    return "{Material: error}";
  }
}

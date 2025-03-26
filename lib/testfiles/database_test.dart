import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<String> searchData(var code) async {
  // removes dashes from barcode since barcodes are stored without them in DB
  code = code.toString().replaceAll("-", "");

  // checks if barcode is only numbers

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

  var query = queryList[0];

  debugPrint("Query: $query");

  return query;
}

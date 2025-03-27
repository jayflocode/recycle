import 'package:flutter_test/flutter_test.dart';
import 'package:recycle/testfiles/database_test.dart';

/* this is a scan test to put in upc code and to see expected return type

example codes to try:

123456789004 plastic
75023440004  aluminum

note: response is in json format
  Expected response is based on query:
  SELECT Material from recycle where ID = "Whatever is Scanned";

  So if 123456789004 is scanned the query will look like:
  SELECT Material from recycle where ID = "123456789004";

*/

void main() {
  // this will test for upc code for plastic, this will pass
  test('Search Plastic', () async {
    //variable created to store upc
    var barcodeToTest = '123456789004';

    var material = await searchData(barcodeToTest);

    print("Result from final: $material");

    // replace only portion after Material:
    //
    expect(material, "{Material: plastic}");
  });

  // this will test upc code for aluminum, expected to pass
  test('Search Alunimum', () async {
    //variable created to store upc
    var barcodeToTest = '75023440004';

    var material = await searchData(barcodeToTest);

    print("Result from final: $material");

    // replace only portion after Material:
    //
    expect(material, "{Material: aluminum}");
  });

  // this test will test database when sending letters not numbers
  test('Search Alunimum', () async {
    //variable created to store upc
    var barcodeToTest = 'superman';

    var material = await searchData(barcodeToTest);

    print("Result from final: $material");

    // replace only portion after Material:
    //
    expect(material, "{Material: aluminum}");
  });
}

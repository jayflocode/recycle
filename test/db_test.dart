import 'package:flutter_test/flutter_test.dart';
import 'package:recycle/testfiles/database_test.dart';

/* this is a scan test to put in upc code and to see expected return type

example codes to try:

123456789004 plastic
75023440004  aluminum


*/

void main() {
  test('Search Plastic', () async {
    //variable created to store upc
    var barcodeToTest = '123456789004';

    var material = await searchData(barcodeToTest);

    print("Result from final: $material");

    // replace only portion after Material:
    //
    expect(material, "{Material: plastic}");
  });

  test('Search Alunimum', () async {
    //variable created to store upc
    var barcodeToTest = '75023440004';

    var material = await searchData(barcodeToTest);

    print("Result from final: $material");

    // replace only portion after Material:
    //
    expect(material, "{Material: aluminum}");
  });

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

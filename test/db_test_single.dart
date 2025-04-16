import 'package:flutter_test/flutter_test.dart';
import 'package:recycle/testfiles/database_test.dart';

/* this is a scan test to put in upc code and to see expected return type

Replace "barcodeTotest with the desired upc code
Use this to test single upc codes

This helps with testing of database response without having to scan with 
app!The provided code results in Material Plastic

"
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
}

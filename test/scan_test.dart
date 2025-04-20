import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart'; // Needed for MaterialApp
import 'package:recycle/main_scan.dart';

void main() {
  testWidgets('Scan Method Tests for Scan Widget', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ScanHomePage(title: '')));
  });

  testWidgets('Scan Method Tests for Scan Widget', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ScanHomePage(title: '')));
  });
}

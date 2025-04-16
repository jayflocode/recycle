import 'package:flutter/material.dart';

//navigator bar items stored in data structure for main_nav navigator bar

class Destination {
  const Destination({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

// data structure that holds values for the navigator bar Scan and Help .ex
const destinations = [
  Destination(label: 'Scan', icon: Icons.camera_rear),
  Destination(label: 'Help', icon: Icons.help),
  Destination(label: 'History', icon: Icons.history),
];

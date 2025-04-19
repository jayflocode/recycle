import 'package:flutter/material.dart';
import 'package:recycle/App%20info%20pages/help.dart';
import 'package:recycle/main_scan.dart';

//replace Navigation with Class Type, ex. Navigation w/ Oil, etc

final String mainFont = "AppleGothic";

void main() {
  runApp(const Navigation());
}

//class
class Navigation extends StatelessWidget {
  const Navigation({super.key});
  //color of background
  static const color = Color(0xFFB6E8C6);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'no title',
      theme: ThemeData(
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
        ),
        //sets the background color of the scene completely
        scaffoldBackgroundColor: const Color(0xFFB6E8C6),
        fontFamily: mainFont,
      ),
      //homepage text
      home: const NavigationPage(title: 'Navigation'),
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key, required this.title});

  final String title;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPageIndex = 0;

  final List<Widget> _children = [ScanHomePage(title: ''), Help(title: '')];

  void onTabTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  /* This is the Area of the Project where you set up the Structure of the
  app.
  */
  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.green[100],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.green[100],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.camera_rear),
            icon: Icon(Icons.home_outlined),
            label: 'Scan Items',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.help),
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
      ),
      body: _children[currentPageIndex],
    );
  }
}

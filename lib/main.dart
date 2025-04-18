import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recycle/main_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const Main());
}

String mainFont = "AppleGothic";

//context.go('/details')

//class
class Main extends StatelessWidget {
  const Main({super.key});
  //color of background

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerConfig: router,
    debugShowCheckedModeBanner: false,
    title: 'Recycling Application',
    theme: ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
      ),
      //sets the background color of the scene completely
      scaffoldBackgroundColor: const Color(0xFFB6E8C6),
      fontFamily: mainFont,
      //sets the background color of the scene completely
    ),
  );
}

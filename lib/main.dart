import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recycle/main_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const Main());
}

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
    theme: ThemeData.from(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    ),
  );
}

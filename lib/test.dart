import 'package:flutter/material.dart';

class GreetingController {
  String greeting(hour) {
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}

void main() {
  runApp(MyApp(GreetingController()));
}

class MyApp extends StatelessWidget {
  const MyApp(this.greetingController, {super.key});

  final GreetingController greetingController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Unit Testing Tutorial')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Greets you with respect to time of the day',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Hey, ${greetingController.greeting(DateTime.now().hour)}',
                style: const TextStyle(fontSize: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle/help%20files/navigation.dart';
import 'package:recycle/main_scan.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key, required String title});

  @override
  State<HistoryPage> createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  // page has subscription
  // page has controller

  late StreamSubscription<String> _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = historyRepositoryMain.historyStteam.listen(
      (data) {
        if (historyRepositoryMain.history.length < 21) {
          setState(() {
            debugPrint("List Updated");
          });
        } else {
          debugPrint("List is full");
          debugPrint("Cancelling Subscription");
          _subscription.cancel();
          historyRepositoryMain.closeController();
        }
      },
      onError: (error) {
        debugPrint("it works ");
      },
      onDone: () {
        debugPrint("it works ");
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              SizedBox(
                width: 75.0,
                height: 150.0,
                child: Image(image: AssetImage('assets/recycling.png')),
              ),
              RichText(
                text: TextSpan(
                  text: 'Previous Scan History',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: null,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 400,
                height: 560,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 162, 235, 185),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    ...historyRepositoryMain.history.map(
                      (e) => Text(
                        e,
                        style: GoogleFonts.vollkorn(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

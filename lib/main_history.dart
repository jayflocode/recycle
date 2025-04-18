import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recycle/main_scan.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

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
        if (historyRepositoryMain.history.length <= 15) {
          setState(() {
            debugPrint("List Updated");
          });
        } else {
          debugPrint("List is full");
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
      backgroundColor: const Color(0xFFB6E8C6),
      /*there is an app bar that acts as a divider but because we set up the
     same color as the background we can can't tell the difference
     as a test, hover over the hex code and use another color. 
     */
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: 75.0,
              height: 150.0,
              /*if you are adding a component inside the sized box then
              you must declare it as a child followed by closing comma etc
              */
              child: Image(image: AssetImage('assets/recycling.png')),
            ),
            SizedBox(),
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
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    historyRepositoryMain.history
                        .map(
                          (e) => Text(
                            e,
                            style: TextStyle(fontWeight: null, fontSize: 15),
                            textAlign: TextAlign.right,
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

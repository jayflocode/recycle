import 'dart:async';

import 'package:flutter/material.dart';

final String mainFont = "n/a";
List<String> _history = [];
final StreamController<String> _controller = StreamController<String>();

void historyAdd(String material, String code) {
  if (_controller.isClosed) return;
  print("adding to controller");
  _history.add("Material: $material - UPC Code: $code");
  _controller.add("Material: $material - UPC Code: $code");
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key, required this.title});

  final String title;
  // Changed to List<String> for better type safety

  // print("callback works"); // Removed invalid print statement

  @override
  State<HistoryPage> createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  late StreamSubscription<String> _subscription;

  // historyTestList is created to store the history of the stream

  @override
  void initState() {
    super.initState();

    _subscription = _controller.stream.listen(
      (data) {
        setState(() {
          print("it works");
        });
      },
      onError: (error) {
        print('Error: $error');
      },
      onDone: () {
        print('Stream closed');
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.close();
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
                  fontFamily: mainFont,
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    _history // Use the historyTestList from HistoryRepository
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

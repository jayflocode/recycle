import 'dart:async';
import 'package:flutter/material.dart';

class RealTimeDataPage extends StatefulWidget {
  @override
  _RealTimeDataPageState createState() => _RealTimeDataPageState();
}

class _RealTimeDataPageState extends State<RealTimeDataPage> {
  // controller is created to manage the stream
  final StreamController<String> _controller = StreamController<String>();
  //subcription is created to listen to the stream
  late StreamSubscription<String> _subscription;

  // historyTestList is created to store the history of the stream
  List<String> historyTestList = [];

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

  void addToHistory() {
    String material = "plastic";
    String upc = "123456789012";

    if (historyTestList.length < 5) {
      historyTestList.add("Material: $material - UPC Code: $material");
      _controller.add("Material: $material - UPC Code: $upc");
    } else {
      print("closing connection");
      _controller.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Real-Time Data Example')),
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
                  fontFamily: null,
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    historyTestList
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
            ElevatedButton(onPressed: addToHistory, child: Text('add Array')),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: RealTimeDataPage()));

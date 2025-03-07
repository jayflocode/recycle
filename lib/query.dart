import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Page2 extends StatefulWidget {
  const Page2({super.key});

// class implements changes or returns changes
  @override
  State<Page2> createState() => _Page2State();
}

//constructor class built to extract json data currently not used

class ParseInfo {
  // method only leaves numbers and and removes names, special characters
  String removeNames(List<String> list, String query) {
    String query = "";

    for (int i = 0; i < list.length; i++) {
      list[i] = list[i].replaceAll(RegExp('[^A-Za-z0-9]'), '');
      list[i] = list[i].replaceAll(RegExp('id'), '');
      list[i] = list[i].replaceAll(RegExp('firstName'), ' ');
      list[i] = list[i].replaceAll(RegExp('lastName'), ' ');
      list[i] = list[i].replaceAll(RegExp('lastName'), ' ');
      list[i] = list[i].replaceAll(RegExp('[\\D.]'), ' ');

      query += "${list[i]}\n";
    }
    return query;
  }

  // method removes all special characters,and numbers
  String removeNumbers(List<String> list, String query) {
    String query = "";

    for (int i = 0; i < list.length; i++) {
      list[i] = list[i].replaceAll(RegExp('[^A-Za-z0-9]'), '');
      list[i] = list[i].replaceAll(RegExp('id'), '');
      list[i] = list[i].replaceAll(RegExp('firstName'), ' ');
      list[i] = list[i].replaceAll(RegExp('lastName'), ' ');
      list[i] = list[i].replaceAll(RegExp('lastName'), ' ');
      list[i] = list[i].replaceAll(RegExp("[0-9]"), "");

      query += "${list[i]}\n";
    }
    return query;
  }
}

class _Page2State extends State<Page2> {
  String query = '';
  String query2 = '';
  final nameField = TextEditingController();
  final lastField = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameField.dispose();
    lastField.dispose();
    super.dispose();
  }

  Future remData() async {
    try {
      var urlWeb = Uri.parse('https://sqlfinalproject.000webhostapp.com/deletion.php');
      final response = await http.post(urlWeb, body: {
        "name": nameField.text,
        "last": lastField.text,
      });

      if (response.body.isNotEmpty) {
        var encodeFirst = json.encode(response.body);
        var data = json.decode(encodeFirst);
        print(data);
      } else {
        print("Insert is Empty");
      }
    } catch (e) {
      print(e);
    }
  }

  recallDelete() async {
    remData();
    nameField.clear();
    lastField.clear();

    Future.delayed(const Duration(milliseconds: 500), () {
      queryDB();
      // Do something
    });
  }

  recallPost() async {
    postData();
    nameField.clear();
    lastField.clear();

    Future.delayed(const Duration(milliseconds: 500), () {
      queryDB();
      // Do something
    });
  }

  postData() async {
    try {
      var urlWeb = Uri.parse('https://sqlfinalproject.000webhostapp.com/insert.php');
      final response =
          await http.post(urlWeb, body: {"name": nameField.text, "last": lastField.text});

      if (response.body.isNotEmpty) {
        var encodeFirst = json.encode(response.body);
        var data = json.decode(encodeFirst);
        print(encodeFirst);
        print(data);
        //var data = json.decode(encodeFirst);

        //print(data)
      }
    } catch (e) {
      print(e);
    }
  }

  Future queryDB() async {
    //method calls to retrieve data from sql database

    nameField.clear();
    lastField.clear();

    setState(() {
      query = ""; //removes from search
    });

    setState(() {
      query2 = "";
    });

    String urlWeb =
        'https://sqlfinalproject.000webhostapp.com/get.php'; //php file storing get command

    final Uri url = Uri.parse(urlWeb); // assigns to uri object for parsing purposes

    http.Response response = await http.get(url); //awaits response

    // data = data.toString();  // json data converted into string
    dynamic stringList = json.decode(response.body);

    List<String> list = [];
    List<String> list2 = [];

    for (int i = 0; i < stringList.length; i++) {
      list.add(stringList[i].toString());
      list2.add(stringList[i].toString());
    }

    var remove = ParseInfo(); //class created for removing data from JSON

    setState(() {
      query = remove.removeNames(list, query);
      query2 = remove.removeNumbers(list2, query2);
    });
  }

  // using a textbox set up aligned with one column and multiple rows
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQL Database"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(
              //sized boxed used to space out areas of the page

              ),
          ElevatedButton(
              // elevated buttons calls upon a method and a triggers two set states
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: queryDB,
              child: const Text("Query Full Database")),
          const SizedBox(
            //sized boxed used to space out areas of the page
            height: 20,
          ),
          SizedBox(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: nameField,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                    constraints: BoxConstraints.tightFor(width: 125),
                    border: UnderlineInputBorder(),
                    labelText: "Enter First Name",
                    labelStyle: TextStyle(fontSize: 12),
                    alignLabelWithHint: true),
              ),
              TextField(
                controller: lastField,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                    constraints: BoxConstraints.tightFor(width: 125),
                    border: UnderlineInputBorder(),
                    labelText: "Enter Last Name",
                    labelStyle: TextStyle(fontSize: 12),
                    alignLabelWithHint: true),
              ),
              SizedBox(
                //text button size
                height: 35,
                width: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: recallPost,
                  child: const Text("Insert", style: TextStyle(fontSize: 10)),
                ),
              ),
              SizedBox(
                  height: 35,
                  width: 65,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: recallDelete,
                      child: const Text("Delete", style: TextStyle(fontSize: 10))))
            ],
          )),
          const SizedBox(
            child: Row(
              //titles for the database id, first, and last
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  //adjusting the height controls the space in between the query results
                  height: 25,
                  width: 50,
                  child: Text("ID", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 25,
                  width: 150,
                  child: Text("Employee", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 150,
                ),
              ],
            ),
          ),
          SizedBox(
            // new row displaying the results
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    query,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    query2,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  width: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

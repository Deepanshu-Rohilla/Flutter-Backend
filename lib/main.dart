import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String url = "https://swapi.co/api/people";
  List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: unnecessary_statements
    this.getJsonData;
  }
  Future<String> getJsonData() async{
    var response = await http.get(
      // Encode the url
        Uri.encodeFull(url),
//        accept the JSON response
        headers: {"Accept": "application/json"}
    );


    setState(() {
      var convertDataToJson = Json.Decode(response.body);
      data = convertDataToJson['results'];
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve data via HTTP Get'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      child: Text('Hello'),
                      padding: EdgeInsets.all(20.0),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

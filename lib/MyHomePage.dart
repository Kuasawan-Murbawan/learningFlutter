import 'package:flutter/material.dart';
import 'TextInputWidget.dart';

class MyHomePage extends StatefulWidget {
  final String name;
  MyHomePage(this.name);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textMessage = ""; // create a variable to store the text

  void changeText(String text) {
    setState(() {
      textMessage = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello from Appbar!")),
      body: Column(
        children: <Widget>[
          TextInputWidget(changeText),
          Text(this.textMessage),
          Text(widget.name)
        ],
      ),
    );
  }
}

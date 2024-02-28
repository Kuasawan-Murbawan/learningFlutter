import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  // This is the entry point to the app (run this first)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Husyairi App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
        children: <Widget>[TextInputWidget(changeText), Text(this.textMessage)],
      ),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  final Function(String) callback; // create a callback function

  TextInputWidget(this.callback);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller =
      TextEditingController(); // use the controller to get the text

  @override
  void dispose() {
    // delete the widget when this is done
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.message),
          labelText: "Type a message",
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            splashColor: Colors.deepOrange,
            onPressed: click,
          )),
    );
  }
}

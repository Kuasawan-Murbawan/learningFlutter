import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello from Appbar!")),
      body: TextInputWidget(),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller =
      TextEditingController(); // use the controller to get the text
  String textMessage = ""; // create a variable to store the text

  @override
  void dispose() {
    // delete the widget when this is done
    super.dispose();
    controller.dispose();
  }

  void changeText(texthere) {
    setState(() {
      if (texthere == 'husay') {
        controller.clear();
        this.textMessage = "You are not allowed to type this word";
      }
      // update the UI with the new value
      this.textMessage =
          texthere; // change the textMessage to the text inside the input
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: controller,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.message), labelText: "Type a message"),
        onChanged: (text) => changeText(
            text), // pass the text inside this inputtext to a function
      ),
      Text(textMessage) // display the textMessage
    ]);
  }
}

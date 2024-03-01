import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback; // create a callback function

  TextInputWidget(this.callback,
      {required Null Function(dynamic text) onChanged});

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

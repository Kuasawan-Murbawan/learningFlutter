import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'TextInputWidget.dart';

class MyHomePage extends StatefulWidget {
  final String name;
  final Position position;
  MyHomePage(this.name, this.position);

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

  void openMaps() async {
    // specifies the latitude and longitude of the location
    // for the Google Maps URL
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${widget.position.latitude},${widget.position.longitude}';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello from Appbar!")),
      body: Column(
        children: <Widget>[
          TextInputWidget(changeText),
          Text(this.textMessage), // display the input text
          Text(widget.name), // display the name
          Text(
              widget.position.toString()), // display the lat and long in string
          ElevatedButton(
            onPressed: openMaps,
            child: const Text('Open in Google Maps'),
          ),
        ],
      ),
    );
  }
}

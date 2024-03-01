import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'TextInputWidget.dart';

class MyHomePage extends StatefulWidget {
  final String name;
  MyHomePage(this.name);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textMessage = ""; // create a variable to store the text
  // ignore: prefer_const_constructors
  late Position userPosition = Position(
    longitude: 0,
    latitude: 0,
    accuracy: 0,
    altitude: 0,
    altitudeAccuracy: 0,
    heading: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
    timestamp: DateTime.now(),
  );

  void changeText(String text) {
    setState(() {
      textMessage = text;
    });
  }

  void openMaps() async {
    // specifies the latitude and longitude of the location
    // for the Google Maps URL
    String googleUrl = "google.com";
    //'https://www.google.com/maps/search/?api=1&query=${widget.position.latitude},${widget.position.longitude}';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userPosition = position;
    print(userPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello from Appbar!")),
      body: Column(
        children: <Widget>[
          TextInputWidget(changeText),
          Text(textMessage), // display the input text
          Text(widget.name), // display the name
          Text(userPosition.toString()), // display the lat and long in string
          ElevatedButton(
            onPressed: openMaps,
            child: const Text('Open in Google Maps'),
          ),
          ElevatedButton(
              onPressed: getLocation, child: const Text('Get Location'))
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final List<String> items = List<String>.generate(50, (i) => "$i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Hello ${Get.arguments} !'),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/camera');
                },
                child: const Text('Open Camera'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/scrollTask');
                  },
                  child: Text('Scrollin')),
            ]),
      ),
    );
  }
}

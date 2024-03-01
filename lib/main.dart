import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_comparison/about.dart';
import 'package:price_comparison/login.dart';
import 'package:price_comparison/unknownRoute.dart';

void main() {
  // This is the entry point to the app (run this first)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Husyairi App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      unknownRoute:
          GetPage(name: '/notfound', page: () => const UnknownRoutePage()),
      getPages: [
        GetPage(
            name: '/about',
            page: () => const About(),
            transition: Transition.downToUp),
      ],
      home: LoginPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_comparison/login.dart';
import 'package:price_comparison/routes.dart';
import 'package:price_comparison/unknownRoute.dart';

void main() {
  // This is the entry point to the app (run this first)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Husyairi App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange),
      ),
      unknownRoute:
          GetPage(name: '/notfound', page: () => const UnknownRoutePage()),
      getPages: appRoutes,
      home: LoginPage(),
    );
  }
}

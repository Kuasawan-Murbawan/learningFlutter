// routes.dart
import 'package:get/get.dart';
import 'package:price_comparison/MyHomePage.dart';
import 'package:price_comparison/about.dart';
import 'package:price_comparison/camera.dart';
import 'package:price_comparison/scrollTask.dart';

List<GetPage> appRoutes = [
  GetPage(
      name: '/about',
      page: () => const About(),
      transition: Transition.downToUp),
  GetPage(name: '/camera', page: () => const CameraApp()),
  GetPage(name: '/home', page: () => MyHomePage()),
  GetPage(name: '/scrollTask', page: () => ScrollTask()),
];

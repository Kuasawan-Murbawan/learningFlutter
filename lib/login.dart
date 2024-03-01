import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:price_comparison/MyHomePage.dart';
import 'package:price_comparison/about.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Login Page')), body: Body());
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = "";

  TextEditingController nameController = TextEditingController();

  Future<void> click() async {
    name = nameController.text;

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage(name)));
  }

  void aboutBtn() {
    //Navigator.push(context, MaterialPageRoute(builder: (context) => About())); // This is the old way of navigating to another page
    //Get.to(const About()); // This is the new way of navigating to another page
    name = nameController.text;
    Get.toNamed('/about', arguments: name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: "Enter your name",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Colors.green),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.done),
                      splashColor: Colors.deepOrange,
                      onPressed: click,
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: aboutBtn, child: const Text('About')),
            ],
          ),
        ),
      ),
    );
  }
}

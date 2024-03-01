import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:price_comparison/MyHomePage.dart';

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
    if (nameController.text.isEmpty) {
      Get.dialog(AlertDialog(
        title: const Text('Invalid Input'),
        content: const Text('Please enter your name!'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ));
    } else {
      name = nameController.text;
      showGreetingsToast();
      Get.toNamed('/home', arguments: name);
    }
  }

  void showGreetingsToast() {
    Get.snackbar(
      'Login Succesful',
      "Welcome $name !",
      isDismissible: true,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 20.0,
      backgroundColor: Colors.greenAccent,
    );
  }

  void aboutBtn() {
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

import 'package:flutter/material.dart';
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
  late String name;
  TextEditingController controller = TextEditingController();

  void click() {
    name = controller.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(this.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  labelText: "Enter your name",
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Colors.green)),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.done),
                    splashColor: Colors.deepOrange,
                    onPressed: click,
                  )))),
    );
  }
}

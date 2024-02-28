import 'package:flutter/material.dart';
import 'package:price_comparison/MyHomePage.dart';
import 'package:geolocator/geolocator.dart';

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
  late Position userPosition;

  TextEditingController controller = TextEditingController();

  Future<void> click() async {
    name = controller.text;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(this.name, this.userPosition)));
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
    print(position);
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
                  controller: controller,
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
              SizedBox(
                  width: 10), // Add some space between TextField and Button
              ElevatedButton(
                  onPressed: getLocation, child: const Text('Get Location'))
            ],
          ),
        ),
      ),
    );
  }
}

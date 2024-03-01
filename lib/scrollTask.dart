import 'package:flutter/material.dart';

class ScrollTask extends StatefulWidget {
  const ScrollTask({super.key});

  @override
  State<ScrollTask> createState() => _ScrollTaskState();
}

class _ScrollTaskState extends State<ScrollTask> {
  final List<String> items = List<String>.generate(50, (i) => "$i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Task'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text("Method 1: ListView.builder()"),
            // Container(
            //   height: 300,
            //   width: 400,
            //   color: Colors.amber,
            //   child: ListView.builder(
            //     itemCount: items.length,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         color: index % 2 == 0 ? Colors.red : Colors.green,
            //         height: 50,
            //         child: ListTile(title: Text('Item: ${items[index]}')),
            //       );
            //     },
            //   ),
            // ),
            const Text("Method 2: ListView.builder() scroll horizontally"),
            Container(
              height: 300,
              width: 400,
              padding: const EdgeInsets.all(10),
              color: Colors.blue,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: index % 2 == 0 ? Colors.red : Colors.green,
                    width: 100,
                    child: ListTile(title: Text('Item: ${items[index]}')),
                  );
                },
              ),
            ),
            SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  for (int i = 1; i < 50; i++)
                    Container(
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(8),
                      color: i % 2 == 0 ? Colors.red : Colors.green,
                      child: Text('Item: $i'),
                    ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (int i = 1; i < 50; i++)
                    Container(
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(8),
                      color: i % 2 == 0 ? Colors.red : Colors.green,
                      child: Text('Item: $i'),
                    ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.amber,
                margin: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      for (int i = 1; i < 50; i++)
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(8),
                          color: i % 2 == 0 ? Colors.red : Colors.green,
                          child: Text('Item: $i'),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            backgroundColor: Colors.deepPurple[300],
            appBar: AppBar(),
            body: GestureDetector(
              onTap: () {
                setState(() {
                  value == 0 ? value = 1 : value = 0;
                });
              },
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 50,
                    color: Colors.deepPurple[500],
                  ),
                ],
              ),
            )),
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.0, end: value),
            duration: Duration(milliseconds: 500),
            builder: (_, double value, __) {
              return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * value)
                    ..rotateY((pi / 6) * value),
                  child: Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                        onPressed: () {
                          setState(() {
                            value == 0.0 ? value = 1 : value = 0;
                          });
                        },
                        icon: Icon(Icons.menu),
                      ),
                    ),
                    body: Container(
                      height: 1000,
                      width: 500,
                      color: Colors.purple,
                    ),
                  ));
            }),
      ],
    );
  }
}

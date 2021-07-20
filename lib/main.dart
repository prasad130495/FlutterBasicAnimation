import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

//import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double percentage = 0;

  String message = "Loading...";

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    controller.forward();
    controller.addListener(() {
      setState(() {
        //print(controller.value);
        percentage = 100 * controller.value.toDouble();
        if (controller.isCompleted) {
          message = "Welcome to the App!";

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //Animation to go here
                height:250,
                width:250,
                child: LiquidCircularProgressIndicator(
                  value: controller.value, // Defaults to 0.5.
                  valueColor: AlwaysStoppedAnimation(Colors.blue), // Defaults to the current Theme's accentColor.
                  backgroundColor: Colors.lightBlue[200], // Defaults to the current Theme's backgroundColor.
                  borderColor: Colors.blue[800],
                  borderWidth: 5.0,
                  direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                  center: Text("${percentage.toStringAsFixed(0)}%"),
                  )

              ),
              SizedBox(height: 25),
              Text(
                message,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Helvetica',
                  color: Colors.blue[800],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

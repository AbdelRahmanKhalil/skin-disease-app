import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'capture.dart';

class Warning extends StatelessWidget {
  Warning();

  void goToLogin(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed("/capture");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("DiagnoseMe")),
        body: Container(
            child: Column(children: [
          Text(
            "Warning: this app gives you a speculation that should not be taken as an official diagnosis. You must always go to your physician if you feel unwell ",
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              onPressed: () async {
                await availableCameras().then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CaptureScreen(value),
                    ),
                  ),
                );
              },
              child: Text("Okay")),
        ])));
  }
}

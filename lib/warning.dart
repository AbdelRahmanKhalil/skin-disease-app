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
        body:  Container(  width: double.infinity,
        height: 2000,child: Center(  child: Container(margin: EdgeInsets.all(20.0), height:500,
            child:  Column(children: [
              Text("Warning",textAlign: TextAlign.center,style: TextStyle(fontSize: 30, ),),
              SizedBox(
                
                height: 20,
              ),
          Text(
            "This app gives you a speculation that should not be taken as an official diagnosis. You must always visit your physician if you feel unwell or suspect a skin lesion ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
                
                height: 50,
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
              child: Text("Okay",)),
        ]),
        
        ))));
  }
}

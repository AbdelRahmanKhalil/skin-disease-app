import 'dart:async';

import 'package:flutter/material.dart';

class Warning extends StatelessWidget {

  Warning();

  void goToLogin(BuildContext ctx){
      Navigator.of(ctx).pushReplacementNamed("/login");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("DiagnoseMe")
      ),
      body: Container(
        child: Column(
          children: [Text("Warning: this app gives you a speculation that should not be taken as an official diagnosis. You must always go to your physician if you feel unwell ",
          textAlign: TextAlign.center ,),
          ElevatedButton(onPressed: () => goToLogin(context), child: Text("Okay")),]
        )
      )
    );
  }
}
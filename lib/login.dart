import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  
  Login();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DiagnoseMe"),),
      body: Container(
        child: Column(children: [
          Text("Email")
        ]),
      ),
      
    );
  }
}
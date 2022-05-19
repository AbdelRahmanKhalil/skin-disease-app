import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  Result();
  var received_args;
  var result;
  var index;
  var label;
  var confidence;
  bool error=false;
void retrieveArgs(BuildContext context){
  try{
    received_args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var result = received_args['result'];
    var index = result?[0]['index'];
    var label = result?[0]['label'];
    var confidence= result?[0]['confidence'];
  }    
  catch(_){
    error=true;
  }
}
  @override
  Widget build(BuildContext context) {
    retrieveArgs(context);
    print("result page");
    print(result);
    return Scaffold(
       appBar: AppBar(
        title:Text("Capture Screen") ,
     // child: Text("Hi"),
    ),
    body: error?Center(child:Column(children: <Widget>[Text("Failed to classify"),ElevatedButton(onPressed: (){Navigator.of(context).pushReplacementNamed('/');}, child: Text("Return Home"))],),):Center(
    child: Column(children: <Widget>[
      Row(
        children: <Widget>[Text(label),Text(confidence.toString())],mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      ElevatedButton(onPressed: (){
        Navigator.of(context).pushReplacementNamed("/",
    );}, child: Text("Retry"))
    ]
    )
    ,),
    );
  }
}
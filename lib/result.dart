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
    print("printing received args in try (result pge)");
    print(received_args);   
    result = received_args['result'];
    print(result);
    index = result?[0]['index'];
    label = result?[0]['label'];
    confidence= result?[0]['confidence'];
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
        title:Text("Result") ,
     // child: Text("Hi"),
    ),
    body: error?Center(child:Column(children: <Widget>[SizedBox(height: 100,),Text("Failed to classify",style: TextStyle(fontSize: 30, ),),SizedBox(height: 200,),ElevatedButton(onPressed: (){Navigator.of(context).pushReplacementNamed('/');}, child: Text("Return Home"))],),):Center(
    child: Column(children: <Widget>[SizedBox(height: 100,), 
      Row(
        children: <Widget>[Text(label,style: TextStyle(fontSize: 30, ),),],mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      SizedBox(height: 30,),
      Text("Confidence: "+(confidence.toDouble()*100).toStringAsPrecision(3) .toString()+ "%",style: TextStyle(fontSize: 30, ),),
      SizedBox(height: 200,),
      ElevatedButton(onPressed: (){
        Navigator.of(context).pushReplacementNamed("/",
    );}, child: Text("Retry"))
    ]
    )
    ,),
    );
  }
}
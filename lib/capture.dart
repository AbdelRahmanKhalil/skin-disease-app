import 'dart:io';
import 'package:skin_disease/skinclassifier.dart';
import 'package:tflite/tflite.dart';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:image_picker/image_picker.dart';

class CaptureScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;
  CaptureScreen(this.cameras);


  void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(
      '/',
    );
  }
  @override
  _CaptureScreenState createState() => _CaptureScreenState();
}
class _CaptureScreenState extends State<CaptureScreen>{
  @override
  late CameraController controller;
  XFile? pictureFile;
  var taken = false;
  skinClassifier classifier=skinClassifier();
  var _result;
  var wait;
  bool _isLoading=false;
  
  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }


  Future<void> pickImage()
  async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    setState(() {
      pictureFile=XFile(image.path);
      taken=true;

    });
  }
  void goToResult(BuildContext ctx) {
    print("Going to result with");
    print(_result);
    Navigator.of(ctx).pushReplacementNamed("/result",arguments: {
      'result':_result
    });
  }
   classify(File image)async{
    wait = await classifier.classifyImage(image);
    setState(() {
      _result=wait;
    });
  
  }
  void submit(File image, BuildContext ctx)async{
    setState(() {
      _isLoading=true;
    });

   await classify(image);
       setState(() {
      _isLoading=false;
    });

    goToResult(ctx);
  }

Padding picTaken()
{
  if(taken==false) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child:  CameraPreview(controller),
        height: 600 ,
      ),
    );
  }
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:  Container(
      alignment: Alignment.center,
      child: Image.file(
      File(pictureFile!.path),
      height: 600 ,
    ),)
  );
}
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title:Text("Capture Screen") ,
      ),
      body: _isLoading?Center(child: CircularProgressIndicator(),): Column(
        children: [
          picTaken(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              ElevatedButton(
              onPressed: () async {
                pictureFile = await controller.takePicture();
                taken=true;
                setState(() {});
              },
              child: const Text('Capture Image'),
            ),
            ElevatedButton(onPressed:taken?(){submit(File(pictureFile!.path), context);} : null , child: Text("Submit")),
              ElevatedButton(onPressed:(){pickImage();}
                  , child: Text("Pick Image"))
            ]
          ),
          //Android/iOS
          // Image.file(File(pictureFile!.path)))
        ],
      ),
    );
  }
}

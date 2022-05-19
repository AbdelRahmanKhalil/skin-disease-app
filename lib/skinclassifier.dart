import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:flutter/widgets.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:io' as io;

import 'package:file_picker/file_picker.dart';

class skinClassifier{
  skinClassifier();

 Future<dynamic> classifyImage(File image) async {
    await Tflite.loadModel(
      model: "assets/yourmodel.tflite",
      labels: "assets/labels_skin.txt",
    );
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 23,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print("fiinished classifying");
    //print(output?[0]['index']);
    print(output);
    return output;
  }
}
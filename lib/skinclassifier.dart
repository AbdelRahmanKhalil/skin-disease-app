import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:flutter/widgets.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:io' as io;

import 'package:file_picker/file_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
class skinClassifier{
  skinClassifier();

 Future<dynamic> classifyImage(File image) async {
  ImageProperties properties = await FlutterNativeImage.getImageProperties(image.path);
  File resized = await FlutterNativeImage.compressImage(image.path, quality: 80,
    targetWidth: 180, targetHeight: 180);
    await Tflite.loadModel(
      model: "assets/yourmodel.tflite",
      labels: "assets/labels_skin2.txt",
    );
    var output = await Tflite.runModelOnImage(
      path: resized.path,
      numResults: 8,
      threshold: 0.5,
    );
    print("fiinished classifying");
    //print(output?[0]['index']);
    print(output);
    return output;
  }
}
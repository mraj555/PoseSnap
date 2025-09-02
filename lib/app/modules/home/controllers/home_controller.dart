import 'dart:developer' as d;
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_next/tflite_next.dart';

class HomeController extends GetxController {
  File? image;

  RxBool selection = false.obs;
  double image_height = 0.0;
  double image_width = 0.0;
  final ImagePicker _picker = ImagePicker();

  List recognitions = [];

  @override
  void onInit() {
    super.onInit();
    onLoadModel();
  }

  ///Functionality For Load Posenet TFlite Model
  Future<void> onLoadModel() async {
    TfliteNext.close();
    try {
      String? res;
      res = await TfliteNext.loadModel(model: "assets/model/posenet_mv1_075_float_from_checkpoints.tflite");
    } on PlatformException {
      d.log("Failed to load model.", name: "Load Model");
    }
  }

  ///Functionality for Predict Image
  onPredictImage(File? image) async {
    if (image == null) return;
    onPosenet(image);

    FileImage(image)
        .resolve(ImageConfiguration())
        .addListener(
          ImageStreamListener((info, _) {
            image_height = info.image.height.toDouble();
            image_width = info.image.width.toDouble();
            this.image = image;
            //
            // onPosenet(image);
            update();
          }),
        );
  }

  ///Functionality for Posenet Model Data
  onPosenet(File image) async {
    int start_time = DateTime.now().millisecondsSinceEpoch;
    List<dynamic>? recognitions = await TfliteNext.runPoseNetOnImage(path: image.path, numResults: 2);

    d.log("$recognitions", name: "Recognitions");

    this.recognitions = recognitions ?? [];
    int end_time = DateTime.now().millisecondsSinceEpoch;
    d.log("Inference took ${end_time - start_time}", name: "Recognitions");
    update();
  }

  ///Functionality For Pick Image From Gallery or Capture from Camera
  onPickImage(ImageSource source) async {
    XFile? _image = await _picker.pickImage(source: source);

    if (_image != null) {
      image = File(_image.path);
      onPredictImage(image);
    }
    update();
  }

  ///Functionality for Draw Points
  List<Widget> onRenderKeyPoints(Size screen) {
    d.log("Rendering keypoints - Image: ${image_width}x${image_height}, Screen: ${screen.width}x${screen.height}, Recognitions: ${recognitions.length}");

    if (image_height == 0.0 || image_width == 0.0 || recognitions.isEmpty) {
      d.log("Skipping render - missing data");
      return <Widget>[];
    }

    double factorX = screen.width;
    double factorY = image_height / image_width * screen.width;

    List<Widget> lists = <Widget>[];

    for (var element in recognitions) {
      Color color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withValues(alpha: 1.0);

      List<Widget> list = element["keypoints"].values.map<Widget>((e) {
        return Positioned(
          left: e["x"] * factorX - 6.sp,
          top: e["y"] * factorY - 6.sp,
          width: 100,
          height: 12,
          child: Text(
            "● ${e["part"]}",
            style: TextStyle(color: color, fontSize: 12.sp, fontWeight: FontWeight.w700),
          ),
        );
      }).toList();

      lists.addAll(list);
    }

    return lists;
  }
}

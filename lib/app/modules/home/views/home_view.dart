import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.only(top: 50.h),
          color: Colors.black,
          child: GetBuilder<HomeController>(
            init: controller,
            builder: (_) {
              return Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    width: Get.width,
                    child: controller.image == null
                        ? Center(
                            child: Container(
                              margin: EdgeInsets.only(top: Get.height / 3 - 140),
                              child: Icon(Icons.image, color: Colors.white, size: 100.sp),
                            ),
                          )
                        : Image.file(controller.image!),
                  ),

                  ...controller.onRenderKeyPoints(Get.size),

                  Container(
                    height: Get.height,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ///Camera
                          IconButton(
                            onPressed: () => controller.onPickImage(ImageSource.camera),
                            icon: Icon(Icons.camera, color: Colors.black),
                            color: Colors.white,
                          ),

                          ///Gallery
                          IconButton(
                            onPressed: () => controller.onPickImage(ImageSource.gallery),
                            icon: Icon(Icons.image, color: Colors.black),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

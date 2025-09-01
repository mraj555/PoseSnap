import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(Get.width, Get.height),
      child: GetMaterialApp(title: "PoseSnap", initialRoute: AppPages.INITIAL, getPages: AppPages.routes),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(
    ScreenUtilInit(
      designSize: Size(392.73, 738.18),
      child: GetMaterialApp(title: "PoseSnap", debugShowCheckedModeBanner: false, initialRoute: AppPages.INITIAL, getPages: AppPages.routes),
    ),
  );
}

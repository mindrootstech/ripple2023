// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'helper/routes/app_pages.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    GetMaterialApp(
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

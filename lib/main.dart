// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'helper/routes/AppPages.dart';
import 'helper/service/GlobalService.dart';

Future<void> initServices() async {
  await Get.putAsync(() => GlobalServices().init());
  return;
}

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
 await  initServices();
  runApp(
    GetMaterialApp(
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

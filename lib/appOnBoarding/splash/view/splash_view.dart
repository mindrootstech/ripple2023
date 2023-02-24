import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import '../../../helper/routes/AppRoutes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  /// Similar to **Navigation.pushReplacement**
  Future<dynamic> off(dynamic page, {dynamic arguments}) async {
    Get.off(
      page,
      arguments: arguments,
      transition: Transition.leftToRight,
      duration: const Duration(milliseconds: 250),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Get.width,
          color: ColorRes.appColor,
          height:Get.height,
          // child: SvgPicture.asset(CommonUi1.setSvgImage("logo"),allowDrawingOutsideViewBox: true,).paddingOnly(left: 38,right: 38),
          child: Image.asset(CommonUi.setPngImage("splash_logo"),fit: BoxFit.contain,width: Get.width),
        ),
      ),
    );
  }
  @override
  initState()  {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      Get.offAndToNamed(AppRoutes.onBoard);
    });

  }
}


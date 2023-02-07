import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController{
  var skipText = "SKIP".obs;
  var pageController = PageController().obs;
  var pageNo = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

  }

}
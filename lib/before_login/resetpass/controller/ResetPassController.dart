import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPassController extends GetxController{
  var currentVisible = false.obs;
  var confirmVisible = false.obs;
  var currentField = TextEditingController();
  var confirmField = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();

  }

}
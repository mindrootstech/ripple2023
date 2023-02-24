import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.transparent ,
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.black12,
          child: const Center(child: CircularProgressIndicator()),
        ));
  }
}

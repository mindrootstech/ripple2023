
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/constants/CommonUi.dart';
import '../../myProfile/controller/MyProfileController.dart';

class ChooseCameraSheets{
  var controller = Get.find<MyProfileController>();

  void showSheet(){
    Get.bottomSheet(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(
                'Take a picture from Camera',
                style: CommonUi.customTextStyle(),
              ),
              onTap: () {
                controller.getCameraImage();
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: Text(
                'Select from Phone Gallery',
                style: CommonUi.customTextStyle(),
              ),
              onTap: () {
                controller.getGalleryImage();
                Get.back();
              },
            ),
            SizedBox(
              height: 20,
            )

          ],
        ),
        backgroundColor: Colors.white);
  }

}
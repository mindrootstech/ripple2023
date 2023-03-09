import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/myProfile/controller/MyProfileController.dart';
import '../constants/strings.dart';


class DeleteAccDialog {
  final controller =Get.find<MyProfileController>();

  showDialog() {
    Get.defaultDialog(
      barrierDismissible: false,
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      backgroundColor: Colors.white,
      content: Container(
        width:Get.width,
        margin:  EdgeInsets.only(left: CommonUi.marginLeftRight, right: CommonUi.marginLeftRight),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(Strings.textDeleteAccDesc,
                    textAlign: TextAlign.center,
                    style: CommonUi.customTextStyle()),
                Container(
                  height: 50,
                  width: Get.width,
                  margin:  EdgeInsets.only(top:40,left: CommonUi.marginLeftRight, right: CommonUi.marginLeftRight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: CommonUi.customButtonSmall(buttonText: Strings.textCancel,padding: 10.0,fontSize: 14.0,
                              callBack: (){
                                Get.back();
                              }),
                        ),
                      ),


                      const SizedBox(width: 15,),
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: CommonUi.customButtonSmall(buttonText: Strings.textYes,padding: 10.0,fontSize: 14.0,
                              callBack: (){
                                Get.back();
                                controller.deleteAccountImplementation();
                              }),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
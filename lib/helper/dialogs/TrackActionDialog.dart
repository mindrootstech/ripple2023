import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';

import '../constants/ColorRes.dart';
import '../constants/fonts.dart';
import '../constants/strings.dart';


class TrackActionDialog {
  showDialog() {
    Get.defaultDialog(
      barrierDismissible: false,
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      backgroundColor: Colors.white,
      content: Container(
        width:Get.width,
        margin:  EdgeInsets.only(left: CommonUi.marginLeftRight, right: CommonUi.marginLeftRight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
                child: Text(Strings.textKnowHowTrack,style: CommonUi.customTextStyle(fontFamily: Fonts.semiBold,fontSize: 22))),
            Container(
              margin: EdgeInsets.symmetric( vertical: CommonUi.marginLeftRight),
              height: 1,
              width: Get.width,
              color: ColorRes.noProgressColor,
            ),
            Text(Strings.textOnlineActions,  style: CommonUi.customTextStyle(fontFamily: Fonts.semiBold, fontSize: 20)),
            const SizedBox(
              height: 12,
            ),
            Text(Strings.textOnlineActionsDesc,
                style: CommonUi.customTextStyle(fontFamily: Fonts.regular, fontSize: 17)),
            Container(
              margin: const EdgeInsets.symmetric( vertical: 16),
              height: 1,
              width: Get.width,
              color: ColorRes.noProgressColor,
            ),
            getActionsText("Sed ut mi ut dolor tincidunt condimentum quis id ex."),
            getActionsText("Aliquam at massa laoreet, convallis massa sed, convallis neque."),
            getActionsText("Sed vel massa faucibus, sodales dui rutrum, condimentum dui."),
            Container(
              margin: const EdgeInsets.symmetric( vertical: 16),
              height: 1,
              width: Get.width,
              color: ColorRes.noProgressColor,
            ),
            Text(Strings.textNuncDignissimErosSem,
                style: CommonUi.customTextStyle(fontFamily: Fonts.regular, fontSize: 17)),
            const SizedBox(
              height: 40,
            ),
            CommonUi.customButton(buttonText: Strings.next,padding: 10.0,fontSize: 20.0,
                callBack: (){
                  Get.back();
                }),
          ],
        ),
      ),
    );
  }

 Widget  getActionsText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• ',
            style: CommonUi.customTextStyle(fontFamily: Fonts.regular, fontSize: 20)),
        Expanded(
          child: Text(text,
              style: CommonUi.customTextStyle(fontFamily: Fonts.regular, fontSize: 17)),
        ),
      ],
    );
 }
}


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../helper/constants/ColorRes.dart';
import '../../helper/constants/CommonUi.dart';
import '../../helper/constants/fonts.dart';
import '../../helper/constants/strings.dart';

class FiltersSheet{

  void showSheet(){
    Get.bottomSheet(
      Container(
        margin: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),
        height: Get.height/1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHeaderPart(),
            Row(
              children: [
                Expanded(flex:1,child: filterTypeList()),
                Expanded(flex:2,child: filterValuesList())
              ],
            )

          ],
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      persistent: false,
      enableDrag: false,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only( topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
      ),
    );
  }


  Widget getHeaderPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("Filters", style: CommonUi.customTextStyle(
                fontFamily: Fonts.bold, fontSize: 20,
              )
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Image.asset(CommonUi.setPngImage("close_icon"),height: 30,width: 30),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          height: 1.5,
          width: Get.width,
          color: ColorRes.noProgressColor,
        ),



      ],
    );
  }


}

Widget filterTypeList() {
  return Container(
    height: 50,
    child: ListView.builder(itemCount: 4,
        itemBuilder: (context,builder){
      return Container(
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        child: Text("asdf"),
      );
    }),
  );
}
Widget filterValuesList() {
  return Container(
    height: 50,
    child: ListView.builder(itemCount: 4,
        itemBuilder: (context,builder){
      return Container(
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        child: Text("asdf"),
      );
    }),
  );
}
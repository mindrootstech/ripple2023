import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/fonts.dart';


class PageViewItem extends StatelessWidget {
  String imageName;
  String title;
  String description;

  PageViewItem(this.title,this.description,this.imageName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(CommonUi.setPngImage(imageName),fit: BoxFit.fill,width: Get.width),
        Positioned(
          bottom: 0,
          child: Container(
            height: Get.height/2.1,
            width: Get.width,
            padding: const EdgeInsets.only(top: 25),
            decoration: CommonUi.curvedBoxDecoration(bottomRight: 0.0,bottomLeft: 0.0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CommonUi.customTextStyle(
                        fontSize: 30,
                        fontFamily: Fonts.semiBold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    description,
                    style: CommonUi.customTextStyle(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../helper/constants/ColorRes.dart';
import '../controller/OnBoardController.dart';


class PageViewItem extends StatelessWidget {
  String imageName;
  String title;
  String description;

  PageViewItem(this.title,this.description,this.imageName, {super.key});
  var controller=Get.find<OnboardController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(CommonUi.setPngImage(imageName),fit:Get.height<680? BoxFit.cover:BoxFit.contain,
              width: Get.width),
        ),
        Container(
          width: Get.width,
          padding:  const EdgeInsets.only(bottom: 50,top: 25),
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
                Container(
                  height: 80,
                  child: Text(
                    description,
                    style: CommonUi.customTextStyle(),
                  ),
                ),
              ],
            ),
          ),
        ),
        SmoothPageIndicator(
            controller: controller.pControllers[0],
            count: 4,
            effect:  const SlideEffect(
                spacing: 12,
                dotWidth: 12,
                dotHeight: 12,
                dotColor:
                ColorRes.onboardIndicatorNonActiveColor,
                activeDotColor:
                ColorRes.onboardIndicatorActiveColor),
            onDotClicked: (index) {}),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:ripplefect/before_login/onboard/controller/OnboardController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/colors.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import 'package:ripplefect/helper/routes/app_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../component/PageViewItem.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<OnboardController>(builder: (controller) {
      return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              PageView(
                physics: const ClampingScrollPhysics(),
                onPageChanged: (value) {
                  controller.pageNo.value = value;
                },
                controller: controller.pageController.value,
                children: <Widget>[
                  PageViewItem(Strings.onboard_1Title.tr,
                      Strings.onboard_1Desc.tr, Strings.onboard_1Image),
                  PageViewItem(Strings.onboard_2Title.tr,
                      Strings.onboard_2Desc.tr, Strings.onboard_2Image),
                  PageViewItem(Strings.onboard_3Title, Strings.onboard_3Desc.tr,
                      Strings.onboard_3Image),
                  PageViewItem(Strings.onboard_4Title.tr,
                      Strings.onboard_4Desc.tr, Strings.onboard_4Image),
                ],
              ),
              Positioned(
                bottom: 20,
                left: 28,
                right: 28,
                child: Column(
                  children: [
                    SmoothPageIndicator(
                        controller: controller.pageController.value,
                        count: 4,
                        effect: const SlideEffect(
                            spacing: 12,
                            dotWidth: 12,
                            dotHeight: 12,
                            dotColor:
                            MyColors.onboardIndicatorNonActiveColor,
                            activeDotColor:
                            MyColors.onboardIndicatorActiveColor),
                        onDotClicked: (index) {}),
                    const SizedBox(
                      height: 50,
                    ),
                    CommonUi.customButton(buttonText: controller.pageNo == 3 ? "Continue" : "Next",callBack: () {
                      controller.pageController.value.animateToPage(
                          controller.pageNo.value + 1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                      if(controller.pageNo==3){
                        Get.toNamed(AppRoutes.goal_onboard);
                      }
                    }),
                    GestureDetector(
                      onTap: () {
                        if(controller.pageNo==3){
                          Get.toNamed(AppRoutes.login);
                        }else{
                          Get.toNamed(AppRoutes.goal_onboard);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: controller.pageNo.value == 3
                            ? Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already have an account? ',
                                style: CommonUi.customTextStyle(),
                              ),
                              TextSpan(
                                text: 'Login',
                                style: CommonUi.customTextStyle(
                                    color: MyColors.buttonColor,
                                    decoration:
                                    TextDecoration.underline),
                              ),
                            ],
                          ),
                        )
                            : Text(
                          controller.skipText.value.toUpperCase(),
                          style: CommonUi.customTextStyle(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

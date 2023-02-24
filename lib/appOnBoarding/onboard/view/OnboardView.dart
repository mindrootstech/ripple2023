import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../helper/routes/AppRoutes.dart';
import '../component/PageViewItem.dart';
import '../controller/OnBoardController.dart';

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
                controller: controller.pControllers[0],
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
                        controller: controller.pControllers[0],
                        count: 4,
                        effect: const SlideEffect(
                            spacing: 12,
                            dotWidth: 12,
                            dotHeight: 12,
                            dotColor:
                            ColorRes.onboardIndicatorNonActiveColor,
                            activeDotColor:
                            ColorRes.onboardIndicatorActiveColor),
                        onDotClicked: (index) {}),
                    const SizedBox(
                      height: 50,
                    ),
                    CommonUi.customButton(buttonText: controller.pageNo.value == 3 ? Strings.continueTxt : Strings.next,callBack: () {
                      controller.pControllers[0].animateToPage(
                          controller.pageNo.value + 1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                      if(controller.pageNo.value==3){
                        Get.toNamed(AppRoutes.goalOnBoard);
                      }
                    }),
                    GestureDetector(
                      onTap: () {
                        if(controller.pageNo.value==3){
                          Get.toNamed(AppRoutes.login);
                        }else{
                          Get.toNamed(AppRoutes.completeOnBoard);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: controller.pageNo.value == 3
                            ? Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: Strings.alreadyAccount,
                                style: CommonUi.customTextStyle(),
                              ),
                              TextSpan(
                                text: Strings.login,
                                style: CommonUi.customTextStyle(
                                    color: ColorRes.buttonColor,
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

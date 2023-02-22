import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/appOnBoarding/onboard_2/component/GoalPageItem.dart';
import 'package:ripplefect/appOnBoarding/onboard_2/controller/OnboardGoalController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import '../../../helper/routes/AppRoutes.dart';

class GoalOnboardingView extends StatelessWidget {
  const GoalOnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<OnboardGoalController>(
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              var back = true;
              if(controller.pageNo.value != 1){
                controller.pageNo.value=controller.pageNo.value-2;
                movePage(controller);
                back = false;
              }
              return back;
            },
            child: customLayout(
              title: controller.titles.value[controller.titleNumber.value],
              onBack: (){
                if(controller.pageNo.value != 1){
                  controller.pageNo.value=controller.pageNo.value-2;
                  movePage(controller);
                  return;
                }
                Get.back();

              },
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: 10,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: controller.progressValue.value,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            ColorRes.buttonColor),
                        backgroundColor: ColorRes.noProgressColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (value) {
                        controller.titleNumber.value = value;
                        controller.pageNo.value = value+1;
                      },
                      controller: controller.pageController.value,
                      children: <Widget>[
                        GoalPageItem(1,controller.yourWayList_1),
                        GoalPageItem(2,controller.moreList_2),
                        GoalPageItem(3,controller.goalList_3),
                      ],
                    ),
                  ),


                  const SizedBox(height: 10,),

                  CommonUi.customButton(buttonText:Strings.continueTxt,fontSize:FontSize.font20,callBack: (){
                    movePage(controller);
                    if(controller.titleNumber.value==2){
                      Get.toNamed(AppRoutes.completeOnBoard);
                    }

                  }),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void movePage(OnboardGoalController controller) {
    if(controller.pageNo.value == 0){
      controller.progressValue.value = 0.25;
    }
    if(controller.pageNo.value == 1){
      controller.progressValue.value = 0.50;
    }
    if(controller.pageNo.value == 2){
      controller.progressValue.value = 1.0;
    }
    controller.pageController.value.animateToPage(controller.pageNo.value,
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeIn
    );
  }
}

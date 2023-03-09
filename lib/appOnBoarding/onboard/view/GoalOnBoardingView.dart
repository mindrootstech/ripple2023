import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/appOnBoarding/onboard/component/GoalPageItem.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import '../controller/OnBoardController.dart';

class GoalOnBoardingView extends StatelessWidget {
  const GoalOnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<OnboardController>(
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              var back = true;
              if(controller.goalPageNo.value != 1){
                controller.goalPageNo.value=controller.goalPageNo.value-2;
                movePage(controller);
                back = false;
              }
              return back;
            },
            child: CommonUi.customLayout(
              title: controller.titles.value[controller.titleNumber.value],
              onBack: (){
                if(controller.goalPageNo.value != 1){
                  controller.goalPageNo.value=controller.goalPageNo.value-2;
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
                        controller.goalPageNo.value = value+1;
                      },
                      controller: controller.pControllers[1],
                      children: <Widget>[
                        GoalPageItem(1,controller.list_1),
                        GoalPageItem(2,controller.list_2),
                        GoalPageItem(3,controller.list_3),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void movePage(OnboardController controller) {
    if(controller.goalPageNo.value == 0){
      controller.progressValue.value = 0.25;
    }
    if(controller.goalPageNo.value == 1){
      controller.progressValue.value = 0.50;
    }
    if(controller.goalPageNo.value == 2){
      controller.progressValue.value = 1.0;
    }
   controller.pControllers[1].animateToPage(controller.goalPageNo.value, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }


}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:ripplefect/before_login/onboard_2/component/GoalPageItem.dart';
import 'package:ripplefect/before_login/onboard_2/controller/OnboardGoalController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/colors.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/routes/app_pages.dart';

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
              print("page : ${controller.pageNo.value}");
              if(controller.pageNo.value != 1){
                controller.pageNo.value=controller.pageNo.value-2;
                movePage(controller);
                back = false;
              }
              return back;
            },
            child: CustomLayout(
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
                            MyColors.buttonColor),
                        backgroundColor: MyColors.noProgressColor,
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

                  CommonUi.customButton(buttonText:"Continue",fontSize:FontSize.font20,callBack: (){
                    movePage(controller);
                    if(controller.titleNumber.value==2){
                      Get.toNamed(AppRoutes.complete_onboard);
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
    print(controller.pageNo.value);
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

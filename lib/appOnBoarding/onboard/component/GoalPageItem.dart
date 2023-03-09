import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/appOnBoarding/onboard/controller/OnBoardController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/service/GlobalService.dart';

import '../../../helper/constants/strings.dart';
import '../../../helper/routes/AppRoutes.dart';
import '../model/OnboardModel.dart';


class GoalPageItem extends StatelessWidget {
  var type = 0;
  RxList<Goal> list;

  GoalPageItem(this.type, this.list, {super.key});
  var controller=Get.find<OnboardController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // decoration: CommonUi.roundedDecorationWithBorder(
            //     outLineColor: ColorRes.noProgressColor,
            //     bgColor: Colors.white,
            //     borderWidth:1.5 ,
            //     radius: 8.0
            // ),
            margin: const EdgeInsets.only(top: 24,bottom: 40),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                var model = list[index];
                return InkWell(
                  onTap: () {
                    controller.selectedIndex.value=index;
                    if(type != 2){
                      for (int i = 0; i < list.length; i++) {
                        list[i].isSelected.value = false;
                      }
                    }
                    model.isSelected.value =  !model.isSelected.value;
                  },
                  child: Obx(() {
                    return Container(
                      decoration:
                            model.isSelected.value && index == 0
                          ? CommonUi.roundedDecorationWithBorderRadius(
                          outLineColor: ColorRes.bluecolor,
                          bgColor: ColorRes.lightBluecolor,
                          topLeft: 8.0,
                          topRight: 8.0,
                          borderWidth: 1.0 //top
                      )
                          : model.isSelected.value && index == list.length-1 ?
                            CommonUi.roundedDecorationWithBorderRadius(
                          outLineColor: ColorRes.bluecolor,
                          bgColor: ColorRes.lightBluecolor,
                          bottomLeft: 8.0,
                          bottomRight: 8.0,
                          borderWidth: 1.0 //bottom
                      )
                          : model.isSelected.value ? CommonUi.roundedDecorationWithBorderRadius(
                          outLineColor: ColorRes.bluecolor,
                          bgColor: ColorRes.lightBluecolor,
                          borderWidth: 1.0 // mid
                      )
                          : !model.isSelected.value && index == 0?
                            CommonUi.roundedDecorationWithBorderRadius(
                                outLineColor: ColorRes.noProgressColor,
                                bgColor: Colors.white,
                                 topLeft: 8.0,
                                 topRight: 8.0,
                                borderWidth: 1.0 //top
                            )
                                : model.isSelected.value && index == list.length-1 ?
                            CommonUi.roundedDecorationWithBorderRadius(
                                outLineColor: ColorRes.noProgressColor,
                                bgColor: Colors.white,
                                bottomLeft: 8.0,
                                bottomRight: 8.0,
                                borderWidth: 1.0 //bottom
                            ) :!model.isSelected.value && index == list.length-1 ?
                            CommonUi.roundedDecorationWithBorderRadius(
                                outLineColor: ColorRes.noProgressColor,
                                bgColor: Colors.white,
                                bottomLeft: 8.0,
                                bottomRight: 8.0,
                                borderWidth: 1.0 //bottom
                            ):CommonUi.roundedDecorationWithBorderRadius(
                               outLineColor: ColorRes.noProgressColor,
                               bgColor: Colors.white,
                                topLeft: 0.0,
                                topRight: 0.0,
                                borderWidth: 1.0 //top
                            ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,
                                bottom: 10,
                                left: 8,
                                right: 8),
                            child: type != 3 ? Row(
                              children: [
                                SvgPicture.string(model.icon??'',
                                fit: BoxFit.fill,
                                height: 36,
                                width: 36,),
                                const SizedBox(width: 22,),
                                Expanded(
                                  child: AutoSizeText(model.name,
                                    maxLines: 1,
                                    style: CommonUi.customTextStyle(
                                      color: model.isSelected.value
                                          ? ColorRes.bluecolor
                                          : ColorRes.colorBlack,
                                      fontFamily: Fonts.semiBold,
                                      fontSize: 18),),
                                )
                              ],
                            ) : Row(
                              children: [
                                const SizedBox(width: 12,),
                                Expanded(
                                  child: AutoSizeText(model.name,
                                    maxLines: 1,
                                    style: CommonUi.customTextStyle(
                                      color: ColorRes.colorBlack,
                                      fontFamily: Fonts.semiBold,
                                      fontSize: 18),),
                                ),
                                const Spacer(),
                                Text(model.limits!,style: CommonUi.customTextStyle(
                                  fontSize: 18,
                                  fontFamily: Fonts.medium
                                ),),
                                const SizedBox(width: 12,)
                              ],
                            ),
                          ),

                        ],
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          CommonUi.customButton(buttonText:Strings.continueTxt,callBack: (){
            movePage(controller);
          }),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
  void movePage(OnboardController controller) {
    print("page number: ${controller.goalPageNo.value}");
    var toast = "Please select any of one";
    var service=Get.find<GlobalServices>();

    if(controller.goalPageNo.value == 0){
      controller.progressValue.value = 0.25;
    }
    if(controller.goalPageNo.value == 1){
      var anySelected = controller.list_1.where((p0) {
        if(p0.isSelected.value==true){
          service.selectedWhy=p0.id;
          return true;
        }else{
          return false;
        }
      } );
      if(anySelected.isEmpty){
        CommonUi.showToast(toast);
        return;
      }
      controller.progressValue.value = 0.50;
    }
    if(controller.goalPageNo.value == 2){
      service.selectedMore.clear();
      var anySelected = controller.list_2.where((p0) {
        if(p0.isSelected.value==true){
          service.selectedMore.add(p0.id.toString());
          return true;
        }else{
          return false;
        }
      });
      if(anySelected.isEmpty){
        CommonUi.showToast("Please select atleast one.");
        return;
      }
      controller.progressValue.value = 1.0;
    }
    if(controller.goalPageNo.value == 3){
      var anySelected = controller.list_3.where((p0) {
        if(p0.isSelected.value==true){
          service.selectedGoal=p0.id;
          return true;
        }else{
          return false;
        }
      } );
      if(anySelected.isEmpty){
        CommonUi.showToast(toast);
        return;
      }
    }
    controller.pControllers[1].animateToPage(controller.goalPageNo.value, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    if(controller.titleNumber.value==2){
      Get.offAllNamed(AppRoutes.completeOnBoard);
    }
  }

}

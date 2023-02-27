import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/appOnBoarding/onboard/controller/OnBoardController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';

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
            decoration: CommonUi.roundedDecorationWithBorder(
                outLineColor: ColorRes.noProgressColor,
                bgColor: Colors.white,
                borderWidth:1.5 ,
                radius: 8.0
            ),
            margin: const EdgeInsets.only(top: 24),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                    height:  1,
                    color: ColorRes.noProgressColor,
                  );
              },
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
                          : null,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,
                                bottom: 10,
                                left: 8,
                                right: 8),
                            child: type != 3 ? Row(
                              children: [
                                SvgPicture.string(model.icon??''),
                                const SizedBox(width: 22,),
                                Expanded(
                                  child: AutoSizeText(model.name,
                                    maxLines: 1,
                                    style: CommonUi.customTextStyle(
                                      color: model.isSelected.value
                                          ? ColorRes.bluecolor
                                          : ColorRes.colorBlack,
                                      fontFamily: Fonts.semiBold,
                                      fontSize: FontSize.font20),),
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
                                      fontSize: FontSize.font20),),
                                ),
                                const Spacer(),
                                Text(model.limits!,style: CommonUi.customTextStyle(
                                  fontSize: FontSize.font20,
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
        ],
      ),
    );
  }
}

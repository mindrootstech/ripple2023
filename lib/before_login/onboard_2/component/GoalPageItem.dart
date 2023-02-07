import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/before_login/onboard_2/controller/OnboardGoalController.dart';
import 'package:ripplefect/before_login/onboard_2/model/OnboardModel.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/colors.dart';
import 'package:ripplefect/helper/constants/fonts.dart';

class GoalPageItem extends StatelessWidget {
  var type = 0;
  RxList<GoalOnboardModel> list;

  GoalPageItem(this.type, this.list);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: CommonUi.roundedDecorationWithBorder(
                outLineColor: MyColors.noProgressColor,
                bgColor: Colors.white,
                radius: 8.0
            ),
            margin: const EdgeInsets.only(top: 24),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                var model = list[index];
                return InkWell(
                  onTap: () {
                    if(type != 2){
                      for (int i = 0; i < list.length; i++) {
                        list[i].isSelected.value = false;
                      }
                    }
                    model.isSelected.value = !model.isSelected.value;
                  },
                  child: Obx(() {
                    return Container(
                      decoration: model.isSelected.value && index == 0 ? CommonUi
                          .roundedDecorationWithBorderRadius(
                          outLineColor: MyColors.bluecolor,
                          bgColor: MyColors.lightBluecolor,
                          topLeft: 8.0,
                          topRight: 8.0,
                          borderWidth: 1.1 //top
                      ) : model.isSelected.value && index == list.length-1
                          ? CommonUi.roundedDecorationWithBorderRadius(
                          outLineColor: MyColors.bluecolor,
                          bgColor: MyColors.lightBluecolor,
                          bottomLeft: 8.0,
                          bottomRight: 8.0,
                          borderWidth: 1.1 //bottom
                      ) : model.isSelected.value ? CommonUi
                          .roundedDecorationWithBorderRadius(
                          outLineColor: MyColors.bluecolor,
                          bgColor: MyColors.lightBluecolor,
                          borderWidth: 1.1 // mid
                      ) : null,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,
                                bottom: 10,
                                left: 8,
                                right: 8),
                            child: type != 3 ? Row(
                              children: [
                                SvgPicture.asset(CommonUi.setSvgImage(model.img)),
                                const SizedBox(width: 28,),
                                Text(model.title, style: CommonUi.customTextStyle(
                                    color: model.isSelected.value
                                        ? MyColors.bluecolor
                                        : MyColors.colorBlack,
                                    fontFamily: Fonts.bold,
                                    fontSize: FontSize.font20),)
                              ],
                            ) : Row(
                              children: [
                                const SizedBox(width: 12,),
                                Text(model.title, style: CommonUi.customTextStyle(
                                    color: MyColors.colorBlack,
                                    fontFamily: Fonts.bold,
                                    fontSize: FontSize.font20),),
                                const Spacer(),
                                Text(model.action!,style: CommonUi.customTextStyle(
                                  fontSize: FontSize.font20,
                                  fontFamily: Fonts.medium
                                ),),
                                const SizedBox(width: 12,)
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: MyColors.noProgressColor,
                          )
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

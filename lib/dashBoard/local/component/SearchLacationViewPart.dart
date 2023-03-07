import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../../../helper/constants/ColorRes.dart';
import '../controller/LocalController.dart';
import 'ItemFoundListSheet.dart';


class SearchLocationViewPart extends StatelessWidget {
   SearchLocationViewPart({Key? key}) : super(key: key);
  var controller=Get.find<LocalController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:  EdgeInsets.only(top: 60,left:CommonUi.marginLeftRight,right:CommonUi.marginLeftRight  ),
          height: 50,
          width: Get.width,
          decoration: CommonUi.curvedBoxDecorationWithShadow2(),
          child: Stack(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: CommonUi.customTextStyle(color: ColorRes.colorGrey1,fontFamily: Fonts.medium,fontSize: 15),
                    hintText: "Search business or shop name",
                    contentPadding: const EdgeInsets.only(left: 48),
                    fillColor: Colors.white),
                controller: controller.searchController,
                onTap: (){
                  // controller.isSearch.value=true;
                },
                enabled: true,
              ),
              const Positioned(
                left: 19,
                  top: 0,
                  bottom: 0,
                  child: Icon(Icons.search_sharp)),

            ],
          ),
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),
            itemBuilder: (context, index) {
            return Center(
              child: GestureDetector(
                onTap: (){
                  controller.isSearch.value=true;
                  controller.searchController.text='Coffee Shop';
                  controller.snappingController.snapToPosition(const SnappingPosition.factor(positionFactor: 0.7,
                    grabbingContentOffset: GrabbingContentOffset.bottom,));
                },
                child: Container(
                  decoration: CommonUi.curvedBoxDecorationWithShadow2(),
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  margin: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(CommonUi.setSvgImage('s_location_icon')),
                      const SizedBox(width: 4,),
                      Text('Coffee Shop',style: CommonUi.customTextStyle(fontSize: 12,fontFamily: Fonts.medium),)
                    ],
                  ),
                ),
              ),
            );
          },),
        )
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../../../helper/constants/ColorRes.dart';
import '../../../helper/constants/strings.dart';
import '../controller/LocalController.dart';

class SearchLocationFilterPart extends StatelessWidget {
   SearchLocationFilterPart({Key? key}) : super(key: key);
  var controller=Get.find<LocalController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(top: 70),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),
            child: Stack(
              children: [
                TextField(
                  controller:controller.searchController,
                  decoration: CommonUi.textFieldDecoration(
                      cornerRadius: 100.0,
                  contentLeft: 10,
                  hintText: Strings.textSearchTextHint),
                ),
                 Positioned(right: 16,
                    top: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: (){
                        controller.isSearch.value=false;
                        controller.searchController.text='';
                        controller.snappingController.snapToPosition(const SnappingPosition.factor(positionFactor: 0.1,
                          grabbingContentOffset: GrabbingContentOffset.bottom,));
                      },
                        child: const Icon(Icons.clear)))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: CommonUi.marginLeftRight),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: CommonUi.roundedDecorationWithBorder(outLineColor: ColorRes.colorWhiteGrey,bgColor:ColorRes.white),
                  padding: const EdgeInsets.all(4),
                  //filter
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width:5),
                      SvgPicture.asset(CommonUi.setSvgImage('filter_icon')),
                      const SizedBox(width:5),
                      Text(Strings.textFilter,style:CommonUi.customTextStyle(fontSize: 13,fontFamily: Fonts.bold),),
                      const Icon(Icons.arrow_drop_down_sharp)
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 10,left: 8),
                              decoration: CommonUi.roundedDecorationWithBorder(outLineColor: ColorRes.colorWhiteGrey,bgColor:ColorRes.white),
                              padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Open now',style:CommonUi.customTextStyle(fontSize: 13,fontFamily: Fonts.semiBold),),
                                  const Icon(Icons.clear,size: 18,)

                                ],
                              ),
                            ),
                          );
                        }

                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

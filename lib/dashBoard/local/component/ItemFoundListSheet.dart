import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/dashBoard/local/controller/LocalController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../../../helper/constants/ColorRes.dart';
import '../../../helper/constants/fonts.dart';


class ItemFoundListSheet extends StatelessWidget {
   ItemFoundListSheet({Key? key}) : super(key: key);
  var controller=Get.find<LocalController>();

  @override
  Widget build(BuildContext context) {
    return  SnappingSheet(
      controller: controller.snappingController,
      grabbingHeight: 75,
      lockOverflowDrag: true,
      grabbing: getGrabbingPart(),
      sheetBelow: SnappingSheetContent(
        draggable: true,
        childScrollController: controller.snapSheetController,
        child: Container(
          width: Get.width,
          decoration: CommonUi.curvedBoxDecoration(topRight: 10,topLeft: 10,backgroundColor: Colors.white),
          child: getFoundItemList(),
        ),
      ),
      snappingPositions: const [
        SnappingPosition.factor(
          positionFactor: 0.0,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.pixels(
          positionPixels: 400,
          snappingCurve: Curves.elasticOut,
          snappingDuration: Duration(milliseconds: 1750),
        ),
        SnappingPosition.factor(
          positionFactor: 1.0,
          snappingCurve: Curves.bounceOut,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: GrabbingContentOffset.bottom,
        ),
      ],
    );
  }

  Widget getFoundItemList() {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        controller: controller.snapSheetController,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin:  EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight,vertical: 7),
              padding:  const EdgeInsets.all(18),
              decoration: CommonUi.getBorderRadius(
                  8.0,
                  Colors.transparent,
                  borderWidth: 1.0,
                  borderColor: ColorRes.noProgressColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(4)),
                    child: Image.network(
                      "https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg",
                       width: 132,
                       height: 110,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context,
                          Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.white70,
                            value: loadingProgress.expectedTotalBytes !=
                                null
                                ? loadingProgress
                                .cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 24, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "The Rebrand",
                                  style: CommonUi.customTextStyle(
                                      fontFamily: Fonts.bold,
                                      fontSize: 14),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SvgPicture.asset(CommonUi.setSvgImage('green_heart_icon')),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Proin pellentesque dolr door at ante aliquet",
                            style: CommonUi.customTextStyle(
                                fontFamily: Fonts.medium, fontSize: 14),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Wrap(
                            children: [
                              Container(
                                decoration: CommonUi.getBorderRadius(
                                  20.0,
                                  ColorRes.noProgressColor ,
                                  borderColor: ColorRes.lightBorderColor
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 11,vertical: 6),
                                child: Text('Thrift Stores',style: CommonUi.customTextStyle(fontSize: 12,fontFamily: Fonts.medium),),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1.5mi   100pts",
                                style: CommonUi.customTextStyle(
                                    fontFamily: Fonts.semiBold, fontSize: 16),
                                textAlign: TextAlign.left,
                              ),

                              Icon(Icons.share,color: ColorRes.buttonColor,)
                            ],
                          ),


                        ],
                      ),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }

   Widget getGrabbingPart() {
    return  Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: CommonUi.marginLeftRight),
        height: 50,
        width: 200,
        decoration: CommonUi.curvedBoxDecorationWithShadow2(backgroundColor: ColorRes.buttonColor,shadowColor: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(CommonUi.setSvgImage('plus_white_icon')),
            const SizedBox(
              width: 8,
            ),
            Text('Add Business',style: CommonUi.customTextStyle(color: ColorRes.white,fontFamily: Fonts.regular,fontSize: 17),),
          ],
        ),
      ),
    );
  }
}


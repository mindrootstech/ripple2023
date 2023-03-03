import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../helper/constants/fonts.dart';
import '../../../helper/dialogs/TrackActionDialog.dart';
import '../controller/ProductDetailController.dart';


class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<ProductDetailController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      getPageViewAndIndicator(controller),
                      getHeadingToOnlineText(),
                      // getImpactMetrics(controller),
                      whyItMatters(controller),

                    ],
                  ),
                ),
              ),
              getBottomBoxPart(),
            ],
          );
        },
      ),
    );
  }


  Widget getPageViewAndIndicator(ProductDetailController controller){
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 260,
              child: PageView.builder(
                itemCount: controller.bannerImages.length,
                physics: const ClampingScrollPhysics(),
                onPageChanged: (value) {},
                controller: controller.pageController,
                itemBuilder: (BuildContext context, int index) {
                  return CommonUi.loadBannerImages(controller.bannerImages[index]);
                },
              ),
            ),
            Positioned(
                top: 30,
                left:20,
                child: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                    child: Image.asset(CommonUi.setPngImage("back_icon"),height: 40,width: 40))),
            Positioned(
                top: 30,
                right:20,
                child: Image.asset(CommonUi.setPngImage("heart"),height: 40,width: 40)),
          ],
        ),
        const SizedBox(height: 12),
        controller.bannerImages.isNotEmpty ?
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: SmoothPageIndicator(
              controller: controller.pageController,
              count: controller.bannerImages.length,
              effect: const SlideEffect(
                  spacing: 8,
                  dotWidth: 8,
                  dotHeight: 8,
                  dotColor: ColorRes.colorGray,
                  activeDotColor: ColorRes.buttonColor),
              onDotClicked: (index) {}),
        ) : const SizedBox(),
      ],
    );
  }

  Widget getHeadingToOnlineText(){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: CommonUi.marginLeftRight, top: 15),
          child: Row(
            children: [
              Image.asset(CommonUi.setPngImage("dummy_image")),
              const SizedBox(width: 18),
              Expanded(
                child: Text("Switch your search engine to Ecosia and plant a tree while browsing.",
                    style: CommonUi.customTextStyle(fontFamily: Fonts.semiBold,
                        fontSize: 20)),
              )
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  margin:const EdgeInsets.only(right: 4),
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorRes.colorOrange),
                   child: Text("3",
                   style: CommonUi.customTextStyle(fontFamily: Fonts.medium,
                    fontSize: 14, color: ColorRes.white)),
                ),
                Text(Strings.textImpact,
                style: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize: 16, color: ColorRes.greyColor)),
                const SizedBox(width: 4),
                Image.asset(CommonUi.setPngImage('info_icon'),height: 18,width: 18)

              ],
            ),
            Container(
              margin:const EdgeInsets.only(left: 8, right: 8),
              height: 20,
              width: 2,
              color: ColorRes.noProgressColor,
            ),
            Row(
              children: [
              Image.asset(CommonUi.setPngImage('plus_icon'),height: 22,width: 22),
                const SizedBox(width: 4),
                Text("120 ${Strings.textPts}",
                    style: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize: 16, color: ColorRes.greyColor)),
            ],),
            Container(
              margin:const EdgeInsets.only(left: 8, right: 8),
              height: 20,
              width: 2,
              color: ColorRes.noProgressColor,
            ),
            Row(
              children: [
                Image.asset(CommonUi.setPngImage('location_icon'),height: 18,width: 18),
                const SizedBox(width: 4),
                Text("Online",
                    style: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize: 16, color: ColorRes.greyColor)),
              ],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(left:CommonUi.marginLeftRight, right:CommonUi.marginLeftRight, top: 27),
          height:1,
          width: Get.width,
          color: ColorRes.noProgressColor,
        ),

      ],
    );
  }

  Widget getImpactMetrics(ProductDetailController controller){
    return Column(
      children: [
        Container(
          width: Get.width,
          margin: const EdgeInsets.only(left: 30, top: 16, bottom: 16),
          child: Text(
            Strings.textImpactMetrics, style: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize: 20),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30, bottom: 16),
          height: 70,
          width: Get.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.metricList.value.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 11, right: 11),
                margin: const EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: controller.metricList[index].bgColor
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.metricList[index].name,style: CommonUi.customTextStyle(
                      fontFamily: Fonts.semiBold, fontSize: 11, color: controller.metricList[index].textColor!
                    ),),
                    const SizedBox(height: 2),
                    Text(controller.metricList[index].type,style: CommonUi.customTextStyle(
                        fontFamily: Fonts.regular, fontSize: 11, color: controller.metricList[index].textColor!
                    ),),
                    const SizedBox(height: 5),
                    Text(controller.metricList[index].weight,style: CommonUi.customTextStyle(
                        fontFamily: Fonts.bold, fontSize: 16, color: controller.metricList[index].textColor!
                    ),
                   ),
                  ],
                ),
              );
            },),
        ),

      ],
    );
  }

 Widget whyItMatters(ProductDetailController controller) {
    return Padding(
      padding:  EdgeInsets.only(left: CommonUi.marginLeftRight,right: CommonUi.marginLeftRight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height:16 ,
          ),
          Text(Strings.textWhyItMatters, style: CommonUi.customTextStyle(fontFamily: Fonts.medium,fontSize: 20)),
          const SizedBox(
            height:16 ,
          ),
          ReadMoreText(
            "Trees mean a happy environment, healthy people, and a strong economy. "
                "We use the profit we make from your searches to plant trees where they "
                "are needed most. We restore and protect biodiversity hotspots."
                "Trees mean a happy environment, healthy people, and a strong economy."
                "are needed most. We restore and protect biodiversity hotspots. ",
            style:CommonUi.customTextStyle(fontFamily: Fonts.regular, fontSize: 17),
            trimLines: 5,
            colorClickableText: ColorRes.buttonColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: Strings.textReadMore,
            trimExpandedText:Strings.textShowLess ,
            moreStyle: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize: 16, color: ColorRes.buttonColor,),
          ),
          const SizedBox(height: 22,),
          Text(Strings.textHowYouCan,  style: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize: 20)),
          const SizedBox(height: 16,),
          Text("Get the free browser extension and plant trees with every search.\n\n"
              "How Ecosia works? \n1. Search the web with Ecosia."
              "\n2. Browse ads to generate income for Ecosia.\n3. Ecosia uses this income to plant trees.",
              style: CommonUi.customTextStyle(fontFamily: Fonts.regular, fontSize: 17)),
          const SizedBox(height: 16,),
          Text(Strings.textLearnMore,
              style: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize: 16, color: ColorRes.buttonColor)),
          const SizedBox(height: 16,),
          Container(
            margin: EdgeInsets.only( bottom: CommonUi.marginLeftRight),
            height: 1,
            width: Get.width,
            color: ColorRes.noProgressColor,
          ),
          Row(
            children: [
              Text('Learn more about Ecosia',style: CommonUi.customTextStyle(color: ColorRes.colorGreen2,fontFamily: Fonts.semiBold,fontSize: 15),),
              const SizedBox(
                width: 4,
              ),
              SvgPicture.asset(CommonUi.setSvgImage('green_arrow')),

            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget getBottomBoxPart() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: CommonUi.marginLeftRight,horizontal: CommonUi.marginLeftRight),
      width: Get.width,
      decoration: CommonUi.curvedBoxDecorationWithShadow(radius: 0.0,spreadRadius: 0.0,blurRadius: 10.0,offsetX:0.0,offsetY: -2.0,shadowColor: ColorRes.colorBlack10),
      child: Column(
        children: [
          CommonUi.customButton(
              buttonText: Strings.textCompleteAction,
              fontSize: 18.0,
              callBack: () {
                TrackActionDialog().showDialog();
              }),
          const SizedBox(
            height: 16,
          ),
          Text(Strings.textIAlreadyDid,style: CommonUi.customTextStyle(fontSize: 16,fontFamily: Fonts.semiBold,color: ColorRes.buttonColor),),
          if(Platform.isIOS)...{
             const SizedBox(
              height: 16,
            ),
          }
        ],
      ),
    );
  }
}

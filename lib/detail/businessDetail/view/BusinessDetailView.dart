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
import '../controller/BusinessDetailController.dart';

class BusinessDetailView extends StatelessWidget {
  const BusinessDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<BusinessDetailController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      getPageViewAndIndicator(controller),
                      getHeadingToOnlineText(controller),
                      getActionsTake(),
                      getOfferedRewards(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget getPageViewAndIndicator(BusinessDetailController controller) {
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
                  return CommonUi.loadBannerImages(
                      controller.bannerImages[index]);
                },
              ),
            ),
            Positioned(
                top: 30,
                left: 20,
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(CommonUi.setPngImage("back_icon"),
                        height: 40, width: 40))),
            Positioned(
                top: 30,
                right: 20,
                child: Image.asset(CommonUi.setPngImage("heart"),
                    height: 40, width: 40)),
          ],
        ),
        const SizedBox(height: 12),
        controller.bannerImages.isNotEmpty
            ? Container(
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
              )
            : const SizedBox(),
      ],
    );
  }

  Widget getHeadingToOnlineText(BusinessDetailController controller
      ) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: CommonUi.marginLeftRight,
              top: 15,
              right: CommonUi.marginLeftRight),
          child: Row(
            children: [
              Image.asset(CommonUi.setPngImage("dummy_image")),
              const SizedBox(width: 18),
              Expanded(
                child: Text(
                    "Chocolate Espresso Bar",
                    style: CommonUi.customTextStyle(
                        fontFamily: Fonts.bold, fontSize: 24)),
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.only(left: 24),
          width: Get.width,
          child: Text(
            "Cafe & Coffee Shop",
            style:
                CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: CommonUi.marginLeftRight,
              right: CommonUi.marginLeftRight,
              top: 14),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur efefffdf  adipiscing elit, sed do eiusmod tempor cxc.",
            style: CommonUi.customTextStyle(
                fontFamily: Fonts.regular, fontSize: 16),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          runSpacing: -5,
          children: [
            for (var item in controller.tags)
              Padding(
                padding: const EdgeInsets.only(left: 4,right: 4,),
                child: Chip(
                  label: Text(item, style: CommonUi.customTextStyle(
                      fontFamily: Fonts.semiBold, fontSize: 16),),
                ),
              )
          ],
        ),
      ],
    );
  }


  getActionsTake() {
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.textActionsTake,
            style: CommonUi.customTextStyle(
                fontFamily: Fonts.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: Get.width,
            height: 250,
            child: ListView.builder(
              // shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 170,
                  decoration: CommonUi.getBorderRadius(8.0, Colors.transparent,
                      borderWidth: 1.0, borderColor: ColorRes.noProgressColor),
                  // margin:  EdgeInsets.only(left: CommonUi.marginLeftRight , right: CommonUi.marginLeftRight),
                  child: Stack(

                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: Get.width,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: Image.network(
                                  "https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg",
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white70,
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                        CommonUi.setPngImage("test_company"),
                                        height: 16,
                                        width: 45),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 2, bottom: 2),
                                      decoration: CommonUi.curvedBoxDecoration(
                                          backgroundColor: ColorRes.appColor),
                                      child: Text(
                                        "50 Pts",
                                        style: CommonUi.customTextStyle(
                                            fontFamily: Fonts.bold,
                                            fontSize: 11,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 0, right: 8),
                                  child: Text(
                                    "Advocate for the restoration of seagrass in our oceans.",
                                    textAlign: TextAlign.start,
                                    style: CommonUi.customTextStyle(
                                        fontFamily: Fonts.semiBold,
                                        fontSize: 15),
                                    maxLines: 2,
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  margin: const EdgeInsets.only(top: 9),
                                  color: ColorRes.colorGray,
                                ),
                                Container(
                                    width: Get.width,
                                    margin: const EdgeInsets.only(
                                        right: 5, top: 10),
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Image.asset(
                                            CommonUi.setPngImage(
                                                "three_dots_icon"),
                                            height: 5,
                                            width: 25))),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 5, top: 5),
                        child: Image.asset(
                          CommonUi.setPngImage("heart"),
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  getOfferedRewards() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 16, bottom: 16, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Offered Rewards",
                style: CommonUi.customTextStyle(
                    fontFamily: Fonts.bold, fontSize: 16, color: Colors.black),
              ),
              Text(
                "See All",
                style: CommonUi.customTextStyle(
                    fontFamily: Fonts.semiBold,
                    fontSize: 14,
                    color: ColorRes.buttonColor),
              )
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: CommonUi.getBorderRadius(
                        8.0, Colors.transparent,
                        borderWidth: 1.0,
                        borderColor: ColorRes.noProgressColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 120,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            child: Image.network(
                              "https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg",
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
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 24, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "The Rebrand",
                                      style: CommonUi.customTextStyle(
                                          fontFamily: Fonts.medium,
                                          fontSize: 12),
                                      textAlign: TextAlign.left,
                                    ),
                                    Container(
                                      decoration: CommonUi.getBorderRadius(
                                          2.0, Colors.transparent,
                                          borderWidth: 1.0,
                                          borderColor: ColorRes.colorGreen2),
                                      padding:
                                          const EdgeInsets.fromLTRB(6, 2, 6, 2),
                                      child: Text(
                                        "100 pts",
                                        style: CommonUi.customTextStyle(
                                            fontFamily: Fonts.bold,
                                            fontSize: 12,
                                            color: ColorRes.colorGreen2),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Proin pellentesque dolr door at ante aliquet",
                                  style: CommonUi.customTextStyle(
                                      fontFamily: Fonts.regular, fontSize: 15),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: CommonUi.getBorderRadius(
                                      2.0, Colors.transparent,
                                      borderWidth: 1.0,
                                      borderColor: ColorRes.buttonColor),
                                  padding:
                                      const EdgeInsets.fromLTRB(6, 2, 6, 2),
                                  child: Text(
                                    "Get Reward",
                                    style: CommonUi.customTextStyle(
                                        color: ColorRes.buttonColor,
                                        fontFamily: Fonts.medium,
                                        fontSize: 10),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        CommonUi.setSvgImage("online_gift")),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "Online",
                                      style: CommonUi.customTextStyle(
                                          fontFamily: Fonts.medium,
                                          fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
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
          ),
        ],
      ),
    );
  }
}

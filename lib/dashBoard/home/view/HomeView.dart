import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';

import '../../../helper/constants/CommonUi.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: Get.width,
          child: SvgPicture.asset(
            CommonUi.setSvgImage("app_bg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 16),
                    child: Text(
                      "Hello, User!",
                      style: CommonUi.customTextStyle(
                          fontSize: FontSize.font28,
                          fontFamily: Fonts.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 6, bottom: 6, left: 8, right: 8),
                    decoration: CommonUi.curvedBoxDecoration(),
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '3110',
                                style: CommonUi.customTextStyle(
                                    fontFamily: Fonts.bold,
                                    fontSize: FontSize.font12),
                              ),
                              TextSpan(
                                text: ' Total reward points.',
                                style: CommonUi.customTextStyle(
                                    fontFamily: Fonts.medium,
                                    fontSize: FontSize.font12),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text("View Rewards",
                            style: CommonUi.customTextStyle(
                                fontSize: FontSize.font12,
                                color: ColorRes.buttonColor)),
                        SvgPicture.asset(CommonUi.setSvgImage("right_arrow"))
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 13, bottom: 3, left: 8, right: 8),
                    decoration: CommonUi.curvedBoxDecoration(),
                    child: Row(
                      children: [
                        Text("Complete profile and get 20 reward points!",
                            style: CommonUi.customTextStyle(
                              fontSize: FontSize.font12,
                            )),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 2, bottom: 2, left: 10, right: 10),
                          decoration: CommonUi.roundedDecorationWithBorder(
                              outLineColor: ColorRes.buttonColor,
                              bgColor: ColorRes.white,
                              radius: 8.0),
                          child: Text("Profile",
                              style: CommonUi.customTextStyle(
                                  fontSize: FontSize.font12,
                                  color: ColorRes.buttonColor)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 4, right: 4),
                          height: 15,
                          width: 2,
                          color: ColorRes.noProgressColor,
                        ),
                        const Icon(
                          Icons.close,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 100,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.6,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(color: Colors.amber),
                              child: Text(
                                'text $i',
                                style: const TextStyle(fontSize: 16.0),
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  // Carousel(
                  //   indicatorBackgroundOpacity: 1,
                  //     height: 250.0,
                  //     width: 350,
                  //     initialPage: 3,
                  //     allowWrap: false,
                  //     type: Types.slideSwiper,
                  //     onCarouselTap: (i)   {
                  //       print("onTap $i");
                  //     },
                  //     indicatorType: IndicatorTypes.bar,
                  //     arrowColor: Colors.black,
                  //     axis: Axis.horizontal,
                  //     showIndicator: false,
                  //     showArrow: false,
                  //     children: List.generate(7, (i) =>
                  //         ClipRRect(
                  //           borderRadius: BorderRadius.circular(20.0),
                  //           child: Column(
                  //             children: [
                  //               Image.asset(CommonUi.setPngImage("test"))
                  //             ],
                  //           ),
                  //         )
                  //     )
                  // ),
                  SizedBox(
                    height: 200,
                    child: Swiper(
                        layout: SwiperLayout.STACK,
                        customLayoutOption: CustomLayoutOption(
                            startIndex: 1,
                            stateCount: 3
                        ).addRotate([
                          -45.0/180,
                          0.0,
                          45.0/180
                        ]).addTranslate([
                          const Offset(-370.0, -40.0),
                          const Offset(0.0, 0.0),
                          const Offset(370.0, -40.0)
                        ]),
                        itemWidth: 300.0,
                        itemHeight: 200.0,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.grey,
                            child: Center(
                              child: Text("$index"),
                            ),
                          );
                        },
                        itemCount: 10),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

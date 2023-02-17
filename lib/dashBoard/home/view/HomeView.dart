import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pageviewj/pageviewj.dart';
import 'package:ripplefect/dashBoard/home/controller/HomeController.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import '../../../helper/constants/CommonUi.dart';


class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);
   var controller=Get.find<HomeController>();
   List<Color> welcomeColors = [
     Colors.black,
     Colors.blue,
     Colors.red,
     Colors.green,
     Colors.black,
   ];

   Widget pageViewItem(BuildContext context, int index) {
     return Padding(
       padding: const EdgeInsets.all(10.0),
       child: Stack(
         children: [
           Card(
             clipBehavior: Clip.antiAlias,
             shape:
             RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
             child: Container(
               height: 300,
               color: welcomeColors[index],
             ),
           ),
           Positioned(
             bottom: 18,
             left: 18,
             child: Text(
               "鬼灭之刃 $index",
               style: const TextStyle(color: Colors.white),
             ),
           ),
         ],
       ),
     );
   }
   @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: Get.width,
          child: SvgPicture.asset(
            CommonUi.setSvgImage("app_bg"),
            fit: BoxFit.fitHeight,
            width: Get.width,
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Hello, User!",
                    style: CommonUi.customTextStyle(
                        fontSize: FontSize.font28,
                        fontFamily: Fonts.bold,
                        color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 6, left: 8, right: 8),
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '3110',
                                style: CommonUi.customTextStyle(
                                    fontFamily: Fonts.bold,
                                    color: ColorRes.white,
                                    fontSize: FontSize.font22),
                              ),
                              TextSpan(
                                text: '  points.',
                                style: CommonUi.customTextStyle(
                                    fontFamily: Fonts.bold,
                                    color: ColorRes.white,
                                    fontSize: FontSize.font12),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                          decoration: CommonUi.roundedDecorationWithBorder(
                              outLineColor: ColorRes.white,
                              bgColor: Colors.transparent,
                              borderWidth:2.0,
                              radius: 20.0),
                          child: Row(
                            children: [
                              Text("View Rewards",
                                  style: CommonUi.customTextStyle(
                                      fontSize: FontSize.font14,
                                      fontFamily: Fonts.semiBold,
                                      color: ColorRes.white)),
                              const SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(CommonUi.setSvgImage("right_arrow"),
                              height: 14,
                              color: ColorRes.white,
                              width: 14,)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 18,bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                    decoration: CommonUi.curvedBoxDecoration(),
                    child: Row(
                      children: [
                        Text("Complete profile and get 20 reward points!",
                            style: CommonUi.customTextStyle(
                              fontSize: FontSize.font12,
                              color: ColorRes.colorBlack,
                              fontFamily: Fonts.medium,
                            )),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 10),
                          decoration: CommonUi.roundedDecorationWithBorder(
                              outLineColor: ColorRes.buttonColor,
                              bgColor: ColorRes.white,
                              radius: 8.0),
                          child: Text("Profile",
                              style: CommonUi.customTextStyle(
                                  fontSize: FontSize.font12,
                                  fontFamily: Fonts.medium,
                                  color: ColorRes.buttonColor)),
                        ),

                      ],
                    ),
                  ),

                  Text(
                    "Featured Challenges",
                    style: CommonUi.customTextStyle(
                        fontSize: FontSize.font28,
                        fontFamily: Fonts.bold,
                        color: Colors.white),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 300,
                        child: PageViewJ(
                          itemCount: welcomeColors.length,
                          modifier: const Modifier(viewportFraction: .73,padEnds: false,
                              scrollDirection: Axis.horizontal),
                          transform: StackTransform(),
                          itemBuilder: pageViewItem,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

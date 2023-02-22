import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pageviewj/pageviewj.dart';
import 'package:ripplefect/dashBoard/home/controller/HomeController.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import '../../../helper/constants/CommonUi.dart';


class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);
   var controller=Get.find<HomeController>();

   @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(children: [
       Image.asset(CommonUi.setPngImage('app_bg'),
         fit: BoxFit.fill,
         height: 650,
         width: Get.width,
       ),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(left:CommonUi.marginLeftRight, right: CommonUi.marginLeftRight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   getHeaderPartView(),
                  getFeaturePartView(),
                    getSearchFieldView(),
                  forYouPartView(),



                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget getHeaderPartView() {
     return Column(
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
       ],
     );
  }

   Widget getFeaturePartView() {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           "Featured Challenges",
           style: CommonUi.customTextStyle(
               fontSize: FontSize.font28,
               fontFamily: Fonts.bold,
               color: Colors.white),
         ),
         const SizedBox(height: 15,),

         CarouselSlider.builder(
           options: CarouselOptions(
               height: 300,
               aspectRatio: 16 / 9,
               viewportFraction: 0.8,
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
               onPageChanged: (value,_){
                 controller.currentIndex.value=value;
               }
           ),
           itemCount: controller.modelList.length,

           itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
               Stack(
                 children: [
                   Column(
                     children: [
                       Expanded(
                         child: SizedBox(
                           width: Get.width,
                           child: ClipRRect(
                             borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                             child: Image.network(
                               "https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg",
                               fit: BoxFit.cover,
                               loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                                 if (loadingProgress == null) return child;
                                 return  Center(
                                   child: CircularProgressIndicator(
                                     color: Colors.white70,
                                     value: loadingProgress.expectedTotalBytes != null
                                         ? loadingProgress.cumulativeBytesLoaded /
                                         loadingProgress.expectedTotalBytes!
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
                             borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
                         ),
                         padding: const EdgeInsets.all(14),
                         child: Column(
                           children: [
                             Row(
                               children: [
                                 Image.asset(CommonUi.setPngImage("demo")),
                                 const SizedBox(width: 10,),
                                 Expanded(
                                   child: Column(
                                     children: [
                                       Text("The Vegan Meal Challenge",style: CommonUi.customTextStyle(fontFamily: Fonts.bold,fontSize: 14),),
                                       const SizedBox(height: 5,),
                                       Text("Nov 20, 2022 to Jan 20, 2023",style: CommonUi.customTextStyle(fontSize: 13)),
                                     ],
                                   ),
                                 )
                               ],
                             ),
                             const SizedBox(height: 10,),
                             Text("Focus on what you eat, reduce food waste, make more sustainable food choices",style: CommonUi.customTextStyle(fontFamily: Fonts.bold,fontSize: 14),),
                             Padding(
                               padding: const EdgeInsets.only(left: 30,right: 30,top: 8),
                               child: CommonUi.customButton(buttonText: "Join Challenge",fontSize: FontSize.font14,padding: 10.0),
                             )
                           ],
                         ),
                       )
                     ],
                   ),
                   Container(
                     alignment: Alignment.topRight,
                     padding: const EdgeInsets.only(right: 5,top: 5),
                     child: Image.asset(CommonUi.setPngImage("heart"),height: 25,width: 25,),
                   ),
                 ],
               ),
         ),
         if(controller.modelList.isNotEmpty)...{
           Obx(()=>
               Container(
                 alignment: Alignment.center,
                 margin: const EdgeInsets.only(top: 15,bottom: 15),
                 child: DotsIndicator(
                   decorator: const DotsDecorator(activeColor: ColorRes.white,activeSize: Size.square(16.0),size:Size.square(12.0) ),
                   dotsCount: controller.modelList.length,
                   position: double.parse(controller.currentIndex.value.toString()),
                 ),
               )
           )
         }
       ],
     );
  }

   Widget getSearchFieldView() {
     return SizedBox(
       width: Get.width,
       child: Stack(
         children: [
           TextFormField(
             // controller: controller.passField,
             // obscureText: !controller.passVisible.value,
             decoration: CommonUi.textFieldDecoration(hintText: Strings.textSearchHint,
                 passwordVisible: null,contentHorizontal: 48),
           ),
           Positioned(
             top: 0,
               bottom: 0,
               left: 20,
               child: SvgPicture.asset(CommonUi.setSvgImage('search_icon'))),

         ],
       ),
     );
   }

   Widget forYouPartView() {
     return Container(
       margin: const EdgeInsets.only(top: 24),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(Strings.textForYou,style:CommonUi.customTextStyle(fontSize: 22,fontFamily: Fonts.bold),),
           const SizedBox(
             height: 8,
           ),
           Text(Strings.textSuggestedBased,style:CommonUi.customTextStyle(fontSize: 15),),
           Container(
             margin: const EdgeInsets.only(top: 10),
             decoration: CommonUi.roundedDecorationWithBorder(outLineColor: ColorRes.colorWhiteGrey,bgColor:ColorRes.white),
             padding: const EdgeInsets.all(4),
             child: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 SvgPicture.asset(CommonUi.setSvgImage('filter_icon')),
                 Text(Strings.textFilter,style:CommonUi.customTextStyle(fontSize: 13,fontFamily: Fonts.bold),),
                 const Icon(Icons.arrow_drop_down_sharp)
               ],
             ),
           ),
         ],
       ),
     );
  }
}

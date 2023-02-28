import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/dashBoard/home/controller/HomeController.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import '../../../helper/constants/CommonUi.dart';
import '../../bottom_sheets/AllActionSheet.dart';


class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);
   var controller=Get.find<HomeController>();

   @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorRes.homeBgColor,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(children: [
         Image.asset(CommonUi.setPngImage('app_bg'),
           fit: BoxFit.fill,
           height: 650,
           width: Get.width,
         ),
          Padding(
            padding:  const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getHeaderPartView(),
                getFeaturePartView(),
                getSearchFieldView(),
                forYouPartView(),
                suggestionsView()
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget getHeaderPartView() {
     return Padding(
       padding: EdgeInsets.only(left: CommonUi.marginLeftRight, right: CommonUi.marginLeftRight),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const SizedBox(
             height: 16,
           ),
           Text(
             "Hello, User!",
             style: CommonUi.customTextStyle(
                 fontSize: 26,
                 fontFamily: Fonts.bold,
                 color: Colors.white),
           ),
           Container(
             padding: const EdgeInsets.only(top: 16, bottom: 6,),
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
                             fontSize: 20),
                       ),
                       TextSpan(
                         text: '  points.',
                         style: CommonUi.customTextStyle(
                             fontFamily: Fonts.bold,
                             color: ColorRes.white,
                             fontSize: 12),
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
                               fontSize: 12,
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
             padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
             decoration: CommonUi.curvedBoxDecoration(),
             child: Row(
               children: [
                 Text("Complete profile and get 20 reward points!",
                     style: CommonUi.customTextStyle(
                       fontSize: 12,
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
                           fontSize: 11,
                           fontFamily: Fonts.medium,
                           color: ColorRes.buttonColor)),
                 ),

               ],
             ),
           ),
         ],
       ),
     );
  }

   Widget getFeaturePartView() {
     return Padding(
       padding: EdgeInsets.only(left: CommonUi.marginLeftRight, right: CommonUi.marginLeftRight),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             "Featured Challenges",
             style: CommonUi.customTextStyle(
                 fontSize: 22,
                 fontFamily: Fonts.heavy,
                 color: Colors.white),
           ),
           const SizedBox(height: 15,),

           CarouselSlider.builder(
             options: CarouselOptions(
                 height: 350,
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
                                         Text("The Vegan Meal Challenge",style: CommonUi.customTextStyle(fontFamily: Fonts.semiBold),),
                                         const SizedBox(height: 5,),
                                         Text("Nov 20, 2022 to Jan 20, 2023",style: CommonUi.customTextStyle(fontSize: 12)),
                                       ],
                                     ),
                                   )
                                 ],
                               ),
                               const SizedBox(height: 10,),
                               Text("Focus on what you eat, reduce food waste, make more sustainable food choices",style: CommonUi.customTextStyle(fontFamily: Fonts.medium),),
                               Padding(
                                 padding: const EdgeInsets.only(left: 30,right: 30,top: 8),
                                 child: CommonUi.customButton(buttonText: "Join Challenge",padding: 10.0,fontSize: 14.0),
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
                     decorator: const DotsDecorator(activeColor: ColorRes.white,activeSize: Size.square(8.0),size:Size.square(8.0) ),
                     dotsCount: controller.modelList.length,
                     position: double.parse(controller.currentIndex.value.toString()),
                   ),
                 )
             )
           }
         ],
       ),
     );
  }

   Widget getSearchFieldView() {
     return Padding(
       padding: EdgeInsets.only(left: CommonUi.marginLeftRight, right: CommonUi.marginLeftRight),       child: SizedBox(
         width: Get.width,
         child: Stack(
           children: [
             TextFormField(
               style: CommonUi.customTextStyle(),
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
       ),
     );
   }

   Widget forYouPartView() {
     return Padding(
       padding: EdgeInsets.only(left: CommonUi.marginLeftRight, right: CommonUi.marginLeftRight),
       child: Container(
         margin: const EdgeInsets.only(top: 24),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(Strings.textForYou,style:CommonUi.customTextStyle(fontSize: 20,fontFamily: Fonts.heavy),),
             const SizedBox(
               height: 8,
             ),
             Text(Strings.textSuggestedBased,style:CommonUi.customTextStyle(fontSize: 14),),
             Row(
               children: [
                 Container(
                   margin: const EdgeInsets.only(top: 10),
                   decoration: CommonUi.roundedDecorationWithBorder(outLineColor: ColorRes.colorWhiteGrey,bgColor:ColorRes.white),
                   padding: const EdgeInsets.all(4),
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       const SizedBox(width:5),
                       SvgPicture.asset(CommonUi.setSvgImage('filter_icon')),
                       const SizedBox(width:5),
                       Text(Strings.textFilter,style:CommonUi.customTextStyle(fontSize: 12,fontFamily: Fonts.bold),),
                       const Icon(Icons.arrow_drop_down_sharp)
                     ],
                   ),
                 ),
                 Expanded(
                   child: SizedBox(
                     height: 60,
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: 3,
                       itemBuilder: (BuildContext context, int index) {
                         return Center(
                           child: Container(
                             margin: const EdgeInsets.only(top: 10,left: 8),
                             decoration: CommonUi.roundedDecorationWithBorder(outLineColor: ColorRes.colorWhiteGrey,bgColor:ColorRes.white),
                             padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                             child: Row(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 Text(index==0?'Oceans':'Fashion',style:CommonUi.customTextStyle(fontSize: 12,fontFamily: Fonts.bold),),
                                 const Icon(Icons.clear)

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
           ],
         ),
       ),
     );
  }


   Widget suggestionsView() {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(
           height: 250,
           width: Get.width,
           child: ListView.builder(
               physics: const BouncingScrollPhysics(),
               padding: EdgeInsets.zero,
               scrollDirection: Axis.horizontal,
               itemCount: 10,
               itemBuilder: (BuildContext context, int index) {
                 return Container(
                   margin:  EdgeInsets.only(left: index == 0? CommonUi.marginLeftRight : 0, right: 10),
                   width: 175,
                   child: Stack(
                     children: [
                       Column(
                         children: [
                           Expanded(
                             child: SizedBox(
                               width: 300,
                               height: 300,
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
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Image.asset(CommonUi.setPngImage("test_company"), height: 16,width: 45),
                                     Container(
                                       padding:const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                                       decoration: CommonUi.curvedBoxDecoration(backgroundColor: ColorRes.appColor),
                                       child: Text("50 Pts",style: CommonUi.customTextStyle(fontFamily: Fonts.heavy,fontSize: 11),),
                                     )
                                   ],
                                 ),
                                 const SizedBox(height: 8),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 0, right: 8),
                                   child: Text("Advocate for the restoration of seagrass in our oceans.",textAlign: TextAlign.start,style: CommonUi.customTextStyle(fontFamily: Fonts.semiBold,fontSize: 15),),
                                 ),
                                 Container(
                                   height: 1,
                                   margin: const EdgeInsets.only(top: 9),
                                   padding: const EdgeInsets.only(left: 4,right: 4),
                                   color: ColorRes.colorGray,
                                 ),

                                 Container(
                                   width: Get.width,
                                     margin: const EdgeInsets.only(right: 5, top: 10),
                                     child: Align(
                                         alignment: Alignment.topRight,
                                         child: Image.asset(CommonUi.setPngImage("three_dots_icon"), height: 5,width: 25))),
                                 
                                 // Row(
                                 //   children: [
                                 //     Spacer(),
                                 //     Wrap(
                                 //       spacing: 4,
                                 //       children: [
                                 //         ClipOval(
                                 //           child: Container(
                                 //             color: ColorRes.greyColor,
                                 //           ),
                                 //         ),
                                 //         ClipOval(
                                 //           child: Container(
                                 //             color: ColorRes.greyColor,
                                 //           ),
                                 //         ),
                                 //         ClipOval(
                                 //           child: Container(
                                 //             color: ColorRes.greyColor,
                                 //           ),
                                 //         ),
                                 //       ],
                                 //     )
                                 //   ],
                                 // )
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
                 );
               }
           ),
         ),
         const SizedBox(height: 17),
          Container(
            margin: const EdgeInsets.only(right: 24, bottom: 18),
            child: GestureDetector(
              onTap: (){
               AllActionSheet().showSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(Strings.textSeeAllActions,
                  style: CommonUi.customTextStyle(fontFamily: Fonts.bold, fontSize: 17, color: ColorRes.buttonColor),),
                  const SizedBox(width: 2),
                  Image.asset(CommonUi.setPngImage("forward_icon"),height: 12,width: 14),
                ],
              ),
            ),
          )
       ],
     );
   }




}

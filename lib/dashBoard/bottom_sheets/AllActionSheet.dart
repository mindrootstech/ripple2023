

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../helper/constants/ColorRes.dart';
import '../../helper/constants/CommonUi.dart';
import '../../helper/constants/fonts.dart';
import '../../helper/constants/strings.dart';

class AllActionSheet{

  void showSheet(){
    Get.bottomSheet(
      Container(
        margin: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),
        height: Get.height/1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Stack(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Image.asset(CommonUi.setPngImage("close_icon"),height: 30,width: 30),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(Strings.textAllActions, style: CommonUi.customTextStyle(
                    fontFamily: Fonts.bold, fontSize: 20,
                  )
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 1.5,
              width: Get.width,
              color: ColorRes.noProgressColor,
            ),
            Container(
              margin: const EdgeInsets.only(top: 24,bottom:24 ),
              height: 50,
              width: Get.width,
              decoration: CommonUi.getBorderRadius(5.0, Colors.white, borderColor: ColorRes.lightTextColor),
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(CommonUi.setSvgImage("search_icon"), color: ColorRes.colorBlack),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 50,
                        child:
                        TextFormField(
                          // controller: controller.searchEditTextController.value,
                          onChanged: (value) {},
                          onFieldSubmitted: (val) {},
                          style: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize :14),
                          decoration: InputDecoration(
                            hintText: Strings.textSearchActionBusiness,
                            hintStyle: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize :14,
                                color:  ColorRes.onboardIndicatorNonActiveColor),
                            border: InputBorder.none,
                          ),
                          textCapitalization: TextCapitalization.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Container(
                        height: 50,
                        color: ColorRes.noProgressColor,
                        width: 1,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Image.asset(CommonUi.setPngImage("filter_icon"),height: 24,width: 24),
                    const SizedBox(width: 14)
                  ],
                ),
              ),
            ),

            getCategoryListView(),

            getActionsList(),
          ],
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      persistent: false,
      enableDrag: false,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only( topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
      ),
    );
  }





  Widget getCategoryListView(){
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification notify){
        notify.disallowIndicator();
        return true;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Strings.textCategories, style: CommonUi.customTextStyle(fontFamily: Fonts.semiBold,
              fontSize: 18),),
          Container(
            margin: const EdgeInsets.only(top: 16,bottom:24 ),
            height: 160,
            width: Get.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 120,
                  width: 160,
                  margin: EdgeInsets.only(right: index == 9 ? CommonUi.marginLeftRight : 10, left: index == 0 ? CommonUi.marginLeftRight : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(imageUrl: 'https://picsum.photos/250?image=18')),
                      index == 0 ?  Positioned(
                          top: 16,
                          left: 19,
                          child: Text("Category 1",
                            style: CommonUi.customTextStyle(fontFamily: Fonts.bold, fontSize: 13,
                                color: ColorRes.white),)) : const SizedBox(),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Container(
                          padding: const EdgeInsets.only(left: 20,right: 20, top: 3, bottom: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: ColorRes.colorLightGrey
                          ),
                          child: Text('20 Actions',
                            style: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize: 13,
                                color: ColorRes.colorBlack),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ) ;

  }

  Widget getActionsList(){
    return Column(
      children: [
        Text(Strings.textActions, style: CommonUi.customTextStyle(fontFamily: Fonts.semiBold, fontSize: 18),),
        const SizedBox(height: 16),
        Expanded(
          child: SizedBox(
            width: Get.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.2,
                  mainAxisSpacing: 15),
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin:  EdgeInsets.only(left: CommonUi.marginLeftRight , right: CommonUi.marginLeftRight),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 168,
                              height: 200,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
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
                                  color: ColorRes.colorGray,
                                ),

                                Container(
                                    width: Get.width,
                                    margin: const EdgeInsets.only(right: 5, top: 10),
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Image.asset(CommonUi.setPngImage("three_dots_icon"), height: 5,width: 25))),
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
              },
            ),
          ),
        ),
      ],
    );
  }


}


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/dashBoard/home/controller/HomeController.dart';
import 'package:ripplefect/helper/common_classes/CommonLoader.dart';
import '../../helper/constants/ColorRes.dart';
import '../../helper/constants/CommonUi.dart';
import '../../helper/constants/fonts.dart';
import '../../helper/constants/strings.dart';
import '../routes/AppRoutes.dart';

class AllActionSheet{
 var controller=Get.find<HomeController>();

  void showSheet(){
    if(controller.searchActionTextController.text!=''||controller.selectedCatId.value!=''){
      controller.searchActionTextController.text='';
      controller.filterActionList.clear();
      controller.currentPage=1;
      controller.selectedCatId.value='';
      controller.selectedCatIndex.value=1000;
      controller.getFilterActionImplementation('',controller.selectedCatId.value,1,CommonUi.paginationLimit);
    }

    Get.bottomSheet(
      Container(
        margin: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),
        height: Get.height/1.1,
        child: GetX<HomeController>(
          builder: (controller) {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   getHeaderPart(),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: controller.actionScrollController,
                        child:
                           Column(
                            children: [
                              if(controller.filterCategoryList.isNotEmpty)...{
                                getCategoryListView(),
                              },

                                getActionsList(),


                            ],
                          )
                      ),
                    ),

                  ],
                ),

              ],
            );
          }
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
            height: 120,
            width: Get.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.filterCategoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Obx(()=>
                   GestureDetector(
                     onTap: (){
                       controller.selectedCatIndex.value=index;
                       controller.filterActionList.clear();
                       controller.currentPage=1;
                       controller.selectedCatId.value=controller.filterCategoryList[index].categoryId.toString();
                       controller.searchActionTextController.text='';
                       controller.getFilterActionImplementation('',controller.selectedCatId.value,1,CommonUi.paginationLimit);                     },
                     child: Container(
                      width: 160,
                      margin: const EdgeInsets.only(right:  10),
                      decoration: CommonUi.getBorderRadius(10, Colors.transparent,borderColor: controller.selectedCatIndex.value==index?ColorRes.colorGreen:Colors.transparent,borderWidth: 2),
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 120,
                                  width: 160,
                                  color: ColorRes.colorGreyLight,
                                  child: CachedNetworkImage(imageUrl: controller.filterCategoryList[index].image,
                                  fit: BoxFit.fill),

                              ),
                          ),
                            Container(
                              color: ColorRes.lightBlackColor,
                            ),
                            Positioned(
                              top: 16,
                              left: 19,
                              child: Text(controller.filterCategoryList[index].name,
                                style: CommonUi.customTextStyle(fontFamily: Fonts.bold, fontSize: 15,
                                    color: ColorRes.white),)) ,
                          Positioned(
                            bottom: 16,
                            left: 16,
                            child: Container(
                              padding: const EdgeInsets.only(left: 20,right: 20, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: ColorRes.colorLightGrey
                              ),
                              child: Text('${controller.filterCategoryList[index].total} Actions',
                                style: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize: 13,
                                    color: ColorRes.colorBlack),
                              ),
                            ),
                          )
                        ],
                      ),
                  ),
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
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Strings.textActions, style: CommonUi.customTextStyle(fontFamily: Fonts.semiBold, fontSize: 18),),
          const SizedBox(height: 16),
          if(controller.filterActionList.isNotEmpty&&!controller.loader.value)...{
            SizedBox(
              width: Get.width,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1/1.4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15),
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: controller.filterActionList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      Get.back();
                      Get.toNamed(AppRoutes.productDetail);
                    },
                    child: Container(
                      decoration: CommonUi.getBorderRadius(8.0, Colors.transparent,borderWidth: 1.0, borderColor: ColorRes.noProgressColor),
                      // margin:  EdgeInsets.only(left: CommonUi.marginLeftRight , right: CommonUi.marginLeftRight),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  // height: 200,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                                    child: Image.network(
                                      controller.filterActionList[index].mainImage,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(CommonUi.setPngImage("test_company"), height: 16,width: 45),
                                        Container(
                                          padding:const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                                          decoration: CommonUi.curvedBoxDecoration(backgroundColor: ColorRes.appColor),
                                          child: Text("${controller.filterActionList[index].points} Pts",style: CommonUi.customTextStyle(fontFamily: Fonts.bold,fontSize: 11,color: Colors.white),),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      height:40,
                                      padding: const EdgeInsets.only(left: 0, right: 8),
                                      child: Text(controller.filterActionList[index].title??'',
                                        maxLines: 2,
                                        textAlign: TextAlign.start,style: CommonUi.customTextStyle(fontFamily: Fonts.semiBold,fontSize: 15),),
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
                    ),
                  );
                },
              ),
            ),
          }else if(controller.loader.value)...{
            Container(
              margin: const EdgeInsets.only(top: 100),
              child:const Center(child: CircularProgressIndicator()) ,
            ),

          }


        ],
      ),
    );
  }

 Widget getHeaderPart() {
    return Column(
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
                    child: TextFormField(
                      controller: controller.searchActionTextController,
                      onChanged: (value) {},
                      onFieldSubmitted: (val) {
                        controller.filterActionList.clear();
                        controller.selectedCatId.value='';
                        controller.selectedCatIndex.value=1000;
                        controller.getFilterActionImplementation(val,controller.selectedCatId.value,1,CommonUi.paginationLimit);
                      },
                      style: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize :14),
                      decoration: InputDecoration(
                        hintText: Strings.textSearchActionBusiness,
                        hintStyle: CommonUi.customTextStyle(fontFamily: Fonts.medium, fontSize :14, color:  ColorRes.onboardIndicatorNonActiveColor),
                        border: InputBorder.none,
                      ),
                      textCapitalization: TextCapitalization.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
 }


}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../helper/constants/ColorRes.dart';
import '../../helper/constants/CommonUi.dart';
import '../../helper/constants/fonts.dart';
import '../../helper/constants/strings.dart';
import '../home/controller/HomeController.dart';

class FiltersSheet{

  var controller=Get.find<HomeController>();

  void showSheet(){
    Get.bottomSheet(
      SizedBox(
        height: Get.height/1.8,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHeaderPart(),
            Expanded(
              child: Obx(()=>
                 Row(
                  children: [
                   Expanded(flex:1,child: filterTypeList(controller)),

                    if(controller.actionSelected.value)...{
                      Expanded(flex:2,child: filterValuesList(controller.actionTypeList,controller))
                    }else if(controller.timeSelected.value)...{
                      Expanded(flex:2,child: filterValuesList(controller.timeList,controller))
                    }else...{
                      Expanded(flex:2,child: filterValuesList(controller.categoriesList,controller))
                    }

                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 72,
              width: Get.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text('Clear all',style: CommonUi.customTextStyle(fontFamily: Fonts.semiBold,fontSize: 17,color: ColorRes.buttonColor),)),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: CommonUi.customButtonSmall(buttonText: "Show 10 results",padding: 10.0,fontSize: 14.0),
                    ),
                  )
                ],
              ),
            )

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


  Widget getHeaderPart() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Filters", style: CommonUi.customTextStyle(
                  fontFamily: Fonts.semiBold, fontSize: 23,
                )
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Image.asset(CommonUi.setPngImage("close_icon"),height: 30,width: 30),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            height: 1.5,
            width: Get.width,
            color: ColorRes.noProgressColor,
          ),
        ],
      ),
    );
  }


}

Widget filterTypeList(HomeController controller) {
  return Container(
    color: Colors.black12,
    child: Obx(()=>
       Column(
        children: [
          GestureDetector(
            onTap: (){
              controller.actionSelected.value=true;
              controller.timeSelected.value=false;
              controller.categoriesSelected.value=false;
            },
            child: getTitleText('Action Type',controller.actionSelected.value),
          ),
          GestureDetector(
            onTap: (){
              controller.actionSelected.value=false;
              controller.timeSelected.value=true;
              controller.categoriesSelected.value=false;
            },
            child: getTitleText('Time',controller.timeSelected.value),
          ),
          GestureDetector(
            onTap: (){
              controller.actionSelected.value=false;
              controller.timeSelected.value=false;
              controller.categoriesSelected.value=true;
            },
            child: getTitleText('Categories',controller.categoriesSelected.value),
          )
        ],
      ),
    ),
  );
}

Widget getTitleText(String text, bool isSelected) {
  return Row(
    children: [
      if(isSelected)...{
        Container(
          height: 50,
          width: 4,
          color: ColorRes.buttonColor,
        ),
      },

      Expanded(
        child: Container(
          height: 50,
          // width: double.infinity,
          color:isSelected? Colors.white:Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child:  Center(child: Text(text,style: CommonUi.customTextStyle(fontSize: 15,fontFamily: Fonts.semiBold),)),
        ),
      ),
    ],
  );

}


Widget filterValuesList(List<String> list, HomeController controller) {
  return Column(
    children: [
      if(controller.categoriesSelected.value)...{
        Container(
          margin: const EdgeInsets.only(top: 16),
          padding: EdgeInsets.only(left: CommonUi.marginLeftRight, right: CommonUi.marginLeftRight),
          child: SizedBox(
          width: Get.width,
          child: Stack(
            children: [
              TextFormField(
                style: CommonUi.customTextStyle(),
                // controller: controller.passField,
                // obscureText: !controller.passVisible.value,
                decoration: CommonUi.textFieldDecoration(hintText: Strings.textSearchHint2,
                    passwordVisible: null,contentLeft: 48,verticalSpace:0.0),
              ),
              Positioned(
                  top: 0,
                  bottom: 0,
                  left: 20,
                  child: SvgPicture.asset(CommonUi.setSvgImage('search_icon'))),

            ],
          ),
        ),
        ),
      },
      Expanded(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context,index){
          return Container(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Obx(()=>
                   Checkbox(
                    value: controller.showCheckValue.value,
                    activeColor: ColorRes.buttonColor,
                    onChanged: (value) {
                      controller.showCheckValue.value=value??false;
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child:  Text(list[index],style: CommonUi.customTextStyle(fontSize: 15,fontFamily: Fonts.semiBold),),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    ],
  );
}
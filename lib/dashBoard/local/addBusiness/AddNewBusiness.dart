import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import '../../../helper/constants/CommonUi.dart';
import '../../../helper/constants/fonts.dart';
import '../../../helper/constants/strings.dart';

class AddNewBusiness extends StatelessWidget {
  const AddNewBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorRes.appColor,
        title: Text(
          "Add Business",
          style: CommonUi.customTextStyle(
              fontSize: 20, fontFamily: Fonts.semiBold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 24, 20, 0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.fromLTRB(0,0,0, 20),
                    decoration: CommonUi.curvedBoxDecoration(backgroundColor: ColorRes.colorLightGrey),
                      child: Text(
                    "Get 2x points when you sign up a business & are the first to complete an action there!",
                    style: CommonUi.customTextStyle(
                        fontSize: 13, fontFamily: Fonts.semiBold, color: Colors.black),textAlign: TextAlign.center,
                  )),
                  Text(
                    Strings.name, style: CommonUi.customTextStyle(
                      fontFamily: Fonts.semiBold, fontSize: 20),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    // controller: controller.rNameField,
                    decoration: CommonUi.textFieldDecoration(
                        hintText: Strings.enterBusinessName),
                  ),
                  const SizedBox(height: 16,),
                  Text(Strings.category,
                    style: CommonUi.customTextStyle(
                        fontFamily: Fonts.semiBold, fontSize: 20),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    // controller: controller.rNameField,
                    decoration: CommonUi.textFieldDecoration(
                        hintText: Strings.enterBusinessName),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    // controller: controller.rEmailField,
                    decoration: CommonUi.textFieldDecoration(
                        hintText: Strings.enterBusinessCategoryName),
                  ),
                  const SizedBox(height: 16,),
                  Text(Strings.description,
                    style: CommonUi.customTextStyle(
                        fontFamily: Fonts.semiBold, fontSize: 18),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    minLines: 5,
                    maxLines: 20,
                    // obscureText: !controller.passVisible.value,
                    // controller: controller.rPassField,
                    decoration: CommonUi.textFieldDecoration(
                      hintText: Strings.descriptionHint),
                  ),
                  const SizedBox(height: 16,),
                  Text(Strings.link,
                    style: CommonUi.customTextStyle(
                        fontFamily: Fonts.semiBold, fontSize: 20),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    // controller: controller.rEmailField,
                    decoration: CommonUi.textFieldDecoration(
                        hintText: Strings.linkHint),
                  ),



                ],
              ),
            ),


            Expanded(
              child: Align(alignment: Alignment.bottomCenter,
                child:  Container(
                  height: 50,
                  margin: EdgeInsets.only(left: CommonUi.marginLeftRight,right: CommonUi.marginLeftRight,bottom: CommonUi.marginLeftRight),
                  child: CommonUi.customButton(buttonText: Strings.next,callBack: () {
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

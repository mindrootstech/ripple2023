import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import 'package:ripplefect/myProfile/controller/MyProfileController.dart';
import '../../helper/bottom_sheets/ChooseCameraSheet.dart';
import '../../helper/common_classes/InputValidationMixin.dart';
import '../../helper/dialogs/DeleteAccDialog.dart';

class MyProfileView extends StatelessWidget with InputValidationMixin {
  MyProfileView({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();
  var controller = Get.find<MyProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            SizedBox(
              width: Get.width,
              child: SvgPicture.asset(
                CommonUi.setSvgImage("app_bg"),
                fit: BoxFit.cover,
                width: Get.width,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              decoration: CommonUi.curvedBoxDecoration(topLeft: 20, topRight: 20, backgroundColor: Colors.white),
              child: SingleChildScrollView(
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getHeaderPartView(),
                      getFieldsBottomViewPart(context),
                    ],
                  ),
                ),
              ),
            ),

            // if(controller.loader.value)...{
            //   const CommonLoader()
            // }
          ],
        ),
      ),
    );
  }

  Widget getHeaderPartView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: CommonUi.marginLeftRight, vertical: 17),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                          CommonUi.setSvgImage("circle_close_icon")))),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'My Profile',
                  style: CommonUi.customTextStyle(
                      fontFamily: Fonts.semiBold, fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: Get.width,
          color: ColorRes.colorWhiteGrey,
        ),
        GestureDetector(
          onTap: () {
            ChooseCameraSheets().showSheet();
          },
          child: Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 25),
              width: 95,
              height: 95,
              child: Stack(
                children: [
                  SizedBox(
                      width: 88,
                      height: 88,
                      child: Container(
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorRes.colorGreen2, width: 2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: controller.imagePath.value == ''
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  child: CachedNetworkImage(
                                    imageUrl: controller.mediaImagePath.value,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>Container(
                                      color: ColorRes.textFieldOutlineColor,
                                      width: 88,
                                      height: 88,
                                    ),
                                    errorWidget: (context, url, error) =>Container(
                                      color: ColorRes.textFieldOutlineColor,
                                      width: 88,
                                      height: 88,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: FileImage(File(controller.imagePath.value)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                      ),
                  Positioned(
                    right: 2,
                    bottom: 20,
                    child: SvgPicture.asset(
                        CommonUi.setSvgImage("plus_blue_icon")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getTextFields(String tittle, String hint,TextEditingController textController, bool obscureText, String? Function(String? value) validateError, {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          tittle,
          style: CommonUi.customTextStyle(
              fontFamily: Fonts.semiBold, fontSize: 18.0),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: validateError,
          controller: textController,
          keyboardType: keyboardType,
          decoration: CommonUi.textFieldDecoration(hintText: hint),
          obscureText: obscureText,
        ),
      ],
    );
  }

  Widget getDescTextFields(String tittle, String hint,TextEditingController textController, bool obscureText, String? Function(String? value) validateError, {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          tittle,
          style: CommonUi.customTextStyle(
              fontFamily: Fonts.semiBold, fontSize: 18.0),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: textController,
          minLines: 6,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: CommonUi.textFieldDecoration(hintText: hint),
          obscureText: obscureText,
        ),
      ],
    );
  }


  String? validateNameError(String? value) {
    if (isNameValid(value ?? '')) {
      return null;
    } else {
      return Strings.textYourName;
    }
  }

  String? validateEmailError(String? value) {
    if (isEmailValid(value ?? '')) {
      return null;
    } else {
      return Strings.textValidEmail;
    }
  }

  String? validateMobileError(String? value) {
    if (isMobileValid(value ?? '')) {
      return null;
    } else {
      return Strings.textYourMobile;
    }
  }

  String? validateNullError(String? value) {
    return null;
  }

  Widget getFieldsBottomViewPart(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),
      child: Column(
        children: [
          getTextFields(Strings.textName, Strings.textEnterName, controller.nameController, false, validateNameError),
          getTextFields(Strings.textEmail, Strings.textEnterEmail, controller.emailController, false, validateEmailError),
          getTextFields(Strings.textPassword, "********", controller.passController, true, validateNullError),
          getTextFields(Strings.textMobileNumber, Strings.textEnterMobileNumber, controller.mobileController, false, validateMobileError, keyboardType: TextInputType.number),
          getTextFields(Strings.textCity, Strings.textEnterCityName, controller.cityController, false, validateNullError),
          getTextFields(Strings.textCountry, Strings.textEnterCountryName, controller.countryController, false, validateNullError),
          getDescTextFields(Strings.textDescription, Strings.textEnterHere, controller.descriptionController, false, validateNullError),
          getTextFields(Strings.textWhatIs, Strings.textOurChildren, controller.whatYouController, false, validateNullError),
          getTextFields(Strings.textWhatYourWant, Strings.textReduceMyWaste, controller.whatYouWantController, false, validateNullError),
          getTextFields(Strings.textGoal, Strings.textEnterHere, controller.goalController, false, validateNullError),
          const SizedBox(height: 35,
          ),
          CommonUi.customButton(
              buttonText: Strings.textUpdate,
              fontSize: 18.0,
              callBack: () {
                FocusScope.of(context).unfocus();
                if (formGlobalKey.currentState!.validate()) {
                  // controller.loginApiImplementation(1, '');
                }
              }),
          const SizedBox(
            height: 11,
          ),
          Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () {
                    DeleteAccDialog().showDialog();
                  },
                  child: Text(
                    Strings.textDeleteAccount,
                    style: CommonUi.customTextStyle(
                        fontSize: 16,
                        fontFamily: Fonts.medium,
                        color: ColorRes.buttonColor),
                  ))),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

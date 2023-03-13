import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';
import 'package:ripplefect/myProfile/controller/MyProfileController.dart';
import '../../helper/bottom_sheets/ChooseCameraSheet.dart';
import '../../helper/common_classes/CommonLoader.dart';
import '../../helper/common_classes/InputValidationMixin.dart';
import '../../helper/dialogs/DeleteAccDialog.dart';

class MyProfileView extends StatelessWidget with InputValidationMixin {
  MyProfileView({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();
  var controller = Get.find<MyProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SizedBox(
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

            Obx(() {
              if(controller.loader.value){
                return const CommonLoader();
              }else{
                return const SizedBox();
              }
            }),

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

  Widget getTextFields(String tittle, String hint,TextEditingController textController, bool obscureText, String? Function(String? value) validateError, {TextInputType? keyboardType,bool enable=true }) {
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
        GestureDetector(
          onTap: (){
            if(enable==false&&!obscureText) {
              if (hint == Strings.textOurChildren) {
                Get.toNamed(AppRoutes.goalOnBoard, arguments: [ 'profile', 0])?.then((value) {
                      controller.whatYouController.text=value.name;
                });
              }else if(hint == Strings.textReduceMyWaste){
              Get.toNamed(AppRoutes.goalOnBoard, arguments: [ 'profile', 1])?.then((value) {
                var result='';
                for(int i=0;i<controller.service.selectedMore.length;i++){
                  result ="${controller.service.selectedMore[i].name},$result";
                  print('avsdhasfdsfd gdhsvvdh');
                }
                controller.whatYouWantController.text=result;
              });
            }else if(hint ==Strings.textEnterHere){
              Get.toNamed(AppRoutes.goalOnBoard, arguments: [  'profile',  2])?.then((value) {
                controller.goalController.text=value.name;
              });
            }}
          },
          child: TextFormField(
            enabled: enable,
            validator: validateError,
            controller: textController,
            keyboardType: keyboardType,
            decoration: CommonUi.textFieldDecoration(hintText: hint),
            obscureText: obscureText,

          ),
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
          getTextFields(Strings.textPassword, "********", controller.passController, true, validateNullError,enable: false),
          getTextFields(Strings.textMobileNumber, Strings.textEnterMobileNumber, controller.mobileController, false, validateMobileError, keyboardType: TextInputType.number),
          getTextFields(Strings.textCity, Strings.textEnterCityName, controller.cityController, false, validateNullError),
          getCountryTextFields(Strings.textCountry,Strings.textEnterCountryName, context),
          getDescTextFields(Strings.textDescription, Strings.textEnterHere, controller.descriptionController, false, validateNullError),
          getTextFields(Strings.textWhatIs, Strings.textOurChildren, controller.whatYouController, false, validateNullError,enable: false),
          getTextFields(Strings.textWhatYourWant, Strings.textReduceMyWaste, controller.whatYouWantController, false, validateNullError,enable: false),
          getTextFields(Strings.textGoal, Strings.textEnterHere, controller.goalController, false, validateNullError,enable: false),
          const SizedBox(height: 35,),
          CommonUi.customButton(
              buttonText: Strings.textUpdate,
              fontSize: 18.0,
              callBack: () {
                FocusScope.of(context).unfocus();
                if (formGlobalKey.currentState!.validate()) {
                  controller.updateProfileApiImplementation();
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
            height: 30,
          ),
        ],
      ),
    );
  }

 Widget getCountryTextFields(String textCountry,String hint, BuildContext context, ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          textCountry,
          style: CommonUi.customTextStyle(
              fontFamily: Fonts.semiBold, fontSize: 18.0),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: (){
            showCountryPicker(
              context: context,
              countryListTheme: CountryListThemeData(
                flagSize: 25,
                backgroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
                bottomSheetHeight: 500, // Optional. Country list modal height
                //Optional. Sets the border radius for the bottomsheet.
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                //Optional. Styles the search field.
                inputDecoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              onSelect: (Country country) {
                controller.selectedCountry.value=  country.displayName;
                controller.countryController.text=  country.displayName;
              },
            );
          },
          child: Container(
            width: Get.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: CommonUi.getBorderRadius(4.0, ColorRes.white,borderWidth: 1.0,borderColor: ColorRes.textFieldOutlineColor),
            child: Obx(()=>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  if(controller.selectedCountry.value!='')...{
                    Text(controller.selectedCountry.value,style: CommonUi.customTextStyle(),),
                  }else...{
                    Text(hint,style: CommonUi.customTextStyle(color: ColorRes.greyColor),),
                  },

                  const Icon(Icons.keyboard_arrow_down_sharp),
                ],
              ),
            ),
          ),
        )
      ],
    );
 }
}

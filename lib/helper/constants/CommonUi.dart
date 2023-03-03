import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'ColorRes.dart';
import 'fonts.dart';

class CommonUi {
  static var marginLeftRight=22.0;

  static String setPngImage(String name) {
    return "assets/images/$name.png";
  }

  static String setSvgImage(String name) {
    return "assets/svgs/$name.svg";
  }

  static String setLottie(String lottie) {
    return 'assets/lottie/$lottie.json';
  }




  static customLayout({required String title,required Widget child,Function? onBack, bool isBack=true}) {
    return Stack(
        children: [
          SizedBox(
            width: Get.width,
            child: SvgPicture.asset(CommonUi.setSvgImage("app_bg"),fit: BoxFit.cover,
              width: Get.width,),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(isBack)...{
                  GestureDetector(
                    onTap: () {
                      if(onBack!=null){
                        onBack.call();
                      }else{
                        Get.back();
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20,top: 12,bottom: 16),
                      child: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                    ),
                  ),
                }else...{
                  const SizedBox(
                    height: 50,
                  )
                },

                Padding(
                  padding: const EdgeInsets.only(left: 24.0,bottom: 16),
                  child: Text(title,style: CommonUi.customTextStyle(fontSize: 24,fontFamily: Fonts.semiBold,color: Colors.white),),
                ),
                Expanded(
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(left: 30.0, top: 20, right: 30),
                    decoration: CommonUi.curvedBoxDecoration(topLeft: 20,topRight: 20,backgroundColor: Colors.white),
                    child: child,
                  ),
                )
              ],
            ),
          ),

        ]);
  }



  static TextStyle customTextStyle(
      {String fontFamily = Fonts.regular,
        double fontSize = 14.0,
        TextDecoration decoration = TextDecoration.none,
        Color color = ColorRes.colorBlack}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: double.parse(fontSize.toString()),
        decoration: decoration,
        color: color);
  }

  static GestureDetector customButton({String buttonText = "Next",fontSize =20.0,padding=12.0,Function? callBack}) {
    return GestureDetector(
      onTap: () {
        callBack?.call();
      },
      child: Container(
        padding: EdgeInsets.only(top: padding,bottom: padding),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        width: Get.width,
        decoration: CommonUi.curvedBoxDecoration(backgroundColor: ColorRes.buttonColor),
        child: Center(child: Text(buttonText,style: CommonUi.customButtonTextStyle(fontSize: fontSize),)),
      ),
    );
  }

  static GestureDetector customButtonSmall({String buttonText = "Next",fontSize =20.0,padding=12.0,Function? callBack}) {
    return GestureDetector(
      onTap: () {
        callBack?.call();

      },
      child: Container(
        padding: EdgeInsets.only(top: padding,bottom: padding),
        width: Get.width,
        decoration: CommonUi.curvedBoxDecoration(backgroundColor: ColorRes.buttonColor),
        child: Center(child: Text(buttonText,style: CommonUi.customButtonTextStyle(fontSize: fontSize),)),
      ),
    );
  }

  static TextStyle customButtonTextStyle(
      {String fontFamily = Fonts.semiBold,
        required double fontSize,
        TextDecoration decoration = TextDecoration.none,
        Color textColor = ColorRes.white}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: double.parse(fontSize.toString()),
        decoration: decoration,
        color: textColor);
  }

  static curvedBoxDecoration(
      {double topLeft = 4.0,
        double topRight = 4.0,
        double bottomLeft = 4.0,
        double bottomRight = 4.0,
        backgroundColor = ColorRes.white}) {
    return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight)));
  }

  static curvedBoxDecorationWithShadow(
      {double radius = 20.0,
        backgroundColor = ColorRes.white,
        Color shadowColor=ColorRes.greyColor,
        double spreadRadius=2.0,
        double blurRadius= 5.0,
        double  offsetX=0.0,
        double offsetY=0.0,

      }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      boxShadow:  [
        BoxShadow(
          color: shadowColor,
          spreadRadius: spreadRadius,
          blurRadius: blurRadius,
          offset: Offset(offsetX, offsetY),
        ),
      ],
    );
  }

  static roundedButton(
      {text,
        width,
        height,
        backgroundColor = ColorRes.bluecolor,
        radius = 50.0,
        textColor = ColorRes.white,
        textSized = 14,
        showBorder = false,
        borderColor = ColorRes.bluecolor,
        margin = 70.0,
        onPressed}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: TextButton(
        style: TextButton.styleFrom(
          fixedSize: Size(width, height),
          side: BorderSide(
              color: showBorder ? borderColor : backgroundColor, width: 1),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: CommonUi.customTextStyle(
              color: textColor,
              fontSize: textSized,
              fontFamily: Fonts.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static roundedDecorationWithBorder(
      {outLineColor = ColorRes.greyColor,
        bgColor = ColorRes.greyColor,
        radius = 10.0,
        borderWidth = 1.0}) {
    return BoxDecoration(
        color: bgColor,
        border: Border.all(color: outLineColor, width: borderWidth),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  static roundedDecorationWithBorderRadius(
      {outLineColor = ColorRes.greyColor,
        bgColor = ColorRes.greyColor,
        topLeft = 0.0,
        topRight = 0.0,
        bottomLeft = 0.0,
        bottomRight = 0.0,
        borderWidth = 1.0}) {
    return BoxDecoration(
        color: bgColor,
        border: Border(
          top: BorderSide(width: borderWidth, color: outLineColor),
          left: BorderSide(width: borderWidth, color: outLineColor),
          right: BorderSide(width: borderWidth, color: outLineColor),
          bottom: BorderSide(width: borderWidth, color: outLineColor),
        ),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(topLeft),topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),bottomRight: Radius.circular(bottomRight))
    );
  }

  static textFieldDecoration(
      {
        outlineColor = ColorRes.textFieldOutlineColor,
        errorColor = ColorRes.colorRed,
        cornerRadius = 4.0,
        hintText = "",
        fillColor = ColorRes.white,
        verticalSpace = 14.0,
        isPass = false,
        RxBool? passwordVisible,
        double contentLeft=10.0
      }) {
    return InputDecoration(
      counterText: "",
      fillColor: fillColor,
      focusColor: fillColor,
      filled: true,
      suffixIcon: isPass ? IconButton(
          onPressed: () {
            passwordVisible?.value = !passwordVisible.value;
          },
          icon: passwordVisible?.value==false ?
           SvgPicture.asset(setSvgImage("eye_close")):const Icon(Icons.remove_red_eye_outlined,
            size: 25,)
      ) : const SizedBox(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        borderSide: BorderSide(
          color: outlineColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        borderSide: BorderSide(
          color: outlineColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        borderSide: BorderSide(
          color: errorColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        borderSide: BorderSide(
          color: errorColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        borderSide: BorderSide(
          color: outlineColor,
        ),
      ),
      labelStyle: CommonUi.customTextStyle(),
      contentPadding: EdgeInsets.only(left: contentLeft, top: verticalSpace,bottom:verticalSpace ),
      hintStyle: CommonUi.customTextStyle(color: ColorRes.greyColor),
      isDense: true,
      hintText: hintText,
    );
  }

  static textFieldDecorationWithText(
      {outlineColor = ColorRes.greyColor,
        cornerRadius = 10.0,
        hintText = "",
        fillColor = ColorRes.greyColor,
        verticalSpace = 10.0,
        prefixWidth = 20.0,
        suffixWidth = 20.0,
        String prefixText = '',
        String suffixText = ''}) {
    return InputDecoration(
        counterText: "",
        fillColor: fillColor,
        focusColor: fillColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
          borderSide: BorderSide(
            color: outlineColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
          borderSide: BorderSide(
            color: outlineColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
          borderSide: BorderSide(
            color: outlineColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
          borderSide: BorderSide(
            color: outlineColor,
          ),
        ),
        contentPadding:
        EdgeInsets.symmetric(horizontal: 0, vertical: verticalSpace),
        hintStyle: CommonUi.customTextStyle(color: ColorRes.greyColor),
        isDense: true,
        hintText: hintText,
        prefixIconConstraints: BoxConstraints(
          minWidth: prefixWidth,
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: suffixWidth,
        ),
        prefixIcon: prefixText.isEmpty
            ? const SizedBox()
            : Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(prefixText,
                style: CommonUi.customTextStyle(
                    fontSize: 16))),
        suffixIcon: suffixText.isEmpty
            ? const SizedBox()
            : Container(
            margin: const EdgeInsets.only(right: 10),
            child: Text(suffixText,
                style: CommonUi.customTextStyle(
                    fontSize: 16))),
        prefixStyle: CommonUi.customTextStyle(color: ColorRes.colorBlack));
  }

  static textFieldDecorationWithIcon(
      {outlineColor = ColorRes.textFieldOutlineColor,
        filledColor = ColorRes.white,
        cornerRadius = 10.0,
        hintText = "",
        hintIconColor = ColorRes.greyColor,
        showSuffix = false,
        onSuffixTap}) {
    return InputDecoration(
      counterText: "",
      fillColor: filledColor,
      focusColor: filledColor,
      filled: true,
      prefixIcon: Icon(Icons.search, color: hintIconColor, size: 30),
      suffixIcon: showSuffix
          ? GestureDetector(
          onTap: onSuffixTap,
          child: Icon(Icons.clear, color: hintIconColor, size: 30))
          : const SizedBox(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        borderSide: BorderSide(
          color: outlineColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        borderSide: BorderSide(
          color: outlineColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        borderSide: BorderSide(
          color: outlineColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        borderSide: BorderSide(
          color: outlineColor,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      hintStyle: CommonUi.customTextStyle(color: hintIconColor),
      isDense: true,
      hintText: hintText,
    );
  }

  static showErrorDialog(String title, String message,
      {toastlength = 5, snackPosition = SnackPosition.BOTTOM, backToFirst = false}) {
    if(GetPlatform.isIOS){
      showCupertinoModalPopup<void>(
        context: Get.context!,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title:  Text(title),
          content: Text(message,textAlign: TextAlign.center,style: CommonUi.customTextStyle(),),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                if(backToFirst){
                  Get.until((route){
                    return route.isFirst;
                  });
                }else {
                  Get.back();
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }else{
      showDialog<void>(
        context: Get.context!,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title:  Text(title),
            content: Text(message,textAlign: TextAlign.center,style: CommonUi.customTextStyle(),),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  if(backToFirst){
                    Get.until((route){
                      return route.isFirst;
                    });
                  }else {
                    Get.back();
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }

  static notificationToast(String title, String message,
      [toastLength = 7, snackPosition = SnackPosition.TOP]) {
    Get.snackbar(title, message,
        snackPosition: snackPosition,
        backgroundColor: ColorRes.white,
        duration: Duration(seconds: toastLength));
  }

  // static showToast(String message) {
  //   return Fluttertoast.showToast(
  //       msg: message.tr,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 3,
  //       backgroundColor: ColorRes.colorGrey4,
  //       textColor: Colors.black,
  //       fontSize: 16.0);
  // }

  static customAppBar(
      {title = "",
        showLeading = false,
        showAction = false,
        actionIcon = "",
        onLeadingPressed,
        onActionPressed}) {
    return AppBar(
      backgroundColor: ColorRes.bluecolor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
      leading: showLeading
          ? GestureDetector(
          onTap: onLeadingPressed,
          child: const Icon(Icons.arrow_back_ios_new_rounded))
          : Container(),
      title: Text(
        title,
        style: CommonUi.customTextStyle(
            color: ColorRes.white,
            fontSize: 18,
            fontFamily: Fonts.semiBold),
      ),
      actions: [
        showAction
            ? GestureDetector(
          onTap: onActionPressed,
          child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(CommonUi.setSvgImage(actionIcon))),
        )
            : Container()
      ],
    );
  }

  static searchTextField(String hintText, {Function()? prefixTap}) {
    return TextFormField(
      controller: null,
      style: CommonUi.customTextStyle(
        fontSize: 16,
      ),
      cursorColor: ColorRes.colorBlack,
      decoration: InputDecoration(
        counterText: "",
        fillColor: ColorRes.greyColor,
        focusColor: ColorRes.greyColor,
        filled: true,
        suffixIcon: SvgPicture.asset(
          CommonUi.setSvgImage('clear_icon'),
          height: 18,
          width: 18,
          fit: BoxFit.none,
        ),
        prefixIcon: GestureDetector(
          onTap: prefixTap,
          child: SvgPicture.asset(
            CommonUi.setSvgImage('search_icon'),
            height: 18,
            width: 18,
            fit: BoxFit.none,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: ColorRes.greyColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: ColorRes.greyColor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: ColorRes.greyColor,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: ColorRes.greyColor,
          ),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintStyle: CommonUi.customTextStyle(color: ColorRes.colorGreen),
        isDense: true,
        hintText: hintText.tr,
      ),
    );
  }


  static Widget loadBannerImages(String? imageUrl) {
    return CachedNetworkImage(
        imageUrl: imageUrl??'',
        fit: BoxFit.cover,
        // height: height,
        // width: width,
        placeholder: (context, url) =>
            Container(color: ColorRes.textFieldOutlineColor),
        errorWidget: (context, url, error) =>
            Container(color: ColorRes.textFieldOutlineColor));



  }

  static customProfileNetworkImage({
    double radius = 100.0,
    double height = 46.0,
    double width = 46.0,
    String imageLink = '',
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
          imageUrl: imageLink,
          fit: BoxFit.cover,
          height: height,
          width: width,
          placeholder: (context, url) =>
              Container(color: ColorRes.greyColor),
          errorWidget: (context, url, error) =>
              Container(color: ColorRes.greyColor)),
    );
  }

  static setTabView(TabController tabController, List<Tab> list, onPressed) {
    return Container(
      height: 45,
      padding: const EdgeInsets.all(4),
      decoration: CommonUi.roundedDecorationWithBorder(
          radius: 5.0,
          bgColor: ColorRes.greyColor,
          outLineColor: ColorRes.greyColor),
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: TabBar(
          controller: tabController,
          indicator: CommonUi.roundedDecorationWithBorder(
              radius: 5.0,
              bgColor: ColorRes.white,
              outLineColor: ColorRes.white),
          labelPadding: const EdgeInsets.symmetric(horizontal: 3.0),
          padding: EdgeInsets.zero,
          labelStyle: CommonUi.customTextStyle(
            fontFamily: Fonts.medium,
            fontSize: 14,
          ),
          unselectedLabelStyle: CommonUi.customTextStyle(
            fontFamily: Fonts.light,
            fontSize: 14,
          ),
          labelColor: ColorRes.bluecolor,
          unselectedLabelColor: ColorRes.colorBlack,
          tabs: list,
          onTap: onPressed,
        ),
      ),
    );
  }

  static Widget getMeasurementText(String text, String value, bool cursor) {
    return Row(
      children: [
        Text(
          '$value ',
          style: CommonUi.customTextStyle(
              fontFamily: Fonts.bold, fontSize: 13),
        ),
        Text(
          text,
          style: CommonUi.customTextStyle(fontSize: 13),
        ),
        if (cursor) ...{
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 15,
            width: 1.5,
            color: ColorRes.colorBlack,
          ),
        }
      ],
    );
  }

  static showToast(String message) {
    return Fluttertoast.showToast(
        msg: message.tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: ColorRes.colorBlack2,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static getBorderRadius(double radius, Color color, {Color borderColor = Colors.transparent,double borderWidth=0.0}){
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
        border: Border.all(
          color: borderColor,
          width:borderWidth,
        )
    );
  }


}





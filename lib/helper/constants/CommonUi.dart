import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'colors.dart';
import 'fonts.dart';
TextView(String text,{Color? color = Colors.white,double? fontSize=16,String? fontFamily=Fonts.regular,
  bool? centerAlign,bool? overFlow,double? letterSpacing,bool? underLine,Function? callBack}) {
  return callBack==null ? _text(text, centerAlign, underLine, letterSpacing, overFlow, color, fontSize, fontFamily) : InkWell(
    onTap: (){
      callBack.call();
    },
    child: _text(text, centerAlign, underLine, letterSpacing, overFlow, color, fontSize, fontFamily),
  );
}

Text _text(String text, bool? centerAlign, bool? underLine, double? letterSpacing, bool? overFlow, Color? color, double? fontSize, String? fontFamily) {
  return Text(
    text,
    textAlign: centerAlign==null ? TextAlign.start : TextAlign.center,
    style: TextStyle(
        decoration: underLine!=null ? TextDecoration.underline : null,
        letterSpacing: letterSpacing ?? null,
        overflow: overFlow!=null ? TextOverflow.ellipsis:null,
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily),
    // overflow: TextOverflow.ellipsis,
  );
}

Widget CustomLayout({required String title,required Widget child,Function? onBack}) {
  return Stack(
      children: [
        SizedBox(
          width: Get.width,
          child: SvgPicture.asset(CommonUi.setSvgImage("app_bg"),fit: BoxFit.fitHeight,),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Padding(
                padding: const EdgeInsets.only(left: 24.0,bottom: 16),
                child: Text(title,style: CommonUi.customTextStyle(fontSize: FontSize.font26,fontFamily: Fonts.semiBold,color: Colors.white),),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  decoration: CommonUi.curvedBoxDecoration(topLeft: 20,topRight: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 20, right: 30),
                    child: child,
                  ),
                ),
              )
            ],
          ),
        ),
      ]);
}

class CommonUi {
  static String setPngImage(String name) {
    return "assets/images/$name.png";
  }

  static String setSvgImage(String name) {
    return "assets/svgs/$name.svg";
  }



  static TextStyle customTextStyle(
      {String fontFamily = Fonts.regular,
      double fontSize = FontSize.font16,
      TextDecoration decoration = TextDecoration.none,
      Color color = MyColors.colorBlack}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        decoration: decoration,
        color: color);
  }

  static GestureDetector customButton({String buttonText = "Next",fontSize =FontSize.font24,Function? callBack}) {
    return GestureDetector(
      onTap: () {
        callBack?.call();

      },
      child: Container(
        padding: EdgeInsets.only(top: 12,bottom: 12),
        width: Get.width,
        decoration: CommonUi.curvedBoxDecoration(backgroundColor: MyColors.buttonColor),
        child: Center(child: Text(buttonText,style: CommonUi.customButtonTextStyle(fontSize: fontSize),)),
      ),
    );
  }

  static TextStyle customButtonTextStyle(
      {String fontFamily = Fonts.semiBold,
      required double fontSize,
      TextDecoration decoration = TextDecoration.none,
      Color textColor = MyColors.white}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        decoration: decoration,
        color: textColor);
  }

  static curvedBoxDecoration(
      {double topLeft = 4.0,
      double topRight = 4.0,
      double bottomLeft = 4.0,
      double bottomRight = 4.0,
      backgroundColor = MyColors.white}) {
    return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight)));
  }

  static curvedBoxDecorationWithShadow(
      {double radius = 20.0, backgroundColor = MyColors.white}) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      boxShadow: const [
        BoxShadow(
          color: MyColors.greyColor,
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 0),
        ),
      ],
    );
  }

  static roundedButton(
      {text,
      width,
      height,
      backgroundColor = MyColors.bluecolor,
      radius = 50.0,
      textColor = MyColors.white,
      textSized = 14,
      showBorder = false,
      borderColor = MyColors.bluecolor,
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
      {outLineColor = MyColors.greyColor,
      bgColor = MyColors.greyColor,
      radius = 10.0,
      borderWidth = 1.0}) {
    return BoxDecoration(
        color: bgColor,
        border: Border.all(color: outLineColor, width: borderWidth),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  static roundedDecorationWithBorderRadius(
      {outLineColor = MyColors.greyColor,
      bgColor = MyColors.greyColor,
      topLeft = 0.0,
      topRight = 0.0,
      bottomLeft = 0.0,
      bottomRight = 0.0,
      borderWidth = 1.0}) {
    return BoxDecoration(
        color: bgColor,
        border: Border.all(color: outLineColor, width: borderWidth),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(topLeft),topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),bottomRight: Radius.circular(bottomRight)));
  }

  static textFieldDecoration(
      {outlineColor = MyColors.textFieldOutlineColor,
      cornerRadius = 4.0,
      hintText = "",
      fillColor = MyColors.white,
      verticalSpace = 14.0, isPass = false,RxBool? passwordVisible,
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
          icon: passwordVisible?.value==true ?
          SvgPicture.asset(setSvgImage("eye_close")) : SvgPicture.asset(setSvgImage("logo"))
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
      labelStyle: CommonUi.customTextStyle(),
      contentPadding:
          EdgeInsets.symmetric(horizontal: 10, vertical: verticalSpace),
      hintStyle: CommonUi.customTextStyle(color: MyColors.greyColor),
      isDense: true,
      hintText: hintText,
    );
  }

  static textFieldDecorationWithText(
      {outlineColor = MyColors.greyColor,
      cornerRadius = 10.0,
      hintText = "",
      fillColor = MyColors.greyColor,
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
        hintStyle: CommonUi.customTextStyle(color: MyColors.greyColor),
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
        prefixStyle: CommonUi.customTextStyle(color: MyColors.colorBlack));
  }

  static textFieldDecorationWithIcon(
      {outlineColor = MyColors.textFieldOutlineColor,
      filledColor = MyColors.white,
      cornerRadius = 10.0,
      hintText = "",
      hintIconColor = MyColors.greyColor,
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
        backgroundColor: MyColors.white,
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
      backgroundColor: MyColors.bluecolor,
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
            color: MyColors.white,
            fontSize: 18,
            fontFamily: Fonts.semiBold),
      ),
      actions: [
        showAction
            ? GestureDetector(
                onTap: onActionPressed,
                child: Container(
                    margin: EdgeInsets.only(right: 20),
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
      cursorColor: MyColors.colorBlack,
      decoration: InputDecoration(
        counterText: "",
        fillColor: MyColors.greyColor,
        focusColor: MyColors.greyColor,
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
            color: MyColors.greyColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: MyColors.greyColor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: MyColors.greyColor,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: MyColors.greyColor,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintStyle: CommonUi.customTextStyle(color: MyColors.colorGreen),
        isDense: true,
        hintText: hintText.tr,
      ),
    );
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
              Container(color: MyColors.greyColor),
          errorWidget: (context, url, error) =>
              Container(color: MyColors.greyColor)),
    );
  }

  static setTabView(TabController tabController, List<Tab> list, onPressed) {
    return Container(
      height: 45,
      padding: const EdgeInsets.all(4),
      decoration: CommonUi.roundedDecorationWithBorder(
          radius: 5.0,
          bgColor: MyColors.greyColor,
          outLineColor: MyColors.greyColor),
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: TabBar(
          controller: tabController,
          indicator: CommonUi.roundedDecorationWithBorder(
              radius: 5.0,
              bgColor: MyColors.white,
              outLineColor: MyColors.white),
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
          labelColor: MyColors.bluecolor,
          unselectedLabelColor: MyColors.colorBlack,
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
            color: MyColors.colorBlack,
          ),
        }
      ],
    );
  }
}
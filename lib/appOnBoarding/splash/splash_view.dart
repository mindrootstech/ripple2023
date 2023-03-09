import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/common_classes/LocalStorage.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import '../../helper/routes/AppRoutes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  var localStorage=LocalStorage();
  late FlutterGifController controller;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 10,right:20,bottom:20,top: 20),
          width: MediaQuery.of(context).size.width,
          color: ColorRes.appColor,
          height:MediaQuery.of(context).size.height,
          // child: SvgPicture.asset(CommonUi1.setSvgImage("logo"),allowDrawingOutsideViewBox: true,).paddingOnly(left: 38,right: 38),
          // child: Image.asset(CommonUi.setPngImage("splash_logo"),fit: BoxFit.contain,width: MediaQuery.of(context).size.width,),
          child: _buildHandGif(),
        ),
      ),
    );
  }
  @override
  initState()  {
    super.initState();
    controller = FlutterGifController(vsync: this,duration: const Duration(seconds:1));
    controller.repeat(min:0, max:0, period:const Duration(seconds:50));

    Timer(const Duration(milliseconds: 5000), () async {
      if(localStorage.getAuthCode()!=''){
        Get.offAndToNamed(AppRoutes.dashboard);
      }else{
        Get.offAndToNamed(AppRoutes.onBoard);
      }
    });
  }
  Widget _buildHandGif(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          // controller: controller,
          gaplessPlayback: false,
           repeat: ImageRepeat.noRepeat,
           'assets/lottie/splash_lottie.gif',
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}


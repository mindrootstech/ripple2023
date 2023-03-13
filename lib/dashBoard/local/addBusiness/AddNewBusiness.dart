import 'package:flutter/material.dart';

import '../../../helper/constants/ColorRes.dart';

class AddNewBusiness extends StatelessWidget{
  const AddNewBusiness({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Center(
         child: Container(
           padding: const EdgeInsets.only(left: 10,right:30,bottom:20,top: 20),
           width: MediaQuery.of(context).size.width,
           color: ColorRes.appColor,
           height:MediaQuery.of(context).size.height,
           // child: SvgPicture.asset(CommonUi1.setSvgImage("logo"),allowDrawingOutsideViewBox: true,).paddingOnly(left: 38,right: 38),
           // child: Image.asset(CommonUi.setPngImage("splash_logo"),fit: BoxFit.contain,width: MediaQuery.of(context).size.width,),
           // child: _buildHandGif(),
         ),
       ),
   );
  }

}
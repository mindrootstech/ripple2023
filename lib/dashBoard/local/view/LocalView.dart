import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/dashBoard/local/component/ItemFoundListSheet.dart';
import 'package:ripplefect/dashBoard/local/component/SearchLacationViewPart.dart';
import 'package:ripplefect/dashBoard/local/controller/LocalController.dart';

import '../component/MapViewPart.dart';
import '../component/SearchLocationFilterPart.dart';


class LocalView extends StatelessWidget {
   LocalView({Key? key}) : super(key: key);

   var controller=Get.find<LocalController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
          body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                MapViewPart(),
                ItemFoundListSheet(),

                if(!controller.isSearch.value)...{
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    child: SearchLocationViewPart(),
                  ),
                }else...{
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 2000),
                    child: SearchLocationFilterPart(),
                  ),
                },





              ],
            ),
          )),
    );
  }
}

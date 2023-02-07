import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/dashBoard/controller/DashboardController.dart';

import '../helper/constants/CommonUi.dart';


class DashboardView extends GetView<DashboardController> {

  @override
  Widget build(BuildContext context) {

    return  Obx(()=>
        Stack(
          children: [
            controller.currentIndex.value!=10?  Scaffold(
                body: Container(
                    child: controller.children[controller.currentIndex.value]),
                bottomNavigationBar: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12, bottom: 12, right: 12,top: 12),
                      child: BottomBar(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        backgroundColor: Colors.transparent,
                        showActiveBackgroundColor: false,
                        selectedIndex: controller.currentIndex.value,
                        onTap: controller.onTabTapped,
                        items: <BottomBarItem>[
                          BottomBarItem(
                            backgroundColorOpacity: 0,
                            icon: SvgPicture.asset(CommonUi.setSvgImage(controller.currentIndex.value == 0 ? 'home_icon_filled' : 'home_icon'),),
                            activeColor: Colors.transparent,
                            // label: '',
                          ),
                          BottomBarItem(
                            backgroundColorOpacity: 0,
                            icon: SvgPicture.asset(CommonUi.setSvgImage(controller.currentIndex.value == 1 ? 'local_icon_filled' : 'local_icon')),
                            activeColor: Colors.transparent,
                          ),
                          BottomBarItem(
                            backgroundColorOpacity: 0,
                            icon: SvgPicture.asset(CommonUi.setSvgImage(controller.currentIndex.value == 2 ? 'library_icon_filled' : 'library_icon')),
                            activeColor: Colors.transparent,
                          ),
                          BottomBarItem(
                            backgroundColorOpacity: 0,
                            icon: SvgPicture.asset(CommonUi.setSvgImage(controller.currentIndex.value == 3 ? 'setting_icon_filled' : 'setting_icon')),
                            activeColor: Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ):const SizedBox(),
          ],
        ),
    );
  }
}







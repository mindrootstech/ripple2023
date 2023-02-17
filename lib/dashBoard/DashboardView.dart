import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/dashBoard/controller/DashboardController.dart';

import '../helper/constants/ColorRes.dart';
import '../helper/constants/CommonUi.dart';
import '../helper/constants/strings.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
              body: Container(
                  child: controller.children[controller.currentIndex.value]),
              bottomNavigationBar: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          CommonUi.setSvgImage(
                              controller.currentIndex.value == 0
                                  ? 'home_icon_filled'
                                  : 'home_icon'),
                        ),
                        label: Strings.textHome,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(CommonUi.setSvgImage(
                            controller.currentIndex.value == 1
                                ? 'local_icon_filled'
                                : 'local_icon')),
                        label: Strings.textLocal,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(CommonUi.setSvgImage(
                          controller.currentIndex.value == 2
                              ? 'feed_icon_filled'
                              : 'feed_icon')),
                      label: Strings.textFeed,
                      backgroundColor: Colors.white,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(CommonUi.setSvgImage(
                          controller.currentIndex.value == 3
                              ? 'challenges_icon_filled'
                              : 'challenges_icon')),
                      label: Strings.textChallenges,
                      backgroundColor: Colors.white,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(CommonUi.setSvgImage(
                          controller.currentIndex.value == 4
                              ? 'profile_icon_filled'
                              : 'profile_icon')),
                      label: Strings.textProfile,
                      backgroundColor: Colors.white,
                    ),

                  ],
                  type: BottomNavigationBarType.fixed,
                  currentIndex: controller.currentIndex.value,
                  selectedItemColor: ColorRes.colorGreen,
                  iconSize: 40,
                  selectedLabelStyle: const TextStyle(color: ColorRes.colorGreen),
                  showSelectedLabels: true,
                  unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),                  onTap: controller.onTabTapped,
                  elevation: 5)),
        ],
      ),
    );
  }
}

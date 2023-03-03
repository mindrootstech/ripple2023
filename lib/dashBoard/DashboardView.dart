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
              bottomNavigationBar: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,

                ),
                child: BottomNavigationBar(

                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SvgPicture.asset(
                              CommonUi.setSvgImage(
                                  controller.currentIndex.value == 0
                                      ? 'home_icon_filled'
                                      : 'home_icon'),
                            ),
                          ),
                          label: Strings.textHome,
                          tooltip: '',
                          backgroundColor: Colors.white),
                      BottomNavigationBarItem(
                          icon:Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SvgPicture.asset(CommonUi.setSvgImage(
                                controller.currentIndex.value == 1
                                    ? 'local_icon_filled'
                                    : 'local_icon')),
                          ),
                          label: Strings.textLocal,
                          tooltip: '',
                          backgroundColor: Colors.white),
                      BottomNavigationBarItem(
                        icon:Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SvgPicture.asset(CommonUi.setSvgImage(
                              controller.currentIndex.value == 2
                                  ? 'feed_icon_filled'
                                  : 'feed_icon')),
                        ),
                        label: Strings.textFeed,
                        tooltip: '',
                        backgroundColor: Colors.white,
                      ),
                      BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SvgPicture.asset(CommonUi.setSvgImage(
                              controller.currentIndex.value == 3
                                  ? 'challenges_icon_filled'
                                  : 'challenges_icon')),
                        ),
                        label: Strings.textChallenges,
                        tooltip: '',
                        backgroundColor: Colors.white,
                      ),
                      BottomNavigationBarItem(
                        icon:Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SvgPicture.asset(CommonUi.setSvgImage(
                              controller.currentIndex.value == 4
                                  ? 'profile_icon_filled'
                                  : 'profile_icon')),
                        ),
                        label: Strings.textProfile,
                        tooltip: '',
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
                    elevation: 5),
              )),
        ],
      ),
    );
  }
}

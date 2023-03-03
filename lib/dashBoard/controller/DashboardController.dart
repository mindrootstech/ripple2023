
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/dashBoard/home/view/HomeView.dart';
import 'package:ripplefect/dashBoard/local/view/LocalView.dart';

class DashboardController extends GetxController{
  var currentIndex = 0.obs;




  final List<Widget> children = [
     HomeView(),
    LocalView(),
    Container(),
    Container(),
    Container(),

  ];



  void onTabTapped(int index) {
    currentIndex.value = index;

    }



}
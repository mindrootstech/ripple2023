
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/dashBoard/home/view/HomeView.dart';

class DashboardController extends GetxController{
  var currentIndex = 10.obs;




  final List<Widget> children = [
    const HomeView(),
    Container(),
    Container(),
    Container(),
    Container(),

  ];



  void onTabTapped(int index) {
    currentIndex.value = index;

    }



}
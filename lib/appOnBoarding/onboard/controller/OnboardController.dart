import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../helper/constants/strings.dart';
import '../model/OnboardModel.dart';

class OnboardController extends GetxController{
  var skipText = "SKIP".obs;
  var pageController = PageController().obs;
  var pageNo = 0.obs;

  var progressValue = 0.25.obs;
  var goalPageNo = 1.obs;

  var titles = [Strings.whatIsWhy,Strings.whatYourWant,Strings.pickGoal].obs;
  var titleNumber = 0.obs;

  var type = 1;
  var yourWayList_1 = [
    GoalOnboardModel(Strings.outChildren,"children",true.obs),
    GoalOnboardModel(Strings.myHealth,"health",false.obs),
    GoalOnboardModel(Strings.aLovedArea,"area",false.obs),
    GoalOnboardModel(Strings.toInfluence,"magnet",false.obs),
    GoalOnboardModel(Strings.myFaith,"faith",false.obs),
    GoalOnboardModel(Strings.loveFor,"ocean",false.obs),
    GoalOnboardModel(Strings.preservationNature,"nature",false.obs),
    GoalOnboardModel(Strings.animals,"animal",false.obs),
  ].obs;


  var moreList_2 = [
    GoalOnboardModel(Strings.eatSustainably,"eat",false.obs),
    GoalOnboardModel(Strings.getAround,"learn",false.obs),
    GoalOnboardModel(Strings.shopMindFul,"area",false.obs),
    GoalOnboardModel(Strings.reduceWaste,"recycle",true.obs),
    GoalOnboardModel(Strings.protectLiving,"faith",false.obs),
    GoalOnboardModel(Strings.advocate,"advocate",false.obs),
    GoalOnboardModel(Strings.restoration,"restore_nature",false.obs),
    GoalOnboardModel(Strings.heatAndCool,"cool",false.obs),
    GoalOnboardModel(Strings.learnShare,"learn",false.obs),
  ].obs;


  var goalList_3 = [
    GoalOnboardModel(Strings.casual,"eat",false.obs,action: "1 action / wk"),
    GoalOnboardModel(Strings.regular,"eat",false.obs,action: "2 actions / wk"),
    GoalOnboardModel(Strings.serious,"eat",false.obs,action: "4 actions / wk"),
    GoalOnboardModel(Strings.intense,"eat",false.obs,action: "7 actions / wk"),
  ].obs;

}
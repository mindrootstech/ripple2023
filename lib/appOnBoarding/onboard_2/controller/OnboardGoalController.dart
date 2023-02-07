import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/OnboardModel.dart';

class OnboardGoalController extends GetxController{
  var skipText = "SKIP".obs;
  var pageController = PageController().obs;
  var progressValue = 0.25.obs;
  var pageNo = 1.obs;

  var titles = ["What is your why?","What your want to do more?","Pick a goal"].obs;
  var titleNumber = 0.obs;

  var type = 1;
  var yourWayList_1 = [
    GoalOnboardModel("Our Children","children",true.obs),
    GoalOnboardModel("My health","health",false.obs),
    GoalOnboardModel("A loved area affected","area",false.obs),
    GoalOnboardModel("To influence accountability","magnet",false.obs),
    GoalOnboardModel("My faith","faith",false.obs),
    GoalOnboardModel("Love for the ocean","ocean",false.obs),
    GoalOnboardModel("Preservation of nature","nature",false.obs),
    GoalOnboardModel("Animals","animal",false.obs),
  ].obs;


  var moreList_2 = [
    GoalOnboardModel("Eat sustainably","eat",false.obs),
    GoalOnboardModel("Get around greener","learn",false.obs),
    GoalOnboardModel("Shop mindfully","area",false.obs),
    GoalOnboardModel("Reduce my waste","recycle",true.obs),
    GoalOnboardModel("Protect living things","faith",false.obs),
    GoalOnboardModel("Advocate","advocate",false.obs),
    GoalOnboardModel("Restoration of nature","restore_nature",false.obs),
    GoalOnboardModel("Heat and cool smarter","cool",false.obs),
    GoalOnboardModel("Learn and Share","learn",false.obs),
  ].obs;


  var goalList_3 = [
    GoalOnboardModel("Casual","eat",false.obs,action: "1 action / wk"),
    GoalOnboardModel("Regular","eat",false.obs,action: "2 actions / wk"),
    GoalOnboardModel("Serious","eat",false.obs,action: "4 actions / wk"),
    GoalOnboardModel("Intense","eat",false.obs,action: "7 actions / wk"),
  ].obs;

}
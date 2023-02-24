import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ripplefect/api_provider/ApiProvider.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';

import '../../../helper/constants/strings.dart';
import '../model/OnboardModel.dart';

class OnboardController extends GetxController{
  var apiProvider=ApiProvider();

  var skipText = "SKIP".obs;
   List pControllers=<PageController>[];

  // var pageController = PageController().obs;
  var pageNo = 0.obs;


  ///Goal OnBoarding controllers
  var progressValue = 0.25.obs;
  var goalPageNo = 1.obs;
  var titles = [Strings.whatIsWhy,Strings.whatYourWant,Strings.pickGoal].obs;
  var titleNumber = 0.obs;
  var type = 1;
  var yourWayList_1 = <Goal>[].obs;
  var moreList_2 = <Goal>[].obs;
  var goalList_3 = <Goal>[].obs;

  @override
  void onInit() {
    pControllers.add(PageController());
    pControllers.add(PageController());
    getOnBoardingData();
    super.onInit();
  }

  Future<void> getOnBoardingData() async {
   await apiProvider.onBoardingApi().then((value) {
      if(value=='error'){
        return;
      }
      else{
        var response = onBoardModelFromJson(value);
        if(response.status) {
          // CommonUi.showToast(response.message);
          yourWayList_1.addAll(response.data.why);
          moreList_2.addAll(response.data.more);
          goalList_3.addAll(response.data.goal);
        }else{
          CommonUi.showToast(response.message);
        }
      }
    }).catchError((e){

    });
  }

}
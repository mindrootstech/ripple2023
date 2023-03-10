import 'package:flutter/cupertino.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:get/get.dart';
import 'package:ripplefect/api_provider/ApiProvider.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/service/GlobalService.dart';

import '../../../helper/constants/strings.dart';
import '../model/OnboardModel.dart';

class OnboardController extends GetxController {
  var apiProvider=ApiProvider();
  var service=Get.find<GlobalServices>();
  var skipText = "SKIP".obs;
   List pControllers=<PageController>[];
  var pageNo = 0.obs;
  var loader=false.obs;


  ///Goal OnBoarding controllers
  var progressValue = 0.25.obs;
  var goalPageNo = 1.obs;
  var titles = [Strings.whatIsWhy,Strings.whatYourWant,Strings.pickGoal].obs;
  var titleNumber = 0.obs;
  var type = 1;
  var list_1 = <Goal>[].obs;
  var list_2 = <Goal>[].obs;
  var list_3 = <Goal>[].obs;
  var selectedIndex=0.obs;
  var from='';


  @override
  void onInit() {

    getOnBoardingData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getOnBoardingData() async {
    list_1.addAll(service.onBoardData.why??[]);
    list_2.addAll(service.onBoardData.more??[]);
    list_3.addAll(service.onBoardData.goal??[]);
    if(Get.arguments!=null){
      from=Get.arguments[0]??'';
      goalPageNo.value=Get.arguments[1]+1??0;
      titleNumber.value=Get.arguments[1]??0;
      pControllers.add(PageController());
      pControllers.add(PageController(initialPage:titleNumber.value ));
    }else{
      pControllers.add(PageController());
      pControllers.add(PageController());
    }







  }


}
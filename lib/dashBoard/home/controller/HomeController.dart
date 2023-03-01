
import 'dart:convert';

import 'package:get/get.dart';
import 'package:ripplefect/api_provider/ApiProvider.dart';
import 'package:ripplefect/dashBoard/home/model/DashboardModel.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';

import '../../../helper/common_classes/LocalStorage.dart';
import '../../../helper/constants/CommonUi.dart';

class HomeController extends GetxController{
  var currentIndex=0.obs;
  var apiProvider=ApiProvider();
  var localStorage=LocalStorage();

  var modelList = [DashboardModel("one"),DashboardModel("two"),DashboardModel("three"),DashboardModel("four"),DashboardModel("test")];

  var loader=false.obs;



  ///filter sheet controller...
  var actionSelected=true.obs;
  var timeSelected=false.obs;
  var categoriesSelected=false.obs;
  var showCheckValue=false.obs;
  var actionTypeList=['Local','Global','Online','Saved'];
  var timeList = ["5 mins ","Under 30 mins","Couple hours","Ongoing"];
  var categoriesList = ["Compost","Reduce waste in your home","Food Waste","Preserve Oceans","Sustainable Fashion","Reduce Emissions"];


  void  logoutApiImplementation() async {
    loader.value=true;
    await apiProvider.logoutApi().then((value){
      if(value=='error'){
        loader.value=false;
        CommonUi.showToast('error');
        return;
      }else {
        var res = jsonDecode(value);
        if(res['status']) {
          localStorage.clearPrefAllData();
          Get.offAllNamed(AppRoutes.login);
        }else{
          CommonUi.showToast('log');
        }
        loader.value=false;
      }
    }).catchError((e){
      loader.value=false;
      CommonUi.showToast('error');
    });
  }

}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:ripplefect/api_provider/ApiProvider.dart';
import 'package:ripplefect/dashBoard/home/model/HomeDataModel.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';

import '../../../helper/common_classes/LocalStorage.dart';
import '../../../helper/constants/CommonUi.dart';
import '../model/FilterActionModel.dart';

class HomeController extends GetxController{
  var currentIndex=0.obs;
  var apiProvider=ApiProvider();
  var localStorage=LocalStorage();


  var loader=false.obs;


  ///Home view controller...
  var userProfile=UsersProfile();
  var challengeList=<Challenge>[];
  var categoryList=<CategoryTag>[];
  var actionList=<Action>[];
  var filterActionList=<AllAction>[];
  var filterCategoryList=<AllCategory>[];


  ///filter sheet controller...
  var actionSelected=true.obs;
  var timeSelected=false.obs;
  var categoriesSelected=false.obs;
  var showCheckValue=false.obs;
  var actionTypeList=['Local','Global','Online','Saved'];
  var timeList = ["5 mins ","Under 30 mins","Couple hours","Ongoing"];
  var categoriesList = ["Compost","Reduce waste in your home","Food Waste","Preserve Oceans","Sustainable Fashion","Reduce Emissions"];






  @override
  void onInit() {
    super.onInit();
    getHomeDataImplementation();
    getFilterActionImplementation();
  }



  void  getHomeDataImplementation() async {
    loader.value=true;
    await apiProvider.getHomeDataApi().then((value){
      if(value=='error'){
        loader.value=false;
        return;
      }
      else{
        var response = homeDataModelFromJson(value);
        if(response.status) {
          if(response.data.usersProfile!=null){
            userProfile=response.data.usersProfile!;
            challengeList.addAll(response.data.challenges??[]);
            actionList.addAll(response.data.articles??[]);
          }


        }else{
          CommonUi.showToast(response.message);
        }
        loader.value=false;
      }
    }).catchError((e){
      loader.value=false;
    });
  }

  void  getFilterActionImplementation() async {
    loader.value=true;
    await apiProvider.getFilterActionApi().then((value){
      if(value=='error'){
        loader.value=false;
        return;
      }
      else{
        var response = filterActionModelFromJson(value);
        if(response.status) {
            filterActionList.addAll(response.data.allActions??[]);
            filterCategoryList.addAll(response.data.allCategory??[]);
        }else{
          CommonUi.showToast(response.message);
        }
        loader.value=false;
      }
    }).catchError((e){
      loader.value=false;
    });
  }



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
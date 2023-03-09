
import 'dart:convert';

import 'package:flutter/material.dart';
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
  var actionList=<FilterActions>[];



  /// Action sheet controller...
  var filterActionList=<AllAction>[];
  var filterCategoryList=<AllCategory>[];
  var searchActionTextController=TextEditingController();
  var actionScrollController=ScrollController();
  var selectedCatId=''.obs;
  var selectedCatIndex=1000.obs;
  var totalPage=1;
  var currentPage=1;


  ///filter sheet controller...
  var actionSelected=true.obs;
  var timeSelected=false.obs;
  var categoriesSelected=false.obs;
  var showCheckValue=false.obs;
  var actionTypeList=['Local','Global','Online','Saved'];
  var timeList = ["5 mins ","Under 30 mins","Couple hours","Ongoing"];
  var categoriesList = ["Compost","Reduce waste in your home","Food Waste","Preserve Oceans","Sustainable Fashion","Reduce Emissions"];






  @override
  Future<void> onInit() async {
    super.onInit();
    await getHomeDataImplementation();
    await getFilterActionImplementation('','',1,CommonUi.paginationLimit);
    getActionPagination();
  }


  void getActionPagination(){
    actionScrollController.addListener(() {
      if ((actionScrollController.position.pixels == actionScrollController.position.maxScrollExtent)) {
        if (currentPage < totalPage) {
          currentPage++;
          getFilterActionImplementation('',selectedCatId.value,currentPage,CommonUi.paginationLimit);
        }
      }
    });
  }


  Future<bool> getHomeDataImplementation() async {
    loader.value=true;
    await apiProvider.getHomeDataApi().then((value){
      if(value=='error'){
        loader.value=false;
        return false;
      }
      else{
        var response = homeDataModelFromJson(value);
        if(response.status) {
          if(response.data.usersProfile!=null){
            userProfile=response.data.usersProfile!;
            challengeList.addAll(response.data.challenges??[]);
            categoryList.addAll(response.data.categoryTags??[]);
            actionList.addAll(response.data.articles??[]);
          }
        }else{
          CommonUi.showToast(response.message);
        }
        loader.value=false;
      }
      return false;
    }).catchError((e){
      loader.value=false;
      return false;
    });
    return false;
  }

  Future<bool> getFilterActionImplementation(String searchText, String catId, int page, int limit) async {
    loader.value=true;
    await apiProvider.getFilterActionApi(searchText,catId,page,limit).then((value){
      if(value=='error'){
        loader.value=false;
        return false;
      }
      else{
        var response = filterActionModelFromJson(value);
        if(response.status) {
             if(filterCategoryList.isEmpty){
               filterCategoryList.addAll(response.data.allCategory??[]);
             }
            filterActionList.addAll(response.data.allActions??[]);
            totalPage=response.data.totalActionPages??0;
        }else{
          CommonUi.showToast(response.message);
        }
        loader.value=false;
      }
      return false;
    }).catchError((e){
      loader.value=false;
      return false;
    });
    return false;
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
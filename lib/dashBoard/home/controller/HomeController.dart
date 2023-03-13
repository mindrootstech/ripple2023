
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/api_provider/ApiProvider.dart';
import 'package:ripplefect/dashBoard/home/model/HomeDataModel.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';
import 'package:ripplefect/helper/service/GlobalService.dart';

import '../../../helper/common_classes/LocalStorage.dart';
import '../../../helper/constants/CommonUi.dart';
import '../model/FilterActionModel.dart';
import '../model/HomeFilterActionModel.dart';

class HomeController extends GetxController{
  var currentIndex=0.obs;
  var apiProvider=ApiProvider();
  var localStorage=LocalStorage();
  var service=Get.find<GlobalServices>();
  var loader=false.obs;
  var actionLoader=false.obs;


  ///Home view controller...
  var userProfile=UsersProfile();
  var challengeList=<Challenge>[];

  //home filter bottom part
  var categoryList=<CategoryTag>[];
  var actionList=<HomeAction>[];



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
  var actionTypeList=<FilterActionType>[];
  var timeList = <FilterActionType>[];
  var categoriesList = <FilterActionType>[];
  var searchCategoriesList = <FilterActionType>[];
  var catListRefresh=false.obs;





  @override
  Future<void> onInit() async {
    super.onInit();
    getFilterCategory();
    await getHomeDataImplementation();
    await getHomeFilterImplementation(true,'','','');
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
            actionTypeList.addAll(response.data.filterActionType??[]);
            categoriesList.addAll(response.data.allCategories??[]);
            searchCategoriesList.addAll(response.data.allCategories??[]);
            timeList.addAll(response.data.timeFilter??[]);

          }
        }else{
          CommonUi.showToast(response.message);
          loader.value=false;
        }
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

  Future<bool> getHomeFilterImplementation(bool clear, String deleteActionType,String deleteTimeType,String deleteCatType) async {
    var actionType='';
    var time = '';
    var categories = '';
    if(clear){
      getClearSelectedCheckId(actionTypeList);
      getClearSelectedCheckId(timeList);
      getClearSelectedCheckId(categoriesList);
    }else{
      actionType= getSelectedCheckId(actionTypeList);
      time= getSelectedCheckId(timeList);
      categories= getSelectedCheckId(categoriesList);
    }

    actionLoader.value=true;
    await apiProvider.getHomeFilterActionApi(actionType,time,categories,deleteActionType,deleteTimeType,deleteCatType).then((value){
      if(value=='error'){
        actionLoader.value=false;
        return false;
      }
      else{
        var res=jsonDecode(value);
        var response = homeFilterActionModelFromJson(value);
        if(response.status) {
          actionList.clear();
          categoryList.clear();
          actionList.addAll(response.data.actions??[]);
          categoryList.addAll(response.data.categoryTags??[]);

        }else{
        }
        actionLoader.value=false;
      }
      return false;
    }).catchError((e){
      actionLoader.value=false;
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
          service.clearServiceData();
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

  void getFilterCategory() {
    // categoriesList.addAll(service.onBoardData.more??[]);
  }

  String getSelectedCheckId(List<FilterActionType> list) {
    var result='';
    if(list.isNotEmpty){
      for(int i=0;i<list.length;i++){
        if(list[i].isSelected!.value){
          result="${list[i].id},$result";
        }
      }
      return result;
    }else{
      return '';
    }
  }

  void getClearSelectedCheckId(List<FilterActionType> list) {
    for(int i=0;i<list.length;i++){
      if(list[i].isSelected!.value){
       list[i].isSelected!.value=false;
      }
    }
  }
 void searchCatByName(String value) {
   categoriesList.clear();
   categoriesList = searchCategoriesList.where((item) => item.name.toLowerCase().contains(value.toLowerCase())).toList();
    if(catListRefresh.value){
      catListRefresh.value=false;
    }else{
      catListRefresh.value=true;
    }
  }
  void refreshCatList() {
    categoriesList.clear();
    categoriesList.addAll(searchCategoriesList);
  }

}
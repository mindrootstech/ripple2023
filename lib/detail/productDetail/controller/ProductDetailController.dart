
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ripplefect/api_provider/ApiProvider.dart';
import '../../../helper/constants/ColorRes.dart';
import '../../../helper/constants/CommonUi.dart';
import '../model/ProductDetailDemoModel.dart';
import '../model/ProductDetailModel.dart';

class ProductDetailController extends GetxController{
  var apiProvider=ApiProvider();
  var pageController = PageController();
  var bannerImages = [].obs;
  var loader=false.obs;
  var productDetailModel=ProductDetailData();
  var metricList = <ProductDetailDemoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProductDetailImplementation();
    bannerImages.value = ["https://picsum.photos/250?image=14", "https://picsum.photos/250?image=9", "https://picsum.photos/250?image=25"];
  metricList.add(ProductDetailDemoModel(name: "Carbon", type: "saved", weight: "135 lbs", bgColor: ColorRes.colorNavyBlue, textColor: ColorRes.white));
  metricList.add(ProductDetailDemoModel(name: "Water", type: "saved", weight: "500 gal", bgColor: ColorRes.lightBluecolor, textColor: ColorRes.colorDarkBlue));
  metricList.add(ProductDetailDemoModel(name: "Waste", type: "saved", weight: "110 kg", bgColor: ColorRes.colorCream,  textColor: ColorRes.colorBrown));


  }

  Future<void> getProductDetailImplementation() async {
    var id='';
    if(Get.parameters['id']!=''&&Get.parameters['id']!=null){
      id=Get.parameters['id']??'';
    }
    loader.value=true;
  await  apiProvider.getProductDetailApi(id).then((value) {
    if(value=='error'){
      loader.value=false;
      return;
    }
    else{
      var response = productDetailModelFromJson(value);
      if(response.status) {
        productDetailModel=response.productDetailData;
      }else{
        CommonUi.showToast(response.message);
      }
      loader.value=false;
    }

    }).catchError((e){
      print(e);
      loader.value=false;
    });
  }


}
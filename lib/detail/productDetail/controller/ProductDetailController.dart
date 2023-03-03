
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../helper/constants/ColorRes.dart';
import '../model/ProductDetailModel.dart';

class ProductDetailController extends GetxController{

  var pageController = PageController();
  var bannerImages = [].obs;
  var metricList = <ProductDetailModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    bannerImages.value = ["https://picsum.photos/250?image=14", "https://picsum.photos/250?image=9",
      "https://picsum.photos/250?image=25"];
    
  metricList.add(ProductDetailModel(name: "Carbon", type: "saved", weight: "135 lbs", bgColor: ColorRes.colorNavyBlue, textColor: ColorRes.white));
  metricList.add(ProductDetailModel(name: "Water", type: "saved", weight: "500 gal", bgColor: ColorRes.lightBluecolor, textColor: ColorRes.colorDarkBlue));
  metricList.add(ProductDetailModel(name: "Waste", type: "saved", weight: "110 kg", bgColor: ColorRes.colorCream,  textColor: ColorRes.colorBrown));


  }


}
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ripplefect/api_provider/ApiProvider.dart';
import '../../../helper/common_classes/LocalStorage.dart';

class LocalController extends GetxController{
  var apiProvider=ApiProvider();
  var localStorage=LocalStorage();
  var loader=false.obs;



  ///map controller....
  late CameraPosition cameraPosition;


  @override
  void onInit() {
    super.onInit();
    cameraPosition = const CameraPosition(
      target: LatLng(30.642803, 76.816902),
      zoom: 14.4746,
    );
  }





}
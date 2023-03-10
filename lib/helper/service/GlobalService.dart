

import 'package:get/get.dart';
import 'package:ripplefect/api_provider/ApiProvider.dart';

import '../../appOnBoarding/onboard/model/OnboardModel.dart';
import '../constants/CommonUi.dart';

class GlobalServices extends GetxService {
  var selectedWhy=0;
  var selectedMore=<Goal>[];
  var selectedGoal=0;
  var apiProvider=ApiProvider();
  var onBoardData=Data();


  Future<GlobalServices> init() async {
    getOnBoardingData();
    return this;
  }




  void clearServiceData() {

  }



  Future<void> getOnBoardingData() async {
    await apiProvider.onBoardingApi().then((value) {
      if(value=='error'){
        return;
      }
      else{
        var response = onBoardModelFromJson(value);
        if(response.status) {
          onBoardData=response.data;
        }else{
          CommonUi.showToast(response.message);
        }
      }
    }).catchError((e){

    });
  }


}

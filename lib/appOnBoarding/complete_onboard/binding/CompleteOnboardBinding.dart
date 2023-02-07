import 'package:get/get.dart';
import 'package:ripplefect/appOnBoarding/complete_onboard/controller/CompleteOnboardController.dart';



class CompleteOnboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteOnboardController());
  }

}
import 'package:get/get.dart';
import 'package:ripplefect/before_login/complete_onboard/controller/CompleteOnboardController.dart';
import 'package:ripplefect/before_login/forgotpass/controller/ForgotPassController.dart';

class CompleteOnboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteOnboardController());
  }

}
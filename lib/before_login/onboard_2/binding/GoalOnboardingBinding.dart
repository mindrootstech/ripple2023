import 'package:get/get.dart';
import 'package:ripplefect/before_login/forgotpass/controller/ForgotPassController.dart';
import 'package:ripplefect/before_login/onboard_2/controller/OnboardGoalController.dart';

class GoalOnboardingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardGoalController());
  }

}
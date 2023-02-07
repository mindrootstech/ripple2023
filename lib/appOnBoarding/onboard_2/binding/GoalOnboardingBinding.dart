import 'package:get/get.dart';
import 'package:ripplefect/appOnBoarding/onboard_2/controller/OnboardGoalController.dart';

class GoalOnboardingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardGoalController());
  }

}
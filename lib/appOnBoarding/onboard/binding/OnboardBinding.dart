import 'package:get/get.dart';

import '../controller/OnboardController.dart';

class OnboardBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => OnboardController());
  }
}
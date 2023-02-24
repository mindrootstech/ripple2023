import 'package:get/get.dart';

import '../controller/OnBoardController.dart';

class OnboardBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => OnboardController());
  }
}
import 'package:get/get.dart';

import '../controller/DashboardController.dart';

class DashBoardBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
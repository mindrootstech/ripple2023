import 'package:get/get.dart';
import 'package:ripplefect/detail/controller/DashboardDetailController.dart';


class DashBoardDetailBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => DashboardDetailController());
  }
}
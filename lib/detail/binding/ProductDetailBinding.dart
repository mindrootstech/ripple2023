import 'package:get/get.dart';
import 'package:ripplefect/detail/controller/ProductDetailController.dart';


class DashBoardDetailBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => DashboardDetailController());
  }
}
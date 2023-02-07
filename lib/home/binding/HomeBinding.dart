import 'package:get/get.dart';
import 'package:ripplefect/home/controller/HomeController.dart';

class HomeBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
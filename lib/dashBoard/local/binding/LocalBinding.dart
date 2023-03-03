import 'package:get/get.dart';
import 'package:ripplefect/dashBoard/local/controller/LocalController.dart';

class LocalBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => LocalController());
  }
}
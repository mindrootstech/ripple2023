import 'package:get/get.dart';
import 'package:ripplefect/before_login/resetpass/controller/ResetPassController.dart';

class ResetPassBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ResetPassController());
  }
}
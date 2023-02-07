import 'package:get/get.dart';
import 'package:ripplefect/before_login/forgotpass/controller/ForgotPassController.dart';

class ForgotPassBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPassController());
  }

}
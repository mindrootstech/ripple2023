import 'package:get/get.dart';
import 'package:ripplefect/before_login/login/controller/LoginController.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}
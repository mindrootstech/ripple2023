import 'package:get/get.dart';

import '../controller/ForgotPassController.dart';

class ForgotPassBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPassController());
  }

}
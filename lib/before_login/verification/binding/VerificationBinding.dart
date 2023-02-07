import 'package:get/get.dart';
import 'package:ripplefect/before_login/verification/controller/VerificationController.dart';

class VerificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationController());
  }

}
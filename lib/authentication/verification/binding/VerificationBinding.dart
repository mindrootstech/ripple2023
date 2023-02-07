import 'package:get/get.dart';
import '../controller/VerificationController.dart';

class VerificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationController());
  }

}
import 'package:get/get.dart';
import '../controller/SignupController.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }

}
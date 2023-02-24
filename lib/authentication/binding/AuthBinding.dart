import 'package:get/get.dart';
import '../controller/AuthController.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }

}
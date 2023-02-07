import 'package:get/get.dart';
import '../controller/ResetPassController.dart';

class ResetPassBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ResetPassController());
  }
}
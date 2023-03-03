import 'package:get/get.dart';

import '../controller/BusinessDetailController.dart';

class BusinessDetailBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => BusinessDetailController());
  }
}
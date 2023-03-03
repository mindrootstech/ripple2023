import 'package:get/get.dart';
import 'package:ripplefect/detail/controller/ProductDetailController.dart';


class ProductDetailBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailController());
  }
}
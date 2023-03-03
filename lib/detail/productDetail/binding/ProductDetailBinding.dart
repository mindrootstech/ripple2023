import 'package:get/get.dart';
import '../controller/ProductDetailController.dart';


class ProductDetailBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailController());
  }
}
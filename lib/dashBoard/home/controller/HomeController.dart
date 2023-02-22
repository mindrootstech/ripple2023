
import 'package:get/get.dart';
import 'package:ripplefect/dashBoard/home/model/DashboardModel.dart';

class HomeController extends GetxController{
  var currentIndex=0.obs;

  var modelList = [DashboardModel("one"),DashboardModel("two"),DashboardModel("three"),DashboardModel("four"),DashboardModel("test")];

}
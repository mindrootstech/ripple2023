import 'package:get/get_rx/src/rx_types/rx_types.dart';

class GoalOnboardModel{
  String title;
  String img;
  RxBool isSelected;
  String? action;
  GoalOnboardModel(this.title,this.img,this.isSelected,{this.action});
}
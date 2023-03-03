
import 'package:flutter/material.dart';

class ProductDetailModel {

  String name = "";
  String type = "";
  String weight = "";
  Color? bgColor;
  Color? textColor;

  ProductDetailModel({ required this.name, required this.type,
    required this.weight, required this.bgColor, required this.textColor});

}
// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
  ProductDetailModel({
    required this.status,
    required this.productDetailData,
    required this.message,
  });

  bool status;
  ProductDetailData productDetailData;
  String message;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
    status: json["status"],
    productDetailData: ProductDetailData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": productDetailData.toJson(),
    "message": message,
  };
}

class ProductDetailData {
  ProductDetailData({
    this.id,
    this.title,
    this.points,
    this.type,
    this.impactLevel,
    this.impactMetricsCarbon,
    this.impactMetricsWater,
    this.impactMetricsWaste,
    this.description,
    this.contribute,
    this.contributeLink,
    this.repeatable,
    this.minTimeGapActionSub,
    this.mainImage,
    this.tags,
    this.otherImageNew,
  });

  int? id;
  String? title;
  String? points;
  int? type;
  int? impactLevel;
  String? impactMetricsCarbon;
  String? impactMetricsWater;
  String? impactMetricsWaste;
  String? description;
  String? contribute;
  String? contributeLink;
  int? repeatable;
  int? minTimeGapActionSub;
  String? mainImage;
  String? tags;
  List<String>? otherImageNew;

  factory ProductDetailData.fromJson(Map<String, dynamic> json) => ProductDetailData(
    id: json["id"],
    title: json["title"],
    points: json["points"],
    type: json["type"],
    impactLevel: json["impact_level"],
    impactMetricsCarbon: json["impact_metrics_carbon"],
    impactMetricsWater: json["impact_metrics_water"],
    impactMetricsWaste: json["impact_metrics_waste"],
    description: json["description"],
    contribute: json["contribute"],
    contributeLink: json["contribute_link"],
    repeatable: json["repeatable"],
    minTimeGapActionSub: json["min_time_gap_action_sub"],
    mainImage: json["main_image"],
    tags: json["tags"],
    otherImageNew: json["other_image_new"]!=null&&json["other_image_new"].length>0?List<String>.from(json["other_image_new"].map((x) => x)):<String>[],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "points": points,
    "type": type,
    "impact_level": impactLevel,
    "impact_metrics_carbon": impactMetricsCarbon,
    "impact_metrics_water": impactMetricsWater,
    "impact_metrics_waste": impactMetricsWaste,
    "description": description,
    "contribute": contribute,
    "contribute_link": contributeLink,
    "repeatable": repeatable,
    "min_time_gap_action_sub": minTimeGapActionSub,
    "main_image": mainImage,
    "tags": tags,
    "other_image_new": List<dynamic>.from(otherImageNew!.map((x) => x)),
  };
}

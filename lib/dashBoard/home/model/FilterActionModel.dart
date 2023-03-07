// To parse this JSON data, do
//
//     final filterActionModel = filterActionModelFromJson(jsonString);

import 'dart:convert';

FilterActionModel filterActionModelFromJson(String str) => FilterActionModel.fromJson(json.decode(str));

String filterActionModelToJson(FilterActionModel data) => json.encode(data.toJson());

class FilterActionModel {
  FilterActionModel({
    required this.status,
    required this.data,
    required this.message,
  });

  bool status;
  Data data;
  String message;

  factory FilterActionModel.fromJson(Map<String, dynamic> json) => FilterActionModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.allCategory,
    required this.allActions,
  });

  List<AllCategory> allCategory;
  List<AllAction> allActions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    allCategory: List<AllCategory>.from(json["All_category"].map((x) => AllCategory.fromJson(x))),
    allActions: List<AllAction>.from(json["all_actions"].map((x) => AllAction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "All_category": List<dynamic>.from(allCategory.map((x) => x.toJson())),
    "all_actions": List<dynamic>.from(allActions.map((x) => x.toJson())),
  };
}

class AllAction {
  AllAction({
    required this.id,
    required this.title,
    required this.points,
    this.description,
    required this.mainImage,
  });

  int id;
  String title;
  String points;
  String? description;
  String mainImage;

  factory AllAction.fromJson(Map<String, dynamic> json) => AllAction(
    id: json["id"],
    title: json["title"],
    points: json["points"],
    description: json["description"],
    mainImage: json["main_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "points": points,
    "description": description,
    "main_image": mainImage,
  };
}

class AllCategory {
  AllCategory({
    required this.categoryId,
    required this.name,
    required this.image,
    required this.total,
  });

  int categoryId;
  String name;
  String image;
  int total;

  factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
    categoryId: json["category_id"],
    name: json["name"],
    image: json["image"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "name": name,
    "image": image,
    "total": total,
  };
}

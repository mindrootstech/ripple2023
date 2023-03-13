// To parse this JSON data, do
//
//     final homeFilterActionModel = homeFilterActionModelFromJson(jsonString);

import 'dart:convert';

HomeFilterActionModel homeFilterActionModelFromJson(String str) => HomeFilterActionModel.fromJson(json.decode(str));

String homeFilterActionModelToJson(HomeFilterActionModel data) => json.encode(data.toJson());

class HomeFilterActionModel {
  HomeFilterActionModel({
    required this.status,
    required this.data,
    required this.message,
  });

  bool status;
  Data data;
  String message;

  factory HomeFilterActionModel.fromJson(Map<String, dynamic> json) => HomeFilterActionModel(
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
    required this.actions,
    required this.categoryTags,

  });

  List<HomeAction> actions;
  List<CategoryTag>? categoryTags;


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    actions: List<HomeAction>.from(json["actions"].map((x) => HomeAction.fromJson(x))),
    categoryTags:json["category_tags"].length>0? List<CategoryTag>.from(json["category_tags"].map((x) => CategoryTag.fromJson(x))):<CategoryTag>[],

  );

  Map<String, dynamic> toJson() => {
    "actions": List<dynamic>.from(actions.map((x) => x.toJson())),
    "category_tags": List<dynamic>.from(categoryTags!.map((x) => x.toJson())),
  };
}

class HomeAction {
  HomeAction({
    required this.id,
    required this.title,
    required this.points,
    required this.description,
    required this.mainImage,
  });

  int id;
  String title;
  String points;
  String description;
  String mainImage;

  factory HomeAction.fromJson(Map<String, dynamic> json) => HomeAction(
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

class CategoryTag {
  CategoryTag({
    required this.id,
    required this.name,
    required this.type,
  });

  int id;
  String name;
  String type;

  factory CategoryTag.fromJson(Map<String, dynamic> json) => CategoryTag(
    id: json["id"]??0,
    name: json["name"]??'',
    type: json["type"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
  };
}

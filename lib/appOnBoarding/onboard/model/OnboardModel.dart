// To parse this JSON data, do
//
//     final onBoardModel = onBoardModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

OnBoardModel onBoardModelFromJson(String str) => OnBoardModel.fromJson(json.decode(str));

String onBoardModelToJson(OnBoardModel data) => json.encode(data.toJson());

class OnBoardModel {
  OnBoardModel({
    required this.status,
    required this.data,
    required this.message,
  });

  bool status;
  Data data;
  String message;

  factory OnBoardModel.fromJson(Map<String, dynamic> json) => OnBoardModel(
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
    required this.why,
    required this.more,
    required this.goal,
  });

  List<Goal> why;
  List<Goal> more;
  List<Goal> goal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    why: List<Goal>.from(json["why"].map((x) => Goal.fromJson(x))),
    more: List<Goal>.from(json["more"].map((x) => Goal.fromJson(x))),
    goal: List<Goal>.from(json["goal"].map((x) => Goal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "why": List<dynamic>.from(why.map((x) => x.toJson())),
    "more": List<dynamic>.from(more.map((x) => x.toJson())),
    "goal": List<dynamic>.from(goal.map((x) => x.toJson())),
  };
}

class Goal {
  Goal({
    required this.id,
    required this.name,
    this.limits,
    required this.createdAt,
    required this.updatedAt,
    this.icon,
    required this.isSelected,
  });

  int id;
  String name;
  String? limits;
  String createdAt;
  String updatedAt;
  String? icon;
  RxBool isSelected;

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
    id: json["id"],
    name: json["name"],
    limits: json["limits"]??'',
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    icon: json["icon"]??'',
    isSelected: false.obs,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "limits": limits,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "icon": icon,
  };
}

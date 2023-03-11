// To parse this JSON data, do
//
//     final homeDataModel = homeDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

import '../../../appOnBoarding/onboard/model/OnboardModel.dart';

HomeDataModel homeDataModelFromJson(String str) => HomeDataModel.fromJson(json.decode(str));

String homeDataModelToJson(HomeDataModel data) => json.encode(data.toJson());

class HomeDataModel {
  HomeDataModel({
    required this.status,
    required this.data,
    required this.message,
  });

  bool status;
  Data data;
  String message;

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
    status: json["status"]??false,
    data:json["data"]!=null? Data.fromJson(json["data"]):Data(),
    message: json["message"]??'',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
     this.usersProfile,
     this.challenges,
     this.categoryTags,
     this.articles,
     this.filterActionType,
     this.timeFilter,
     this.allCategories,
  });

  UsersProfile? usersProfile;
  List<Challenge>? challenges;
  List<CategoryTag>? categoryTags;
  List<FilterActions>? articles;
  List<FilterActionType>? filterActionType;
  List<FilterActionType>? timeFilter;
  List<FilterActionType>? allCategories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    usersProfile:json["users_profile"]!=null? UsersProfile.fromJson(json["users_profile"]):UsersProfile(),
    challenges:json["challenges"].length>0? List<Challenge>.from(json["challenges"].map((x) => Challenge.fromJson(x))):<Challenge>[],
    categoryTags:json["category_tags"].length>0? List<CategoryTag>.from(json["category_tags"].map((x) => CategoryTag.fromJson(x))):<CategoryTag>[],
    articles:json["actions"].length>0? List<FilterActions>.from(json["actions"].map((x) => FilterActions.fromJson(x))):<FilterActions>[],
    filterActionType: List<FilterActionType>.from(json["filter_action_type"].map((x) => FilterActionType.fromJson(x))),
    timeFilter: List<FilterActionType>.from(json["time_filter"].map((x) => FilterActionType.fromJson(x))),
    allCategories: List<FilterActionType>.from(json["all_categories"].map((x) => FilterActionType.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "users_profile": usersProfile!.toJson(),
    "challenges": List<dynamic>.from(challenges!.map((x) => x.toJson())),
    "category_tags": List<dynamic>.from(categoryTags!.map((x) => x.toJson())),
    "actions": List<dynamic>.from(articles!.map((x) => x.toJson())),
    "filter_action_type": List<dynamic>.from(filterActionType!.map((x) => x)),
    "time_filter": List<dynamic>.from(timeFilter!.map((x) => x)),
    "all_categories": List<dynamic>.from(allCategories!.map((x) => x.toJson())),
  };
}

class FilterActionType {
  FilterActionType({
    required this.id,
    required this.name,
    this.isSelected
  });

  int id;
  String name;
  RxBool? isSelected;

  factory FilterActionType.fromJson(Map<String, dynamic> json) => FilterActionType(
    id: json["id"],
    name: json["name"],
    isSelected:false.obs
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}



class FilterActions {
  FilterActions({
     this.id,
     this.title,
     this.points,
     this.description,
     this.mainImage,

  });

  int? id;
  String? title;
  String? points;
  String? description;
  String? mainImage;



  factory FilterActions.fromJson(Map<String, dynamic> json) => FilterActions(
    id: json["id"]??0,
    points: json["points"]??'',
    description: json["description"]??'',
    mainImage: json["main_image"]??'',
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
  });

  int id;
  String name;

  factory CategoryTag.fromJson(Map<String, dynamic> json) => CategoryTag(
    id: json["id"]??0,
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Challenge {
  Challenge({
    this.id,
    this.challengeName,
    this.challengeSubTitle,
    this.challengeDesc,
    this.logo,
    this.mainImage,
    this.startDate,
    this.endDate,
    this.challengePoints,


  });

  int? id;
  String? challengeName;
  String? challengeSubTitle;
  String? challengeDesc;
  String? logo;
  String? mainImage;
  String? startDate;
  String? endDate;
  int? challengePoints;

  factory Challenge.fromJson(Map<String, dynamic> json) => Challenge(
    id: json["id"]??0,
    challengeName: json["challenge_name"]??'',
    challengeSubTitle: json["challenge_sub_title"]??'',
    challengeDesc: json["challenge_desc"]??'',
    logo: json["logo"]??'',
    mainImage: json["main_image"]??'',
    startDate: json["start_date"]??'',
    endDate: json["end_date"]??'',
    challengePoints: json["challenge_points"]??0,

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "challenge_name": challengeName,
    "challenge_sub_title": challengeSubTitle,
    "challenge_desc": challengeDesc,
    "logo": logo,
    "main_image": mainImage,
    "start_date": startDate,
    "end_date": endDate,
    "challenge_points": challengePoints,

  };
}

class UsersProfile {
  UsersProfile({
     this.id,
     this.firstName,
     this.lastName,
     this.accountType,
     this.email,
     this.socialToken,
     this.profileImage,
     this.emailVerifiedAt,
     this.lastLogin,
     this.createdAt,
     this.updatedAt,
     this.mobile,
     this.city,
     this.country,
     this.bio,
     this.currentPoints,
     this.lifetimePoints,
     this.banner,
     this.why1,
     this.goal1,
     this.more1,
  });

  int? id;
  String? firstName;
  String? lastName;
  int? accountType;
  String? email;
  String? socialToken;
  String? profileImage;
  String? emailVerifiedAt;
  String? lastLogin;
  String? createdAt;
  String?  updatedAt;
  String? mobile;
  String? city;
  String? country;
  String? bio;
  int? currentPoints;
  int? lifetimePoints;
  int? banner;
  List<Goal>? why1;
  List<Goal>? goal1;
  List<Goal>? more1;

  factory UsersProfile.fromJson(Map<String, dynamic> json) => UsersProfile(
    id: json["id"]??0,
    firstName: json["first_name"]??'',
    lastName: json["last_name"]??'',
    accountType: json["account_type"]??0,
    email: json["email"]??'',
    socialToken: json["social_token"]??'',
    profileImage: json["profile_image"]??'',
    emailVerifiedAt: json["email_verified_at"]??'',
    lastLogin: json["last_login"]??'',
    createdAt: json["created_at"]??'',
    updatedAt: json["updated_at"]??'',
    mobile: json["mobile"]??'',
    city: json["city"]??'',
    country: json["country"]??'',
    bio: json["bio"]??'',
    currentPoints: json["current_points"]??0,
    lifetimePoints: json["lifetime_points"]??0,
    banner: json["banner"]??0,
    why1: json["why_1"]!=null?List<Goal>.from(json["why_1"].map((x) => Goal.fromJson(x))):<Goal>[],
    goal1:json["goal_1"]!=null? List<Goal>.from(json["goal_1"].map((x) => Goal.fromJson(x))):<Goal>[],
    more1:json["more_1"]!=null? List<Goal>.from(json["more_1"].map((x) => Goal.fromJson(x))):<Goal>[],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "account_type": accountType,
    "email": email,
    "social_token": socialToken,
    "profile_image": profileImage,
    "email_verified_at": emailVerifiedAt,
    "last_login": lastLogin,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "mobile": mobile,
    "city": city,
    "country": country,
    "bio": bio,
    "current_points": currentPoints,
    "lifetime_points": lifetimePoints,
    "banner": banner,
    "why_1": List<dynamic>.from(why1!.map((x) => x.toJson())),
    "goal_1": List<dynamic>.from(goal1!.map((x) => x.toJson())),
    "more_1": List<dynamic>.from(more1!.map((x) => x.toJson())),
  };
}

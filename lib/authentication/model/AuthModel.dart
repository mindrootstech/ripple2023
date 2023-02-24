// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    required this.status,
    required this.data,
    required this.message,
  });

  bool status;
  Data data;
  String message;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    status: json["status"],
    data: json["data"]!=null? Data.fromJson(json["data"]):Data(id: 0,token: ''),
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
    required this.id,
    required this.token,
  });

  int id;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"]??'',
    token: json["token"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
  };
}

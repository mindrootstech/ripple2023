import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import '../helper/common_classes/LocalStorage.dart';

class ApiProvider extends GetConnect {
  Client client = Client();
  var localStorage = LocalStorage();


  final String baseUrl = "https://development.mind-roots.com/ripple/api"; ///dev url


  Future<String> registerApi(String name,String email, String password, int registerType, String socialToken) async {
    var deviceType = '';
    if (Platform.isIOS) {
      deviceType = 'ios';
    } else {
      deviceType = 'android';
    }
    try {
      final response = await client.post(Uri.parse("$baseUrl/register"), body: {
        'name': name,
        'email': email,
        'password': password,
        'register_type': registerType.toString(),
        'device_type': deviceType,
        'device_token': 'dfjdsj',
        'social_token': socialToken ,
      });
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return 'error';
    }
  }


  Future<String> loginApi(String email, String password, int loginType, String socialToken) async {
    var deviceType = '';
    if (Platform.isIOS) {
      deviceType = 'ios';
    } else {
      deviceType = 'android';
    }
    try {
      final response = await client.post(Uri.parse("$baseUrl/login"), body: {
        'email': email,
        'password': password,
        'login_type': loginType.toString(),
        'device_type': deviceType,
        'device_token': 'sdfsd',
        'social_token': socialToken ,
      });
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return 'error';
    }
  }



  Future<String> forgotPassApi(String email) async {
    try {
      final response = await client.post(Uri.parse("$baseUrl/forgot-password"), body: {
        'email': email,
      });
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return 'error';
    }
  }

  Future<String> verifyCodeApi(String email,String pin) async {
    try {
      final response = await client.post(Uri.parse("$baseUrl/verify-code"), body: {
        'email': email,
        'code': pin,
      });
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return 'error';
    }
  }

  Future<String> resetPassApi(String email,String pass) async {
    try {
      final response = await client.post(Uri.parse("$baseUrl/reset-password"), body: {
        'email': email,
        'password': pass,
      },);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return 'error';
    }
  }

  Future<String> logoutApi() async {
    try {
      final response = await client.post(Uri.parse("$baseUrl/logout"),
          headers: {'Authorization': "Bearer ${localStorage.getAuthCode()}"});
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return 'error';
    }
  }

  Future<String> onBoardingApi() async {
    try {
      final response = await client.get(Uri.parse("$baseUrl/one-time-data"));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return 'error';
    }
  }





}

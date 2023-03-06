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


  Future<String> socialLoginApi(String name,String email, int socialType, String socialToken) async {
    var deviceType = '';
    if (Platform.isIOS) {
      deviceType = 'ios';
    } else {
      deviceType = 'android';
    }
    try {
      final response = await client.post(Uri.parse("$baseUrl/social-auth"), body: {
        'name':name,
        'email': email,
        'social_type': socialType.toString(),
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

  Future<String> getHomeDataApi() async {
    try {
      final response = await client.get(Uri.parse("$baseUrl/home"),
          headers: {'Authorization': "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYmI4NTg5OTQ5Y2IzYzFkZTBmZGE4YTQzYTdhYWQzYjdkNmRmMWUzYmI3MWI4ZGY2NmQ4YzBkYTAwNTBiODVjNmY4NmU1ZmIxMWVjMTYxNmMiLCJpYXQiOjE2NzgwOTQ4NTcuODM3ODUxLCJuYmYiOjE2NzgwOTQ4NTcuODM3ODU0LCJleHAiOjE3MDk3MTcyNTcuODI3NzE4LCJzdWIiOiI0MSIsInNjb3BlcyI6W119.FRWaLkQPd0McW6dTNMSq7hBih-uk40_j_Y-6hwp94Ol8nlndN-aBd63og96QkCnEt9G1xwD66PX9QReHCZbkQuhPjhmVW-mrZq_FZA_a5ZZKlHohg9985JMRTXaWpk_pTFgYXvgM9fPsoJoj6Nspb0p6zGM9wf_g32zMlma39h2iU4T7JyVJvEFE9j52V4ImfMQxQlIb4KiMhTKnWQypPjlQIREVXHcL5NHlNIJ10YMK7oIBU1BuAcF6ojtknXzmILSlCBBk2YG-ZZvw62hzanbhlLa0jYN7vJYVnWsxjwA7Q7SuG6TKiqQQxuk0txKZGcyVMLjI5ksroUmAHoW5wdT5eegacgDRbejgxoD3IaxjqeFF1VSS-XQb_LZNnKAmIGUHhhNZwT253VCZ3gUQKIBOnJeJD65Y_dRYEAusEHDr_XnM0BsCIv3iTsWfK1qxQAnUEk5qp49m1M30u62fGujUKPt_ZdNWZdKgmi0AgcsmW97ih9Y2cRbsB_t2OMmPx35mn4FtGMd4-MKTC7K2TErwZd46z-gfdcdJ5ZWubJywLcO_HQCdhWI0AYOl_dPeH1a9cnkqF6FE7owiCgK73JdbRpJOwIWU6accec_ZeJcKNDLMyqJwD8a-HHViqbRCh_G25t4z1A9CM_IeVhekLVOuT2wD6TfvE_HCy3UwQjU"});
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

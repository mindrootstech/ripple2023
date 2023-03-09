import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import '../helper/common_classes/LocalStorage.dart';

class ApiProvider extends GetConnect {
  Client client = Client();
  var localStorage = LocalStorage();


  final String baseUrl = "https://development.mind-roots.com/rippl/api"; ///dev url


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


  Future<String> getFilterActionApi(String searchText, String catId, int page, int limit) async {
    try {
      final response = await client.post(Uri.parse("$baseUrl/filterActions"),
          headers: {'Authorization': "Bearer ${localStorage.getAuthCode()}"},
      body: {
        "limit":limit.toString(),
        "search":searchText,
        "page":page.toString(),
        "cat_id":catId
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



  Future<String> updateProfileApi(String name, String email, String mobile, String city, String country, String desc, String whatYou, String whatYouWant, String goal, File imageFile) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': "Bearer ${localStorage.getAuthCode()}",
      };
      var request = http.MultipartRequest('POST', Uri.parse("$baseUrl/updateProfile"));
      request.fields.addAll({
        'first_name': name,
        'last_name': '',
        'email': email,
        'mobile': mobile,
        'city': city,
        'country': country,
        'bio': desc,
        'why': whatYou,
        'more': whatYouWant,
        'goal': goal
      });

      if(imageFile.path != ''){
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();
        var multipartFile = http.MultipartFile("profile_image", stream, length, filename: imageFile.path);
        request.files.add(multipartFile);
      }else{
      }
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return response.stream.bytesToString();
      }
      else {
        return response.stream.bytesToString();
      }
    }catch(e){
      return 'error';
    }
    }


  Future<String> deleteAccApi() async {
    try {
      final response = await client.post(Uri.parse("$baseUrl/deleteAccount"),
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

}

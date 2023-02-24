import 'package:get_storage/get_storage.dart';

class LocalStorage {
  var getStorage = GetStorage();



 /// token.......................................
  void saveAuthCode(String auth) {
    getStorage.write('token', auth);
  }

  String getAuthCode() {
    return getStorage.read('token')??'';
  }


  void saveDeviceToken(String auth) {
    getStorage.write('deviceToken', auth);
  }

  String getDeviceToken() {
    return getStorage.read('deviceToken')??'';
  }

  void clearPrefAllData() {
    getStorage.remove('token');
    getStorage.remove('deviceToken');

  }











}

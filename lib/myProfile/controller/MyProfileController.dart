import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ripplefect/api_provider/ApiProvider.dart';
import 'package:ripplefect/dashBoard/home/controller/HomeController.dart';
import 'package:ripplefect/dashBoard/home/model/HomeDataModel.dart';

import '../../helper/common_classes/LocalStorage.dart';
import '../../helper/constants/CommonUi.dart';
import '../../helper/routes/AppRoutes.dart';

class MyProfileController extends GetxController{
  var apiProvider=ApiProvider();
  var localStorage=LocalStorage();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passController=TextEditingController();
  var mobileController=TextEditingController();
  var cityController=TextEditingController();
  var countryController=TextEditingController();
  var descriptionController=TextEditingController();
  var whatYouController=TextEditingController();
  var whatYouWantController=TextEditingController();
  var goalController=TextEditingController();
  String imageName = "";
  var imagePath = "".obs;
  var mediaImagePath = "".obs;
  var storageImagePath = "".obs;
  var loader=false.obs;





  @override
  void onInit() {
    super.onInit();
    getPrefillProfileData();
  }

  Future getGalleryImage() async {
    PickedFile? image = await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 25);
    imageName = image!.path.split('/').last;
    imagePath.value = image.path;
    storageImagePath.value=image.path;
    // getUploadImage(image.path, imageName);
  }

  Future getCameraImage() async {
    PickedFile image = (await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
      imageQuality: 25,
    ))!;
    imageName = image.path.split('/').last;
    imagePath.value = image.path;
    storageImagePath.value=image.path;
    var imagelink  = Uri.parse(storageImagePath.value);

  }

  void getPrefillProfileData() {
    var userProfile=Get.find<HomeController>().userProfile;
     nameController.text=userProfile.firstName??'';
     emailController.text=userProfile.email??'';
     passController.text='12345678';
     mobileController.text=userProfile.mobile??'';
     cityController.text=userProfile.city??'';
     countryController.text=userProfile.country??'';
     mediaImagePath.value=userProfile.profileImage??'';
     descriptionController.text=userProfile.bio??'';
     whatYouController.text=userProfile.why??'';
     whatYouWantController.text=userProfile.more??'';
     goalController.text=userProfile.goal??'';
  }


  Future<void> updateProfileApiImplementation() async {
   var name =nameController.text;
   var email =emailController.text;
   var mobile =mobileController.text;
   var city =cityController.text;
   var country =countryController.text;
   var desc=descriptionController.text;
   var whatYou=whatYouController.text;
   var whatYouWant=whatYouWantController.text;
   var goal=goalController.text;
   var imageFile=File(imagePath.value);

   loader.value=true;
   await apiProvider.updateProfileApi(name,email,mobile,city,country,desc,whatYou,whatYouWant,goal,imageFile).then((value) {
     if(value=='error'){
       loader.value=false;
       return;
     }
     else{
       var res = jsonDecode(value);
       var response = UsersProfile.fromJson(res);
       if(res['status']) {
         CommonUi.showToast(res['message']);
         getPrefillProfileData();
       }else{
         CommonUi.showToast(res['message']);
       }
       loader.value=false;
     }
   }).catchError((e){
     loader.value=false;
   });
  }

  void  deleteAccountImplementation() async {
    loader.value=true;
    await apiProvider.deleteAccApi().then((value){
      if(value=='error'){
        loader.value=false;
        CommonUi.showToast('error');
        return;
      }else {
        var res = jsonDecode(value);
        if(res['status']) {
          localStorage.clearPrefAllData();
          Get.offAllNamed(AppRoutes.login);
        }else{
          CommonUi.showToast('log');
        }
        loader.value=false;
      }
    }).catchError((e){
      loader.value=false;
      CommonUi.showToast('error');
    });
  }

}
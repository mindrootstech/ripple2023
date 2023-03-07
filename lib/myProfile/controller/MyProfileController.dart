import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ripplefect/dashBoard/home/controller/HomeController.dart';

class MyProfileController extends GetxController{
  String imageName = "";
  var imagePath = "".obs;
  var mediaImagePath = "".obs;
  var storageImagePath = "".obs;
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

    //getUploadImage(image.path, imageName);
  }

  void getPrefillProfileData() {
    var userProfile=Get.find<HomeController>().userProfile;
     nameController.text=userProfile.firstName??'';
     emailController.text=userProfile.email??'';
     passController.text='12345678';
     mobileController.text=userProfile.mobile??'';
     cityController.text=userProfile.city??'';
     countryController.text=userProfile.country??'';
     descriptionController.text='';
     whatYouController.text='';
     whatYouWantController.text='';
     goalController.text='';
  }

}
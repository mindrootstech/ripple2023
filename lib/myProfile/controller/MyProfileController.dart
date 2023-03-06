import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileController extends GetxController{

  String imageName = "";
  var imagePath = "".obs;
  var mediaImagePath = "".obs;
  var storageImagePath = "".obs;

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

}
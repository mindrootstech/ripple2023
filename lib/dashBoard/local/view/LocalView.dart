import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ripplefect/dashBoard/local/controller/LocalController.dart';


class LocalView extends StatelessWidget {
   LocalView({Key? key}) : super(key: key);
   var controller=Get.find<LocalController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GoogleMap(
                padding:  const EdgeInsets.only(bottom: 300),
                myLocationEnabled: true,


                onCameraMove: (value){
                  // controller.skipApiImplementation.value = false;
                  // if(controller.timer != null){
                  //   controller.timer.cancel();
                  // }
                  controller.cameraPosition = value;
                  // controller.calculateRadiusOfScreen(value);
                },
                onCameraIdle: (){
                  // controller.timer = Timer(const Duration(seconds: 1),(){
                  //   if(controller.skipApiImplementation.value) {
                  //     controller.skipApiImplementation.value = false;
                  //   }else{
                  //     controller.calculateRadiusOfScreen(controller.cameraPosition);
                  //   }
                  // });
                },
                // markers: controller.markers.value,
                // mapType: controller.mapType.value,
                initialCameraPosition: controller.cameraPosition,
                // onMapCreated: (GoogleMapController gController) {
                //   controller.mapController = gController;
                // },
              ),
            )
          ],
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:ripplefect/detail/controller/ProductDetailController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetX<DashboardDetailController>(
          builder: (controller) {
            return Column(
              children: [
                PageView.builder(
                  itemCount: controller.bannerImages.length,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (value) {
                    // controller.pageNo.value = value;
                  },
                  controller: controller.pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return CommonUi.loadBannerImages(controller.bannerImages[index]);
                  },
                ),
                controller.bannerImages.length > 0 ? Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: SmoothPageIndicator(
                      controller: controller.pageController,
                      count: controller.bannerImages.length,
                      effect: const SlideEffect(
                          spacing: 8,
                          dotWidth: 8,
                          dotHeight: 8,
                          dotColor:
                          Colors.white,
                          activeDotColor:
                          Colors.amber),
                      onDotClicked: (index) {}),
                ) : const SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}

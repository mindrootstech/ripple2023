import 'package:get/get.dart';
import 'package:ripplefect/authentication/binding/AuthBinding.dart';
import 'package:ripplefect/dashBoard/DashboardView.dart';
import 'package:ripplefect/dashBoard/binding/DashboardBinding.dart';
import 'package:ripplefect/dashBoard/local/binding/LocalBinding.dart';
import 'package:ripplefect/detail/binding/ProductDetailBinding.dart';
import 'package:ripplefect/detail/view/ProductDetailView.dart';
import '../../appOnBoarding/onboard/view/CompleteOnboardView.dart';
import '../../appOnBoarding/onboard/binding/OnboardBinding.dart';
import '../../appOnBoarding/onboard/view/OnboardView.dart';
import '../../appOnBoarding/onboard/view/GoalOnBoardingView.dart';
import '../../appOnBoarding/splash/splash_view.dart';
import '../../authentication/views/ForgotPassView.dart';
import '../../authentication/views/LoginView.dart';
import '../../authentication/views/ResetPassView.dart';
import '../../authentication/views/SignupView.dart';
import '../../authentication/views/VerificationView.dart';
import '../../dashBoard/home/binding/HomeBinding.dart';
import 'AppRoutes.dart';

class AppPages {
  static const initial = AppRoutes.dashboard;


  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onBoard, page: () => const OnboardView(), binding: OnboardBinding()),
    GetPage(name: AppRoutes.goalOnBoard, page: () => const GoalOnBoardingView()),
    GetPage(name: AppRoutes.completeOnBoard, page: () =>  CompleteOnboardView(),binding: AuthBinding()),
    GetPage(name: AppRoutes.signup, page: () =>  SignupView(),binding: AuthBinding()),
    GetPage(name: AppRoutes.login, page: () =>  LoginView(),binding: AuthBinding()),
    GetPage(name: AppRoutes.forgotPass, page: () =>  ForgotPassView()),
    GetPage(name: AppRoutes.verification, page: () =>  VerificationView()),
    GetPage(name: AppRoutes.resetPass, page: () =>  ResetPassView()),
    GetPage(name: AppRoutes.dashboard, page: () =>  DashboardView(), bindings: [DashBoardBinding(),HomeBinding(),LocalBinding()]),
    GetPage(name: AppRoutes.productDetail, page: () =>   const ProductDetailView(), binding: ProductDetailBinding()),
  ];
}
import 'package:get/get.dart';
import 'package:ripplefect/dashBoard/DashboardView.dart';
import 'package:ripplefect/dashBoard/binding/DashboardBinding.dart';
import '../../appOnBoarding/complete_onboard/view/CompleteOnboardView.dart';
import '../../appOnBoarding/onboard/binding/OnboardBinding.dart';
import '../../appOnBoarding/onboard/view/OnboardView.dart';
import '../../appOnBoarding/onboard_2/binding/GoalOnboardingBinding.dart';
import '../../appOnBoarding/onboard_2/view/GoalOnboardingView.dart';
import '../../authentication/forgotpass/binding/FogotPassBinding.dart';
import '../../authentication/forgotpass/view/ForgotPassView.dart';
import '../../authentication/login/binding/LoginBinding.dart';
import '../../authentication/login/view/LoginView.dart';
import '../../authentication/resetpass/binding/ResetPassBinding.dart';
import '../../authentication/resetpass/view/ResetPassView.dart';
import '../../authentication/signup/binding/SignupBinding.dart';
import '../../authentication/signup/view/SignupView.dart';
import '../../authentication/splash/binding/splash_binding.dart';
import '../../authentication/splash/view/splash_view.dart';
import '../../authentication/verification/binding/VerificationBinding.dart';
import '../../authentication/verification/view/VerificationView.dart';
import '../../dashBoard/home/binding/HomeBinding.dart';
import '../../dashBoard/home/view/HomeView.dart';
import 'AppRoutes.dart';

class AppPages {
  static const initial = AppRoutes.dashboard;


  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: AppRoutes.onBoard, page: () => const OnboardView(), binding: OnboardBinding()),
    GetPage(name: AppRoutes.goalOnBoard, page: () => const GoalOnboardingView(), binding: GoalOnboardingBinding()),
    GetPage(name: AppRoutes.completeOnBoard, page: () => const CompleteOnboardView(), binding: GoalOnboardingBinding()),
    GetPage(name: AppRoutes.signup, page: () => const SignupView(), binding: SignupBinding()),
    GetPage(name: AppRoutes.login, page: () => const LoginView(), binding: LoginBinding()),
    GetPage(name: AppRoutes.forgotPass, page: () => const ForgotPassView(), binding: ForgotPassBinding()),
    GetPage(name: AppRoutes.verification, page: () => const VerificationView(), binding: VerificationBinding()),
    GetPage(name: AppRoutes.resetPass, page: () => const ResetPassView(), binding: ResetPassBinding()),
    GetPage(name: AppRoutes.dashboard, page: () =>  DashboardView(), bindings: [DashBoardBinding(),HomeBinding()]),
  ];
}
import 'package:get/get.dart';
import 'package:ripplefect/before_login/complete_onboard/view/CompleteOnboardView.dart';
import 'package:ripplefect/before_login/forgotpass/binding/FogotPassBinding.dart';
import 'package:ripplefect/before_login/forgotpass/view/ForgotPassView.dart';
import 'package:ripplefect/before_login/login/binding/LoginBinding.dart';
import 'package:ripplefect/before_login/login/view/LoginView.dart';
import 'package:ripplefect/before_login/onboard_2/binding/GoalOnboardingBinding.dart';
import 'package:ripplefect/before_login/onboard_2/view/GoalOnboardingView.dart';
import 'package:ripplefect/before_login/resetpass/binding/ResetPassBinding.dart';
import 'package:ripplefect/before_login/resetpass/view/ResetPassView.dart';
import 'package:ripplefect/before_login/signup/binding/SignupBinding.dart';
import 'package:ripplefect/before_login/signup/view/SignupView.dart';
import 'package:ripplefect/before_login/splash/binding/splash_binding.dart';
import 'package:ripplefect/before_login/verification/binding/VerificationBinding.dart';
import 'package:ripplefect/before_login/verification/view/VerificationView.dart';
import 'package:ripplefect/home/binding/HomeBinding.dart';
import 'package:ripplefect/home/view/HomeView.dart';

import '../../before_login/onboard/binding/OnboardBinding.dart';
import '../../before_login/onboard/view/OnboardView.dart';
import '../../before_login/splash/view/splash_view.dart';
class AppRoutes {
  static const initial = splash;

  static const String splash = '/splash';
  static const String onbaord = '/onboard';
  static const String goal_onboard = '/goal_onboard';
  static const String complete_onboard = '/complete_onboard';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String forgotPass = '/forgotPass';
  static const String verification = '/verification';
  static const String resetPass = '/resetPass';

  static const String home = '/home';

  static final routes = [

    GetPage(name: splash, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: onbaord, page: () => const OnboardView(), binding: OnboardBinding()),
    GetPage(name: goal_onboard, page: () => const GoalOnboardingView(), binding: GoalOnboardingBinding()),
    GetPage(name: complete_onboard, page: () => const CompleteOnboardView(), binding: GoalOnboardingBinding()),
    GetPage(name: signup, page: () => const SignupView(), binding: SignupBinding()),
    GetPage(name: login, page: () => const LoginView(), binding: LoginBinding()),
    GetPage(name: forgotPass, page: () => const ForgotPassView(), binding: ForgotPassBinding()),
    GetPage(name: verification, page: () => const VerificationView(), binding: VerificationBinding()),
    GetPage(name: resetPass, page: () => const ResetPassView(), binding: ResetPassBinding()),
    GetPage(name: home, page: () => const HomeView(), binding: HomeBinding()),
  ];
}
import 'package:catalift/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:catalift/app/modules/onboarding/views/onboarding_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}

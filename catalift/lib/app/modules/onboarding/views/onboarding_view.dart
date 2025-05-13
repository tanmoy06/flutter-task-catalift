import 'package:catalift/app/modules/onboarding/widgets/dream_profession.dart';
import 'package:catalift/app/modules/onboarding/widgets/interests.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    final pages = [InterestsPage(), DreamProfessionPage()];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 50, right: 50),
              child: Obx(
                () => LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(14),
                  value: controller.progress,
                  backgroundColor: Colors.grey[300],
                  color: Colors.indigo,
                  minHeight: 6,
                ),
              ),
            ),

            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  child: pages[controller.currentStep.value],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

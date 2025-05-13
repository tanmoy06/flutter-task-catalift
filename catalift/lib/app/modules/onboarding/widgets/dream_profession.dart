import 'package:catalift/app/components/custom_button.dart';
import 'package:catalift/app/constants/app_colors.dart';
import 'package:catalift/app/constants/assets.dart';
import 'package:catalift/app/services/responsive_ui_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/onboarding_controller.dart';

class DreamProfessionPage extends StatelessWidget {
  const DreamProfessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Lottie.asset(Assets.dreamProfession),
          Text(
            "Your Dream Profession",
            style: TextStyle(
              color: AppColors.indigo900,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          20.kheightBox(context),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
          40.kheightBox(context),
          SizedBox(
            width: 100.w(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I want to be a...",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.indigo300,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                      child: Text(
                        "Profession",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),

                    SizedBox(
                      width: 30.w(context),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        value: controller.selectedProfession.value,
                        items:
                            controller.professions
                                .map(
                                  (e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.indigo300,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                        onChanged:
                            (val) => controller.selectedProfession.value = val!,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 4, left: 4),
                  child: Column(
                    children: [
                      Text("at", style: TextStyle(color: AppColors.indigo300)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Company/Industry",
                      style: TextStyle(color: AppColors.black, fontSize: 13),
                    ),
                    4.kheightBox(context),
                    SizedBox(
                      width: 30.w(context),
                      child: DropdownButtonFormField<String>(
                        value: controller.selectedCompany.value,
                        items:
                            controller.companies
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.indigo300,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                        onChanged:
                            (val) => controller.selectedCompany.value = val!,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          34.kheightBox(context),
          Center(
            child: Column(
              children: [
                CustomElevatedButton(
                  buttonText: 'Continue',
                  height: 50.kh(context),
                  width: 100.w(context),
                  onPressed: controller.next,
                ),
                14.kheightBox(context),
                CustomElevatedButton(
                  buttonColor: AppColors.white,
                  buttonText: 'Back',
                  textStyle: TextStyle(
                    color: AppColors.indigo900,
                    fontSize: 18,
                  ),
                  height: 50.kh(context),
                  width: 100.w(context),
                  onPressed: controller.back,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

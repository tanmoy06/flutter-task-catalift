import 'package:catalift/app/components/custom_button.dart';
import 'package:catalift/app/constants/app_colors.dart';
import 'package:catalift/app/services/responsive_ui_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class InterestsPage extends StatelessWidget {
  const InterestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.kheightBox(context),
          Text(
            "Your Interests",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.indigo900,
            ),
          ),
          8.kheightBox(context),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
          18.kheightBox(context),
          SizedBox(
            height: 48.kh(context),
            child: TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: AppColors.indigo300),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: AppColors.indigo300,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: AppColors.indigo300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: AppColors.indigo300, width: 2),
                ),
              ),
            ),
          ),
          20.kheightBox(context),
          Obx(
            () => SizedBox(
              height: 44.h(context),
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children:
                      controller.filteredInterests.map((interest) {
                        final isSelected = controller.selectedInterests
                            .contains(interest);
                        return ChoiceChip(
                          label: Text(interest),
                          selected: isSelected,
                          onSelected:
                              (_) => controller.toggleInterest(interest),
                          selectedColor: AppColors.indigo900,
                          backgroundColor: AppColors.white,
                          showCheckmark: false,
                          labelStyle: TextStyle(
                            color:
                                isSelected ? Colors.white : AppColors.indigo900,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color:
                                  isSelected
                                      ? AppColors.indigo900
                                      : AppColors.indigo300,
                              width: 1.5,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 34),
          Center(
            child: Column(
              children: [
                CustomElevatedButton(
                  buttonText: 'Continue',
                  height: 50.kh(context),
                  width: 100.w(context),
                  onPressed: controller.next,
                ),
                const SizedBox(height: 14),
                CustomElevatedButton(
                  buttonColor: AppColors.white,
                  buttonText: 'Back',
                  textStyle: TextStyle(
                    color: AppColors.indigo900,
                    fontSize: 18,
                  ),
                  height: 50.kh(context),
                  width: MediaQuery.of(context).size.width,
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

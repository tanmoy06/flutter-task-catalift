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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.kheightBox,
          Text(
            "Your Interests",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.indigo900,
            ),
          ),
          8.kheightBox,
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
          18.kheightBox,
          TextField(
            controller: controller.searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: AppColors.indigo300),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.search, size: 30, color: AppColors.indigo300),
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

          20.kheightBox,
          Obx(
            () => Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  controller.filteredInterests.map((interest) {
                    final isSelected = controller.selectedInterests.contains(
                      interest,
                    );
                    return ChoiceChip(
                      label: Text(interest),
                      selected: isSelected,
                      onSelected: (_) => controller.toggleInterest(interest),
                      selectedColor: AppColors.indigo900,
                      backgroundColor: AppColors.white,
                      showCheckmark: false,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : AppColors.indigo900,
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

          34.kheightBox,
          Center(
            child: Column(
              children: [
                CustomElevatedButton(
                  buttonText: 'Continue',
                  height: 50.kh,
                  width: 100.w,
                  onPressed: controller.next,
                ),
                14.kheightBox,
                CustomElevatedButton(
                  buttonColor: AppColors.white,
                  buttonText: 'Back',
                  textStyle: TextStyle(
                    color: AppColors.indigo900,
                    fontSize: 18,
                  ),
                  height: 50.kh,
                  width: 100.w,
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

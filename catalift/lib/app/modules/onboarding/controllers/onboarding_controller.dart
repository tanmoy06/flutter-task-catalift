import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentStep = 0.obs;
  int get totalSteps => 2;

  double get progress => (currentStep.value + 1) / totalSteps;

  final allInterests = <String>[
    'Lorem Ipsum',
    'Lorem',
    'Ipsum',
    'Dolor',
    'Sit Amet',
    'Adipiscing Elit',
    'Sed Do',
    'Tempor Incididunt',
    'Et Dolore',
    'Magna Aliqua',
    'Ad Minim',
    'Veniam',
    'Exercitation',
  ];

  var selectedInterests = <String>[].obs;

  final searchController = TextEditingController();

  RxList<String> filteredInterests = <String>[].obs;
  final professions =
      [
        'Software Engineer',
        'Designer',
        'Sequirity Engineer',
        'Cloud Engineer',
      ].obs;
  final companies = ['Apple', 'Google', 'Microsoft', 'Amazon'].obs;

  final selectedProfession = 'Software Engineer'.obs;
  final selectedCompany = 'Apple'.obs;

  @override
  void onInit() {
    super.onInit();
    filteredInterests.assignAll(allInterests);
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = searchController.text.toLowerCase();
    filteredInterests.assignAll(
      allInterests.where((item) => item.toLowerCase().contains(query)).toList(),
    );
  }

  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      selectedInterests.add(interest);
    }
  }

  void next() {
    if (currentStep.value < 1) currentStep++;
  }

  void back() {
    if (currentStep.value > 0) currentStep--;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentStep = 0.obs;
  int get totalSteps => 2;

  double get progress => (currentStep.value + 1) / totalSteps;

  final allInterests = <String>[
    'Lorem Ipsum Dolor',
    'Lorem',
    'Ipsum',
    'Dolor',
    'Sit Amet Consectetur',
    'Adipiscing Elit',
    'Sed Do Eiusmod',
    'Tempor Incididunt',
    'Ut Labore Et Dolore',
    'Magna Aliqua',
    'Ut Enim Ad Minim',
    'Veniam Quis Nostrud',
    'Exercitation Ullamco',
    'Laboris Nisi Ut',
  ];

  var selectedInterests = <String>[].obs;

  final searchController = TextEditingController();

  RxList<String> filteredInterests = <String>[].obs;
  final professions =
      ['Software Engineer', 'Doctor', 'Designer', 'Teacher'].obs;
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

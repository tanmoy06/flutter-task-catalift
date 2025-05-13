import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ResponsiveSize on num {
  static const double scaleFactorH = 0.117; //100/devide screen height
  static const double scalefactorW = 0.254; //100/device screen width

  double get h => this * Get.height / 100;

  double get w => this * Get.width / 100;

  double get ksp => this * (Get.width / 3) / 126;

  double get kh => (this * Get.height * scaleFactorH) / 100;

  double get kw => (this * Get.width * scalefactorW) / 100;

  Widget get kheightBox => SizedBox(height: kh);

  Widget get kwidthBox => SizedBox(width: kw);
}

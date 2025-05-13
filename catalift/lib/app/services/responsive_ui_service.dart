import 'package:flutter/material.dart';

extension ResponsiveSize on num {
  static const double scaleFactorH = 0.117; // 100 / device screen height
  static const double scaleFactorW = 0.254; // 100 / device screen width

  double h(BuildContext context) =>
      this * MediaQuery.of(context).size.height / 100;

  double w(BuildContext context) =>
      this * MediaQuery.of(context).size.width / 100;

  double ksp(BuildContext context) =>
      this * (MediaQuery.of(context).size.width / 3) / 126;

  double kh(BuildContext context) =>
      (this * MediaQuery.of(context).size.height * scaleFactorH) / 100;

  double kw(BuildContext context) =>
      (this * MediaQuery.of(context).size.width * scaleFactorW) / 100;

  Widget kheightBox(BuildContext context) => SizedBox(height: kh(context));

  Widget kwidthBox(BuildContext context) => SizedBox(width: kw(context));
}

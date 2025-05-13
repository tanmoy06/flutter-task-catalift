import 'package:catalift/app/constants/app_colors.dart';
import 'package:catalift/app/services/responsive_ui_service.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Widget? leadingIcon;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? borderColor;

  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.height,
    required this.width,
    required this.onPressed,
    this.leadingIcon,
    this.textStyle,
    this.buttonColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? AppColors.indigo900),
        borderRadius: BorderRadius.circular(12),
      ),
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.indigo900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIcon != null) leadingIcon!,
            6.kwidthBox,
            if (buttonText.isNotEmpty && textStyle == null)
              Text(
                buttonText,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            if (buttonText.isNotEmpty && textStyle != null)
              Text(buttonText, style: textStyle),
          ],
        ),
      ),
    );
  }
}

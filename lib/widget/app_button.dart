import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonWidth = double.infinity,
    this.buttonColor = AppColor.primaryColor,
    this.textColor = Colors.white,
  });
  final String buttonText;
  final Function() onPressed;
  final double buttonWidth;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            buttonColor,
          ),
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
          elevation: WidgetStateProperty.all<double>(0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

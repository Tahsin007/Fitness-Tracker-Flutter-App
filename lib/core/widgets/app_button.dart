import 'package:fitness_tracker/core/theme/app_pallete.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String labelText;
  final VoidCallback? onPressed;
  const AppButton({required this.labelText, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          colors: [AppPallete.btnGradient1, AppPallete.btnGradient2],
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.all(0),
        ),
        onPressed: () {
          onPressed!();
        },
        child: Text(
          labelText,
          style: AppTextStyle.buttonMedium.copyWith(color: AppPallete.white),
        ),
      ),
    );
  }
}

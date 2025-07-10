import 'package:fitness_tracker/core/constants/image_constants.dart';
import 'package:fitness_tracker/core/theme/app_pallete.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:fitness_tracker/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class GoalsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String btnText;
  final VoidCallback? onBtnPressed;
  const GoalsCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.btnText,
    this.onBtnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Text(title, style: AppTextStyle.h2),
        SizedBox(height: 15),
        Text(
          subtitle,
          style: AppTextStyle.bodyMedium.copyWith(color: AppPallete.gray1),
        ),
        SizedBox(height: 40),
        Image.asset(imagePath),
        SizedBox(height: 60),
        AppButton(
          labelText: btnText,
          onPressed: () {
            onBtnPressed;
          },
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

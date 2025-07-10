import 'package:fitness_tracker/core/theme/app_pallete.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:fitness_tracker/features/onboarding/widgets/onboarding_btn.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onBtnPressed;
  const OnboardScreen({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onBtnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppFloatingBtn(
        onpressed: () {
          onBtnPressed();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyle.h2),
                  SizedBox(height: 15),
                  Text(
                    subtitle,
                    style: AppTextStyle.bodyMedium.copyWith(
                      color: AppPallete.gray1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

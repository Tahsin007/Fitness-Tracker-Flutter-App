import 'package:fitness_tracker/core/constants/image_constants.dart';
import 'package:fitness_tracker/features/onboarding/widgets/app_onboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardScreen4 extends StatelessWidget {
  const OnboardScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardScreen(
      imagePath: Constants.onboard4,
      title: "Improve Sleep  Quality",
      subtitle:
          "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
      onBtnPressed: (){
        context.push('/welcome');
      },
    );
  }
}

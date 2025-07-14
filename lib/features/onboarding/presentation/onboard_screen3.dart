import 'package:fitness_tracker/core/constants/image_constants.dart';
import 'package:fitness_tracker/features/onboarding/widgets/app_onboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardScreen3 extends StatelessWidget {
  const OnboardScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardScreen(
      imagePath: Constants.onboard3,
      title: "Eat Well",
      subtitle:
          "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
      onBtnPressed: (){
        context.push('/onboard4');
      },
    );
  }
}

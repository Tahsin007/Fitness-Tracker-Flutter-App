import 'package:fitness_tracker/core/constants/image_constants.dart';
import 'package:fitness_tracker/features/onboarding/widgets/app_onboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardScreen1 extends StatelessWidget {
  const OnboardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardScreen(
      imagePath: Constants.onboard1,
      title: "Track Your Goal",
      subtitle:
          "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
      onBtnPressed: (){
        context.push('/onboard2');
      },
    );
  }
}

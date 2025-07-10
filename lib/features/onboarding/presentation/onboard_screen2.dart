import 'package:fitness_tracker/core/constants/image_constants.dart';
import 'package:fitness_tracker/features/onboarding/widgets/app_onboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardScreen2 extends StatelessWidget {
  const OnboardScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardScreen(
      imagePath: Constants.onboard2,
      title: "Get Burn",
      subtitle:
          "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      onBtnPressed: (){
        context.push('/onboard3');
      },
    );
  }
}

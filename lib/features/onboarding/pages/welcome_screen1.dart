import 'package:fitness_tracker/core/theme/app_pallete.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:fitness_tracker/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Fitness",
                        style: AppTextStyle.h1.copyWith(
                          color: AppPallete.black,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        "X",
                        style: AppTextStyle.h1.copyWith(
                          color: AppPallete.primaryColor,
                          fontSize: 60,
                        ),
                      ),
                    ],
                  ),
                  Text("Everybody Can Train", style: AppTextStyle.bodyMedium),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0,left: 40,right: 40), // Add bottom margin
            child: AppButton(labelText: "Get Started", onPressed: (){
              context.push('/onboard1');
            }),
          ),
        ],
      ),
    );
  }
}

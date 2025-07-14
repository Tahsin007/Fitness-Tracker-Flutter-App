import 'package:fitness_tracker/core/constants/image_constants.dart';
import 'package:fitness_tracker/features/auth/presentation/widgets/goals_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoalsPage1 extends StatelessWidget {
  const GoalsPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GoalsCard(
          title: "What is your goal?",
          subtitle: "It will help us to choose a best program for you",
          imagePath: Constants.cardGoals1,
          btnText: "Confirm",
          onBtnPressed: () {
            context.go('/goals2');
          },
        ),
      ),
    );
  }
}

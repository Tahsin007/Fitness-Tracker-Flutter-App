import 'package:fitness_tracker/features/auth/domain/usecases/signup.dart';
import 'package:fitness_tracker/features/auth/presentation/pages/goals_page1.dart';
import 'package:fitness_tracker/features/auth/presentation/pages/complete_profile.dart';
import 'package:fitness_tracker/features/auth/presentation/pages/goals_page2.dart';
import 'package:fitness_tracker/features/auth/presentation/pages/goals_page3.dart';
import 'package:fitness_tracker/features/home/presentation/pages/dashboard.dart';
import 'package:fitness_tracker/features/onboarding/presentation/onboard_screen1.dart';
import 'package:fitness_tracker/features/onboarding/presentation/onboard_screen2.dart';
import 'package:fitness_tracker/features/onboarding/presentation/onboard_screen3.dart';
import 'package:fitness_tracker/features/onboarding/presentation/onboard_screen4.dart';
import 'package:fitness_tracker/features/onboarding/widgets/app_onboard.dart';
import 'package:fitness_tracker/features/onboarding/presentation/welcome_screen1.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/presentation/pages/home_page.dart';
import 'features/auth/presentation/pages/signin_page.dart';
import 'features/auth/presentation/pages/signup_page.dart';

final router = GoRouter(
  routes: [
  
    GoRoute(path: '/', builder: (context, state) => const Dashboard()),
    GoRoute(path: '/signin', builder: (context, state) => const SignInPage()),
    GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
    GoRoute(
      path: '/onboard1',
      builder: (context, state) => const OnboardScreen1(),
    ),
    GoRoute(
      path: '/onboard2',
      builder: (context, state) => const OnboardScreen2(),
    ),
    GoRoute(
      path: '/onboard3',
      builder: (context, state) => const OnboardScreen3(),
    ),
    GoRoute(
      path: '/onboard4',
      builder: (context, state) => const OnboardScreen4(),
    ),
    GoRoute(
      path: '/complete-profile',
      builder: (context, state) => const CompleteProfile(),
    ),
    GoRoute(path: '/goals1', builder: (context, state) => const GoalsPage1()),
    GoRoute(
      path: '/goals2',
      builder: (context, state) => const GoalsPage2(),
    ),
    GoRoute(
      path: '/goals3',
      builder: (context, state) => const GoalsPage3(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  ],
);

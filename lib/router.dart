import 'package:fitness_tracker/features/onboarding/pages/onboard_screen1.dart';
import 'package:fitness_tracker/features/onboarding/pages/onboard_screen2.dart';
import 'package:fitness_tracker/features/onboarding/pages/onboard_screen3.dart';
import 'package:fitness_tracker/features/onboarding/pages/onboard_screen4.dart';
import 'package:fitness_tracker/features/onboarding/widgets/app_onboard.dart';
import 'package:fitness_tracker/features/onboarding/pages/welcome_screen1.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/presentation/pages/home_page.dart';
import 'features/auth/presentation/pages/signin_page.dart';
import 'features/auth/presentation/pages/signup_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen1(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpPage(),
    ),
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
  ],
);

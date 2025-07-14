import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_tracker/core/theme/app_theme.dart';
import 'package:fitness_tracker/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router.dart';
import 'core/di/injection_container.dart' as di;
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  di.init();
  // await di.sl.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<AuthBloc>()..add(SignOutEvent()),
      child: MaterialApp.router(
        title: 'Fitness Tracker',
        themeMode: ThemeMode.system,
        theme: AppTheme.darkTheme,
        routerConfig: router,
      ),
    );
  }
}
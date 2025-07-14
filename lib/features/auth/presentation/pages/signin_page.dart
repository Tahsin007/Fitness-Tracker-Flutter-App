import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:fitness_tracker/core/widgets/app_button.dart';
import 'package:fitness_tracker/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.go('/');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text("Hey there,", style: AppTextStyle.bodyMedium),
                SizedBox(height: 15),
                Text(
                  "Welcome Back",
                  style: AppTextStyle.h2.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                AuthTextField(
                  hintText: "Email",
                  controller: _emailController,
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 15),
                AuthTextField(
                  hintText: "Password",
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icon(Icons.lock_outline),
                  obsecureText: true,
                ),

                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget your password?",
                    style: AppTextStyle.bodySmall.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                AppButton(
                  labelText: "Login",
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      SignInEvent(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    context.go('/signup');
                  },
                  child: const Text('Don\'t have an account? Sign up'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

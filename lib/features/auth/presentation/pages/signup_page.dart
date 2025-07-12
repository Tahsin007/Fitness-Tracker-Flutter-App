import 'package:fitness_tracker/core/theme/app_pallete.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:fitness_tracker/core/widgets/app_button.dart';
import 'package:fitness_tracker/features/auth/domain/usecases/signup.dart';
import 'package:fitness_tracker/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void signUp(BuildContext context) {
    context.read<AuthBloc>().add(
      SignUpEvent(
        email: _emailController.text,
        password: _passwordController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.go('/complete-profile');
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
            padding: const EdgeInsets.all(26.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hey there,", style: AppTextStyle.bodyLarge),
                  SizedBox(height: 15),
                  Text(
                    "Create an Account",
                    style: AppTextStyle.h2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 35),
                  AuthTextField(
                    hintText: "First Name",
                    controller: _firstNameController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Please enter your first name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  AuthTextField(
                    hintText: "Last Name",
                    controller: _lastNameController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Please enter your last name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  AuthTextField(
                    hintText: "Email",
                    controller: _emailController,
                    prefixIcon: Icon(Icons.email_outlined),
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Please enter your email";
                      }
                      final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                      if (!emailRegex.hasMatch(p0)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  AuthTextField(
                    hintText: "Password",
                    controller: _passwordController,
                    prefixIcon: Icon(Icons.lock_outline),
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Please enter your password";
                      }
                      if (p0.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 70),
                  AppButton(
                    labelText: "Register",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signUp(context);
                      }
                    },
                  ),

                  SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      context.go('/signin');
                    },
                    child: Text(
                      'Already have an account? Sign in',
                      style: AppTextStyle.bodySmall.copyWith(
                        color: AppPallete.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:fitness_tracker/core/theme/app_pallete.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:fitness_tracker/core/widgets/app_button.dart';
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.go('/');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Hey there,",style: AppTextStyle.bodyLarge,),
                SizedBox(height: 15,),
                Text("Create an Account",style: AppTextStyle.h2.copyWith(fontWeight: FontWeight.bold),),
                SizedBox(height: 35,),
                AuthTextField(label: "First Name", controller: _firstNameController,),
                SizedBox(height: 20,),
                AuthTextField(label: "Last Name", controller: _lastNameController),
                SizedBox(height: 20,),
                AuthTextField(label: "Email", controller: _emailController,prefixIcon: Icon(Icons.email_outlined),),
                SizedBox(height: 20,),
                AuthTextField(label: "Password", controller: _passwordController,prefixIcon: Icon(Icons.lock_outline),),
                // TextField(
                //   controller: _emailController,
                //   decoration: const InputDecoration(labelText: 'Email'),
                // ),
                // TextField(
                //   controller: _passwordController,
                //   decoration: const InputDecoration(labelText: 'Password'),
                //   obscureText: true,
                // ),
                const SizedBox(height: 70),
                AppButton(labelText: "Register",onPressed: (){
                  context.read<AuthBloc>().add(
                    SignUpEvent(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  );
                },),
                // ElevatedButton(
                //   onPressed: () {
                //     context.read<AuthBloc>().add(
                //           SignUpEvent(
                //             email: _emailController.text,
                //             password: _passwordController.text,
                //           ),
                //         );
                //   },
                //   child: const Text('Sign Up'),
                // ),
                SizedBox(height: 15,),
                TextButton(
                  onPressed: () {
                    context.go('/signin');
                  },
                  child: Text('Already have an account? Sign in',style: AppTextStyle.bodySmall.copyWith(color: AppPallete.black),)
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

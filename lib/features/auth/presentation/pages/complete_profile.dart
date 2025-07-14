import 'dart:ffi';

import 'package:fitness_tracker/core/constants/image_constants.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:fitness_tracker/core/widgets/app_button.dart';
import 'package:fitness_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fitness_tracker/features/auth/presentation/bloc/auth_event.dart';
import 'package:fitness_tracker/features/auth/presentation/bloc/auth_state.dart';
import 'package:fitness_tracker/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final _formKey = GlobalKey<FormState>();
  String? selectedGender;
  DateTime? selectedDate;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void completeProfile(
    BuildContext context,
    String gender,
    String dob,
    double weight,
    double heightCm,
  ) {
    context.read<AuthBloc>().add(
      CompleteProfileEvent(
        gender: gender,
        dob: dob,
        weightKg: weight,
        heightCm: heightCm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go('/goals1');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Illustration
                      Image.asset(Constants.signupImg),
                      SizedBox(height: 15),
                      Text(
                        "Let's Complete your profile",
                        style: AppTextStyle.h2.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "It will help us to know more about you",
                        style: AppTextStyle.bodyMedium,
                      ),

                      SizedBox(height: 16),

                      // Gender dropdown
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF7FAFC),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFFE2E8F0)),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedGender,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a gender';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Color(0xFF9CA3AF),
                            ),
                            hintText: "Choose Gender",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                          items: ['Male', 'Female', 'Other']
                              .map(
                                (gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 16),

                      // Date of Birth
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF7FAFC),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFFE2E8F0)),
                        ),
                        child: TextFormField(
                          readOnly: true,
                          validator: (value) {
                            if (selectedDate == null) {
                              return 'Please select a date of birth';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.calendar_today_outlined,
                              color: Color(0xFF9CA3AF),
                            ),
                            hintText: selectedDate == null
                                ? "Date of Birth"
                                : "Date of Birth: ${selectedDate!.toLocal()}"
                                    .split(' ')[0],
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                        ),
                      ),

                      SizedBox(height: 16),

                      AuthTextField(
                        hintText: "Your Weight",
                        keyboardType: TextInputType.number,
                        controller: weightController,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter your weight';
                          }
                          return null;
                        },
                        suffixText: "KG",
                        prefixIcon: Icon(
                          Icons.monitor_weight_outlined,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),

                      SizedBox(height: 16),

                      AuthTextField(
                        hintText: "Your Height",
                        controller: heightController,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter your height';
                          }
                          return null;
                        },
                        suffixText: "CM",
                        keyboardType: TextInputType.number,
                        prefixIcon: Icon(
                          Icons.height_outlined,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),

                      SizedBox(height: 40),

                      AppButton(
                        labelText: "Next >",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            completeProfile(
                                context,
                                selectedGender!,
                                selectedDate.toString(),
                                double.parse(
                                    weightController.text.trim()),
                                double.parse(
                                    heightController.text.trim()));
                          }
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

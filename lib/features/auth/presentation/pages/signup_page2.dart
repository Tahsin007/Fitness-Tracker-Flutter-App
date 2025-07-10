import 'package:fitness_tracker/core/constants/image_constants.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:fitness_tracker/core/widgets/app_button.dart';
import 'package:fitness_tracker/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';

class SignupPage2 extends StatefulWidget {
  const SignupPage2({super.key});

  @override
  State<SignupPage2> createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  String? selectedGender;
  DateTime? selectedDate;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Illustration
                Image.asset(Constants.signupImg),
                SizedBox(height: 15),
                Text(
                  "Let's Complete your profile",
                  style: AppTextStyle.h2.copyWith(fontWeight: FontWeight.bold),
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xFF9CA3AF),
                      ),
                      hintText: "Date of Birth",
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
                  controller: weightController,
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
                  suffixText: "CM",
                  keyboardType: TextInputType.number,
                  prefixIcon: Icon(
                    Icons.height_outlined,
                    color: Color(0xFF9CA3AF),
                  ),
                ),

                SizedBox(height: 40),

                AppButton(labelText: "Next >", onPressed: () {}),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:fitness_tracker/core/theme/app_pallete.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final Icon? prefixIcon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? suffixText;
  final bool? obsecureText;
  const AuthTextField({
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.suffixText,
    this.obsecureText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF7FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE2E8F0)),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obsecureText?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon ?? null,
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          suffixText: suffixText,
          suffixStyle: TextStyle(
            color: Color(0xFFE879F9),
            fontWeight: FontWeight.w600,
          ),
          
        ),
      ),
    );
  }
}

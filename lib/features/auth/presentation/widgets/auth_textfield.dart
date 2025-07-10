import 'package:fitness_tracker/core/theme/app_pallete.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final Icon? prefixIcon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const AuthTextField({
    required this.label,
    required this.controller,
    this.prefixIcon,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppTextStyle.bodySmall.copyWith(color: AppPallete.gray1.withValues(alpha: 0.5)),
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppPallete.borderColor,
        hintStyle: AppTextStyle.bodySmall.copyWith(color: AppPallete.gray1.withValues(alpha: 0.5)),
        border: OutlineInputBorder(),
        hintText: label,
        prefixIcon: prefixIcon ?? Icon(Icons.person_outline),
        prefixIconColor: AppPallete.gray1.withValues(alpha: 0.5),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppPallete.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppPallete.errorColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppPallete.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }
}

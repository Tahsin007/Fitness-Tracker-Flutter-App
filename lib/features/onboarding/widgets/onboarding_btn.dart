import 'package:fitness_tracker/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppFloatingBtn extends StatelessWidget {
  final VoidCallback? onpressed;
  const AppFloatingBtn({this.onpressed,super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right:20,
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppPallete.btnGradient1, AppPallete.btnGradient2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(width: 2,color: AppPallete.white),
            boxShadow: [
              BoxShadow(
                color: AppPallete.primaryColor.withValues(alpha: 0.8),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ]
          ),
          child: Icon(Icons.chevron_right,size: 30,color: AppPallete.white,),
        ),
      ),
    );
  }
}

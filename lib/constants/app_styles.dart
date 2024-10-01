import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.accent,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static const TextStyle linkText = TextStyle(
    fontSize: 12,
    color: AppColors.accent,
    decoration: TextDecoration.underline,
  );
}

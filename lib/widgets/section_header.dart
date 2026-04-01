import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../utils/responsive.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final String? subtitle;

  const SectionHeader({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            ' $label',
            style: AppTextStyles.label.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: isMobile
              ? AppTextStyles.sectionTitleMobile
              : AppTextStyles.sectionTitle,
          textAlign: TextAlign.center,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          SizedBox(
            width: 600,
            child: Text(
              subtitle!,
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),
          ),
        ],
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 3,
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }
}

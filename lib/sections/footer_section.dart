import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_strings.dart';
import '../utils/responsive.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 32),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.cardBorder)),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildLogo(),
                const SizedBox(height: 16),
                _buildCopyright(),
                const SizedBox(height: 16),
                _buildLinks(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLogo(),
                _buildCopyright(),
                _buildLinks(),
              ],
            ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(
            child: Text('Z',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14)),
          ),
        ),
        const SizedBox(width: 8),
        Text(AppStrings.name,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }

  Widget _buildCopyright() {
    return Text(
      '© ${DateTime.now().year} Zeeshan Sheikh. All rights reserved.',
      style: AppTextStyles.bodySmall.copyWith(fontSize: 12),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: ['Privacy', 'Terms', 'Contact'].map((s) {
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(s,
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 12,
                color: AppColors.textMuted,
              )),
        );
      }).toList(),
    );
  }
}

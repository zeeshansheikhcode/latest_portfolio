import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../utils/responsive.dart';
import '../widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final hPad = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background,
            AppColors.surface,
            AppColors.background,
          ],
        ),
      ),
      child: Column(
        children: [
          const SectionHeader(
            label: 'About Me',
            title: 'Who Am I?',
            subtitle:
                'A passionate developer crafting beautiful digital experiences',
          ),
          const SizedBox(height: 64),
          isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildInfoCard()),
        const SizedBox(width: 40),
        Expanded(flex: 3, child: _buildTextContent(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildInfoCard(),
        const SizedBox(height: 40),
        _buildTextContent(context),
      ],
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Container(
          //   width: 90,
          //   height: 90,
          //   decoration: BoxDecoration(
          //     gradient: AppColors.primaryGradient,
          //     shape: BoxShape.circle,
          //     boxShadow: [
          //       BoxShadow(
          //         color: AppColors.primary.withOpacity(0.3),
          //         blurRadius: 20,
          //         offset: const Offset(0, 8),
          //       ),
          //     ],
          //   ),
          //   child: Center(
          //     child: Image.asset(
          //       'assets/images/latest_profile.jpg', // replace with your image path
          //       width: 50, // adjust width
          //       height: 50,
          //       // adjust height
          //       fit: BoxFit.cover, // keeps aspect ratio
          //     ),
          //   ),

          //   // Center(
          //   //   child: Text(
          //   //     'ZS',
          //   //     style: TextStyle(
          //   //       color: Colors.white,
          //   //       fontSize: 28,
          //   //       fontWeight: FontWeight.w800,
          //   //     ),
          //   //   ),
          //   // ),
          // ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/latest_profile.jpg',
                width: 90,
                height: 90,
                fit: BoxFit.cover, // fills the circle
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.name,
            style: AppTextStyles.cardTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            'Flutter Developer',
            style: AppTextStyles.label,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const Divider(color: AppColors.cardBorder),
          const SizedBox(height: 20),
          _InfoRow(Icons.location_on_outlined, 'Lahore-Pakistan'),
          const SizedBox(height: 12),
          _InfoRow(Icons.mail_outline, 'zeeshansheikh921837@gmail.com'),
          const SizedBox(height: 12),
          _InfoRow(
            Icons.school_outlined,
            ' UET Lahore BSCS Session (2018-2022)',
          ),
          const SizedBox(height: 12),
          _InfoRow(Icons.work_outline, '3+ Years Exp'),
          const SizedBox(height: 24),
          // Social row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // _SmallSocialBtn(FontAwesomeIcons.github),
              const SizedBox(width: 10),
              _SmallSocialBtn(FontAwesomeIcons.linkedin),
              const SizedBox(width: 10),
              // _SmallSocialBtn(FontAwesomeIcons.twitter),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.aboutText, style: AppTextStyles.body),
        const SizedBox(height: 20),
        Text(AppStrings.aboutText2, style: AppTextStyles.body),
        const SizedBox(height: 36),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _HighlightChip('🚀', 'Fast Delivery'),
            _HighlightChip('🎨', 'Clean UI'),
            _HighlightChip('📱', 'Responsive Design'),
            _HighlightChip('🔥', 'High Performance'),
            _HighlightChip('🔒', 'Secure Apps'),
            _HighlightChip('♾️', 'Clean Architecture'),
          ],
        ),
        const SizedBox(height: 36),
        // Fun facts
        ...[
          //_FunFact('☕', 'Fueled curiosity'),
          // _FunFact('🌙', 'Day Night Owl Developer'),
          // _FunFact('📚', 'Continuous Learner'),
          // _FunFact('🎮', 'Occasional gamer'),
        ],
        _buildStatsRow(isMobile),
      ],
    );
  }
}

Widget _buildStatsRow(bool isMobile) {
  return Wrap(
    spacing: 32,
    runSpacing: 24,
    alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
    children: AppStrings.stats.map((stat) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (b) => AppColors.primaryGradient.createShader(b),
            child: Text(
              stat['value']!,
              style: AppTextStyles.sectionTitle.copyWith(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
          Text(stat['label']!, style: AppTextStyles.bodySmall),
        ],
      );
    }).toList(),
  );
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoRow(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const SizedBox(width: 10),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _SmallSocialBtn extends StatelessWidget {
  final IconData icon;
  const _SmallSocialBtn(this.icon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final String urlString = AppStrings.linkedin; // your URL as String
        if (urlString.isNotEmpty) {
          // make sure it's not empty
          final Uri uri = Uri.parse(urlString);
          if (await canLaunchUrl(uri)) {
            await launchUrl(
              uri,
              mode: LaunchMode.externalApplication, // opens in browser
            );
          } else {
            debugPrint('Could not launch $urlString');
          }
        }
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Center(child: FaIcon(icon, size: 14, color: Colors.white)),
      ),
    );
  }
}

class _HighlightChip extends StatelessWidget {
  final String emoji;
  final String label;
  const _HighlightChip(this.emoji, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _FunFact extends StatelessWidget {
  final String emoji;
  final String text;
  const _FunFact(this.emoji, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 10),
          Text(text, style: AppTextStyles.body.copyWith(fontSize: 14)),
        ],
      ),
    );
  }
}

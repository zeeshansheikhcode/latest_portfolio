import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../utils/responsive.dart';
import '../widgets/animated_gradient_border.dart';
import '../widgets/glowing_button.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onContactPressed;
  const HeroSection({super.key, required this.onContactPressed});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideUp;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slideUp = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final hPad = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 70,
      ),
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: isMobile
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context, isTablet),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, bool isTablet) {
    return FadeTransition(
      opacity: _fadeIn,
      child: SlideTransition(
        position: _slideUp,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 3, child: _buildTextContent(context)),
            const SizedBox(width: 60),
            Expanded(flex: 2, child: _buildAvatarCard()),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return FadeTransition(
      opacity: _fadeIn,
      child: SlideTransition(
        position: _slideUp,
        child: Column(
          children: [
            _buildAvatarCard(),
            const SizedBox(height: 48),
            _buildTextContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.12),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.accentGreen,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Available for work',
                style: AppTextStyles.label.copyWith(
                  color: AppColors.accentGreen,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Hi, I\'m',
          style: AppTextStyles.body.copyWith(
            fontSize: 18,
            color: AppColors.textSecondary,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 4),
        ShaderMask(
          shaderCallback: (bounds) =>
              AppColors.primaryGradient.createShader(bounds),
          child: Text(
            AppStrings.name,
            style:
                (isMobile
                        ? AppTextStyles.heroTitleMobile
                        : AppTextStyles.heroTitle)
                    .copyWith(color: Colors.white),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Text(
              'I\'m a ',
              style: AppTextStyles.body.copyWith(fontSize: isMobile ? 18 : 22),
            ),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  'Flutter Developer',
                  textStyle: AppTextStyles.body.copyWith(
                    fontSize: isMobile ? 18 : 22,
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                  ),
                  speed: const Duration(milliseconds: 80),
                ),
                TypewriterAnimatedText(
                  'Mobile App Developer',
                  textStyle: AppTextStyles.body.copyWith(
                    fontSize: isMobile ? 18 : 22,
                    color: AppColors.accentGreen,
                    fontWeight: FontWeight.w600,
                  ),
                  speed: const Duration(milliseconds: 80),
                ),

                // TypewriterAnimatedText(
                //   'UI/UX Enthusiast',
                //   textStyle: AppTextStyles.body.copyWith(
                //     fontSize: isMobile ? 18 : 22,
                //     color: const Color.fromARGB(255, 175, 173, 174),
                //     fontWeight: FontWeight.w600,
                //   ),
                //   speed: const Duration(milliseconds: 80),
                // ),
                // TypewriterAnimatedText(
                //   'Full Stack Dev',
                //   textStyle: AppTextStyles.body.copyWith(
                //     fontSize: isMobile ? 18 : 22,
                //     color: AppColors.primaryLight,
                //     fontWeight: FontWeight.w600,
                //   ),
                //   speed: const Duration(milliseconds: 80),
                // ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: isMobile ? double.infinity : 520,
          child: Text(
            AppStrings.aboutText,
            style: AppTextStyles.body.copyWith(fontSize: 15),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),
        const SizedBox(height: 36),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            GlowingButton(
              text: 'Hire Me',
              onPressed: widget.onContactPressed,
              icon: const Icon(
                Icons.mail_outline,
                color: Colors.white,
                size: 18,
              ),
            ),
            // GlowingButton(
            //   text: 'Download CV',
            //   onPressed: () {},
            //   outlined: true,
            //   icon: const Icon(Icons.download_outlined, size: 18),
            // ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Text('Follow me:', style: AppTextStyles.bodySmall),
            const SizedBox(width: 16),
            _SocialIcon(FontAwesomeIcons.github, AppStrings.github),
            _SocialIcon(FontAwesomeIcons.linkedin, AppStrings.linkedin),
            // _SocialIcon(FontAwesomeIcons.twitter, AppStrings.twitter),
          ],
        ),
        const SizedBox(height: 48),
        _buildStatsRow(isMobile),
      ],
    );
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

  Widget _buildAvatarCard() {
    return Center(
      child: AnimatedGradientBorder(
        borderRadius: 24,
        borderWidth: 2,
        child: Container(
          width: 320,
          height: 380,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              // Background glow
              Positioned(
                top: -40,
                right: -40,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.15),
                  ),
                ),
              ),
              Positioned(
                bottom: -40,
                left: -40,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accent.withOpacity(0.1),
                  ),
                ),
              ),
              // Avatar placeholder
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.primaryGradient,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.4),
                            blurRadius: 30,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'ZS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      AppStrings.name,
                      style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 6),
                    ShaderMask(
                      shaderCallback: (b) =>
                          AppColors.primaryGradient.createShader(b),
                      child: Text(
                        'Flutter Developer',
                        style: AppTextStyles.label.copyWith(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 8,
                      children: ['Flutter', 'Dart', 'Firebase'].map((t) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            t,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primaryLight,
                              fontSize: 11,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;
  const _SocialIcon(this.icon, this.url);

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(right: 10),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: _hovered ? AppColors.primary : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered ? AppColors.primary : AppColors.cardBorder,
            ),
          ),
          child: Center(
            child: FaIcon(widget.icon, size: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

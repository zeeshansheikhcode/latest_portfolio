import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../utils/responsive.dart';
import '../widgets/glowing_button.dart';
import '../widgets/section_header.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _subjectCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  bool _sending = false;
  bool _sent = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _subjectCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _sending = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _sending = false;
        _sent = true;
      });
      await Future.delayed(const Duration(seconds: 3));
      setState(() => _sent = false);
      _nameCtrl.clear();
      _emailCtrl.clear();
      _subjectCtrl.clear();
      _messageCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final hPad = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.background,
            AppColors.surface,
            AppColors.background,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const SectionHeader(
            label: 'Contact',
            title: 'Get In Touch',
            subtitle:
                'Have a project in mind? Let\'s build something great together.',
          ),
          const SizedBox(height: 64),
          isMobile
              ? Column(
                  children: [
                    _buildContactInfo(),
                    const SizedBox(height: 40),
                    _buildForm(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildContactInfo()),
                    const SizedBox(width: 40),
                    Expanded(flex: 3, child: _buildForm()),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's talk!",
          style: AppTextStyles.sectionTitle.copyWith(fontSize: 28),
        ),
        const SizedBox(height: 16),
        Text(
          'I\'m always open to discussing new projects, creative ideas, or opportunities to be part of your vision.',
          style: AppTextStyles.body,
        ),
        const SizedBox(height: 36),
        _ContactInfoItem(Icons.mail_outline, 'Email', AppStrings.email),
        const SizedBox(height: 20),
        _ContactInfoItem(
          Icons.location_on_outlined,
          'Location',
          'Lahore, Pakistan',
        ),
        const SizedBox(height: 20),
        _ContactInfoItem(
          Icons.access_time_outlined,
          'Availability',
          'Mon - Fri, 9AM - 6PM',
        ),
        const SizedBox(height: 36),
        Text('Find me on:', style: AppTextStyles.bodySmall),
        const SizedBox(height: 14),
        Row(
          children: [
            // _SocialBtn(
            //   FontAwesomeIcons.github,
            //   AppColors.textSecondary,
            //   AppStrings.github,
            // ),
            const SizedBox(width: 12),
            _SocialBtn(
              FontAwesomeIcons.linkedin,
              const Color(0xFF0A66C2),
              AppStrings.linkedin,
            ),
            const SizedBox(width: 12),
            //  _SocialBtn(FontAwesomeIcons.twitter, const Color(0xFF1DA1F2), AppStrings.twitter),
          ],
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(32),
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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildField(
                    'Your Name',
                    _nameCtrl,
                    Icons.person_outline,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildField(
                    'Your Email',
                    _emailCtrl,
                    Icons.mail_outline,
                    isEmail: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildField('Subject', _subjectCtrl, Icons.subject_outlined),
            const SizedBox(height: 16),
            _buildField(
              'Message',
              _messageCtrl,
              Icons.message_outlined,
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _sent
                  ? Container(
                      key: const ValueKey('sent'),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.accentGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.accentGreen.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle_outline,
                            color: AppColors.accentGreen,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Message sent successfully!',
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.accentGreen,
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      key: const ValueKey('btn'),
                      width: double.infinity,
                      child: _sending
                          ? Container(
                              height: 52,
                              decoration: BoxDecoration(
                                gradient: AppColors.primaryGradient,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                ),
                              ),
                            )
                          : GlowingButton(
                              text: 'Send Message',
                              onPressed: _sendMessage,
                              icon: const Icon(
                                Icons.send_outlined,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(
    String hint,
    TextEditingController ctrl,
    IconData icon, {
    bool isEmail = false,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: ctrl,
      maxLines: maxLines,
      style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
      validator: (v) {
        if (v == null || v.isEmpty) return 'This field is required';
        if (isEmail && !v.contains('@')) return 'Invalid email';
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.body.copyWith(color: AppColors.textMuted),
        prefixIcon: maxLines == 1
            ? Icon(icon, color: AppColors.textMuted, size: 18)
            : null,
        filled: true,
        fillColor: AppColors.surfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cardBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cardBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.accentPink),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String label, value;
  const _ContactInfoItem(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppTextStyles.bodySmall),
            Text(
              value,
              style: AppTextStyles.body.copyWith(
                color: AppColors.textPrimary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialBtn extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String url;
  const _SocialBtn(this.icon, this.color, this.url);

  @override
  State<_SocialBtn> createState() => _SocialBtnState();
}

class _SocialBtnState extends State<_SocialBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: _hovered
              ? (Matrix4.identity()..translate(0.0, -3.0))
              : Matrix4.identity(),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: _hovered
                ? widget.color.withOpacity(0.15)
                : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered
                  ? widget.color.withOpacity(0.4)
                  : AppColors.cardBorder,
            ),
          ),
          child: Center(
            child: FaIcon(
              widget.icon,
              size: 18,
              color: _hovered ? widget.color : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

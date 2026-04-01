import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../utils/responsive.dart';

class NavbarSection extends StatefulWidget {
  //final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onExperiencePressed;
  final VoidCallback onContactPressed;

  const NavbarSection({
    super.key,
    // required this.onHomePressed,
    required this.onAboutPressed,
    required this.onSkillsPressed,
    required this.onProjectsPressed,
    required this.onExperiencePressed,
    required this.onContactPressed,
  });

  @override
  State<NavbarSection> createState() => _NavbarSectionState();
}

class _NavbarSectionState extends State<NavbarSection> {
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final hPad = Responsive.horizontalPadding(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.9),
        border: const Border(
          bottom: BorderSide(color: AppColors.cardBorder, width: 1),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                GestureDetector(
                  //   onTap: widget.onHomePressed,
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Z',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Zeeshan Sheikhs',
                        style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                if (!isMobile) ...[
                  Row(
                    children: [
                      // _NavItem('Home', widget.onHomePressed),
                      _NavItem('About', widget.onAboutPressed),
                      _NavItem('Skills', widget.onSkillsPressed),
                      _NavItem('Projects', widget.onProjectsPressed),
                      _NavItem('Experience', widget.onExperiencePressed),
                      const SizedBox(width: 8),
                      _ContactButton(widget.onContactPressed),
                    ],
                  ),
                ] else ...[
                  IconButton(
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        _menuOpen ? Icons.close : Icons.menu,
                        key: ValueKey(_menuOpen),
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => setState(() => _menuOpen = !_menuOpen),
                  ),
                ],
              ],
            ),
          ),
          if (isMobile && _menuOpen)
            _MobileMenu(
              onClose: () => setState(() => _menuOpen = false),
              // onHomePressed: widget.onHomePressed,
              onAboutPressed: widget.onAboutPressed,
              onSkillsPressed: widget.onSkillsPressed,
              onProjectsPressed: widget.onProjectsPressed,
              onExperiencePressed: widget.onExperiencePressed,
              onContactPressed: widget.onContactPressed,
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavItem(this.label, this.onTap);

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: AppTextStyles.navItem.copyWith(
              color: _hovered ? AppColors.primary : AppColors.textSecondary,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  final VoidCallback onTap;
  const _ContactButton(this.onTap);

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
          decoration: BoxDecoration(
            gradient: _hovered
                ? AppColors.accentGradient
                : AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 15,
                    ),
                  ]
                : [],
          ),
          child: Text(
            'Contact Me',
            style: AppTextStyles.buttonText.copyWith(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final VoidCallback onClose;
  //final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onExperiencePressed;
  final VoidCallback onContactPressed;

  const _MobileMenu({
    required this.onClose,
    // required this.onHomePressed,
    required this.onAboutPressed,
    required this.onSkillsPressed,
    required this.onProjectsPressed,
    required this.onExperiencePressed,
    required this.onContactPressed,
  });

  void _navigate(VoidCallback action) {
    onClose();
    action();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          // _MobileNavItem('Home', () => _navigate(onHomePressed)),
          _MobileNavItem('About', () => _navigate(onAboutPressed)),
          _MobileNavItem('Skills', () => _navigate(onSkillsPressed)),
          _MobileNavItem('Projects', () => _navigate(onProjectsPressed)),
          _MobileNavItem('Experience', () => _navigate(onExperiencePressed)),
          _MobileNavItem('Contact', () => _navigate(onContactPressed)),
        ],
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _MobileNavItem(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Text(label, style: AppTextStyles.navItem.copyWith(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

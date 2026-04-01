import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../utils/responsive.dart';
import '../widgets/section_header.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  bool _visible = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final hPad = Responsive.horizontalPadding(context);

    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_visible) {
          setState(() => _visible = true);
          _controller.forward();
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 100),
        child: Column(
          children: [
            const SectionHeader(
              label: 'My Skills',
              title: 'What I Work With',
              subtitle: 'Technologies and tools I\'ve mastered over the years',
            ),
            const SizedBox(height: 64),
            _buildTechIcons(),
            const SizedBox(height: 64),
            isMobile
                ? _buildSkillBars(context)
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildSkillBars(
                          context,
                          startIndex: 0,
                          endIndex: 4,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: _buildSkillBars(
                          context,
                          startIndex: 4,
                          endIndex: 8,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechIcons() {
    final techs = [
      {'label': 'Flutter', 'emoji': '💙', 'color': '44D9E8'},
      {'label': 'Dart', 'emoji': '🎯', 'color': '00B4D8'},
      {'label': 'Firebase', 'emoji': '🔥', 'color': 'FFA500'},
      {'label': 'Git', 'emoji': '🌿', 'color': 'F44D27'},
      {'label': 'Figma', 'emoji': '🎨', 'color': 'A259FF'},
      {'label': 'REST API', 'emoji': '🌐', 'color': '00D4FF'},
      {'label': 'Bloc', 'emoji': '🧩', 'color': '6C63FF'},
      {'label': 'GetX', 'emoji': '🧩', 'color': '6C63FF'},
      {'label': 'Provider', 'emoji': '🧩', 'color': '6C63FF'},
      {'label': 'SQLite', 'emoji': '🗄️', 'color': '44AA88'},
      {'label': 'HIVE', 'emoji': '🗄️', 'color': '44AA88'},
      {'label': 'Cursor AI', 'emoji': '🗄️', 'color': '44AA88'},
      {'label': 'In App Purchases', 'emoji': '🗄️', 'color': '44AA88'},
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: techs.map((tech) {
        final color = Color(int.parse('FF${tech['color']}', radix: 16));
        return _TechChip(
          emoji: tech['emoji']!,
          label: tech['label']!,
          color: color,
        );
      }).toList(),
    );
  }

  Widget _buildSkillBars(
    BuildContext context, {
    int startIndex = 0,
    int endIndex = 8,
  }) {
    final skills = AppStrings.skills;
    final end = endIndex.clamp(0, skills.length);
    final start = startIndex.clamp(0, end);

    return Column(
      children: skills.sublist(start, end).asMap().entries.map((entry) {
        final delay = Duration(milliseconds: 100 * (entry.key + startIndex));
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: _AnimatedSkillBar(
            name: entry.value['name']!,
            level: int.parse(entry.value['level']!),
            animate: _visible,
            delay: delay,
          ),
        );
      }).toList(),
    );
  }
}

class _TechChip extends StatefulWidget {
  final String emoji, label;
  final Color color;
  const _TechChip({
    required this.emoji,
    required this.label,
    required this.color,
  });

  @override
  State<_TechChip> createState() => _TechChipState();
}

class _TechChipState extends State<_TechChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _hovered
            ? (Matrix4.identity()..translate(0.0, -4.0))
            : Matrix4.identity(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: _hovered ? widget.color.withOpacity(0.1) : AppColors.card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hovered
                ? widget.color.withOpacity(0.4)
                : AppColors.cardBorder,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.2),
                    blurRadius: 16,
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Text(widget.emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 6),
            Text(
              widget.label,
              style: AppTextStyles.bodySmall.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedSkillBar extends StatelessWidget {
  final String name;
  final int level;
  final bool animate;
  final Duration delay;

  const _AnimatedSkillBar({
    required this.name,
    required this.level,
    required this.animate,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: AppTextStyles.body.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$level%',
              style: AppTextStyles.label.copyWith(color: AppColors.accent),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(100),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeOutCubic,
                    width: animate ? constraints.maxWidth * level / 100 : 0,
                    height: 6,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

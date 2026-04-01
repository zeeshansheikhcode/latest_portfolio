import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_strings.dart';
import '../utils/responsive.dart';
import '../widgets/section_header.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 100),
      child: Column(
        children: [
          const SectionHeader(
            label: 'Experience',
            title: 'Work History',
            subtitle: 'My professional journey in the world of software development',
          ),
          const SizedBox(height: 64),
          isMobile
              ? Column(
                  children: AppStrings.experience
                      .asMap()
                      .entries
                      .map((e) => _TimelineItem(
                            experience: e.value,
                            index: e.key,
                            isLast: e.key == AppStrings.experience.length - 1,
                          ))
                      .toList(),
                )
              : SizedBox(
                  width: 800,
                  child: Column(
                    children: AppStrings.experience
                        .asMap()
                        .entries
                        .map((e) => _TimelineItem(
                              experience: e.value,
                              index: e.key,
                              isLast: e.key == AppStrings.experience.length - 1,
                            ))
                        .toList(),
                  ),
                ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  final Map<String, String> experience;
  final int index;
  final bool isLast;

  const _TimelineItem({
    required this.experience,
    required this.index,
    required this.isLast,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = [
      AppColors.primary,
      AppColors.accent,
      AppColors.accentGreen,
    ];
    final color = colors[widget.index % colors.length];

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline column
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                margin: const EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.4),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              if (!widget.isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color.withOpacity(0.5), Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          // Card
          Expanded(
            child: MouseRegion(
              onEnter: (_) => setState(() => _hovered = true),
              onExit: (_) => setState(() => _hovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(bottom: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _hovered ? color.withOpacity(0.4) : AppColors.cardBorder,
                  ),
                  boxShadow: _hovered
                      ? [BoxShadow(color: color.withOpacity(0.15), blurRadius: 20)]
                      : [],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.experience['role']!,
                                  style: AppTextStyles.cardTitle),
                              const SizedBox(height: 4),
                              ShaderMask(
                                shaderCallback: (b) =>
                                    AppColors.primaryGradient.createShader(b),
                                child: Text(widget.experience['company']!,
                                    style: AppTextStyles.label
                                        .copyWith(color: Colors.white, fontSize: 13)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: color.withOpacity(0.2)),
                          ),
                          child: Text(
                            widget.experience['period']!,
                            style: AppTextStyles.bodySmall
                                .copyWith(color: color, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(widget.experience['description']!,
                        style: AppTextStyles.body.copyWith(fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

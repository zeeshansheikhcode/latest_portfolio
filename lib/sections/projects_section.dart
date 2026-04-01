import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../utils/responsive.dart';
import '../widgets/section_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final hPad = Responsive.horizontalPadding(context);

    int crossAxisCount = 3;
    if (isMobile)
      crossAxisCount = 1;
    else if (isTablet)
      crossAxisCount = 2;

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
            label: 'My Projects',
            title: 'Featured Work',
            subtitle:
                'A showcase of apps I\'ve built with passion and precision',
          ),
          const SizedBox(height: 64),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 1.0 : 0.85,
            ),
            itemCount: AppStrings.projects.length,
            itemBuilder: (context, i) {
              return _ProjectCard(project: AppStrings.projects[i]);
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorHex = widget.project['color'] as String;
    final color = Color(int.parse('FF$colorHex', radix: 16));
    final techs = widget.project['tech'] as List;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: _hovered
            ? (Matrix4.identity()..translate(0.0, -8.0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.card,
          border: Border.all(
            color: _hovered ? color.withOpacity(0.5) : AppColors.cardBorder,
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.2),
                    blurRadius: 30,
                    offset: const Offset(0, 12),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: icon + links
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: color.withOpacity(0.3)),
                    ),
                    child: Center(
                      child: Text(
                        widget.project['icon'] as String,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // _LinkBtn(Icons.code, 'GitHub'),
                      // const SizedBox(width: 8),
                      _LinkBtn(
                        Icons.open_in_new,
                        'Live',
                        widget.project['live'],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                widget.project['title'] as String,
                style: AppTextStyles.cardTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  widget.project['description'] as String,
                  style: AppTextStyles.bodySmall.copyWith(height: 1.6),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 16),
              // Tech tags
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: techs.map((t) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: color.withOpacity(0.2)),
                    ),
                    child: Text(
                      t as String,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: color,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LinkBtn extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final String url;
  const _LinkBtn(this.icon, this.tooltip, this.url);

  @override
  State<_LinkBtn> createState() => _LinkBtnState();
}

class _LinkBtnState extends State<_LinkBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: () async {
            final String urlString = widget.url; // your URL as String
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
            duration: const Duration(milliseconds: 150),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: _hovered ? AppColors.primary : AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _hovered ? AppColors.primary : AppColors.cardBorder,
              ),
            ),
            child: Icon(widget.icon, size: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class GlowingButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool outlined;
  final List<Color>? gradientColors;
  final Widget? icon;

  const GlowingButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.outlined = false,
    this.gradientColors,
    this.icon,
  });

  @override
  State<GlowingButton> createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = widget.gradientColors ??
        [AppColors.primary, AppColors.accent];

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: widget.outlined
              ? null
              : LinearGradient(colors: colors),
          border: widget.outlined
              ? Border.all(
                  color: _hovered ? AppColors.primary : AppColors.cardBorder,
                  width: 1.5,
                )
              : null,
          boxShadow: _hovered && !widget.outlined
              ? [
                  BoxShadow(
                    color: colors.first.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  )
                ]
              : [],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: _hovered
                  ? (Matrix4.identity()..translate(0.0, -2.0))
                  : Matrix4.identity(),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) ...[
                    widget.icon!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    widget.text,
                    style: AppTextStyles.buttonText.copyWith(
                      color: widget.outlined
                          ? (_hovered ? AppColors.primary : AppColors.textSecondary)
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

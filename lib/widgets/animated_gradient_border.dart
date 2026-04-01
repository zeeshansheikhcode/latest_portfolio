import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AnimatedGradientBorder extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final double borderWidth;

  const AnimatedGradientBorder({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.borderWidth = 1.5,
  });

  @override
  State<AnimatedGradientBorder> createState() => _AnimatedGradientBorderState();
}

class _AnimatedGradientBorderState extends State<AnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _GradientBorderPainter(
            animation: _controller.value,
            borderRadius: widget.borderRadius,
            borderWidth: widget.borderWidth,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: widget.child,
          ),
        );
      },
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  final double animation;
  final double borderRadius;
  final double borderWidth;

  _GradientBorderPainter({
    required this.animation,
    required this.borderRadius,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    final gradient = SweepGradient(
      center: Alignment.center,
      startAngle: 0,
      endAngle: 2 * pi,
      transform: GradientRotation(animation * 2 * pi),
      colors: const [
        AppColors.primary,
        AppColors.accent,
        AppColors.accentGreen,
        AppColors.accentPink,
        AppColors.primary,
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant _GradientBorderPainter oldDelegate) =>
      oldDelegate.animation != animation;
}

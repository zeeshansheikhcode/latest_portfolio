import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ParticlesBackground extends StatefulWidget {
  const ParticlesBackground({super.key});

  @override
  State<ParticlesBackground> createState() => _ParticlesBackgroundState();
}

class _ParticlesBackgroundState extends State<ParticlesBackground>
    with TickerProviderStateMixin {
  late List<_Particle> particles;
  late AnimationController _controller;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    particles = List.generate(40, (_) => _Particle(_random));
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
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
      builder: (_, __) {
        for (final p in particles) p.update();
        return CustomPaint(
          painter: _ParticlesPainter(particles),
          child: Container(),
        );
      },
    );
  }
}

class _Particle {
  late double x, y, size, speed, opacity;
  final Random random;

  _Particle(this.random) {
    _reset();
  }

  void _reset() {
    x = random.nextDouble();
    y = random.nextDouble();
    size = random.nextDouble() * 2 + 0.5;
    speed = random.nextDouble() * 0.0005 + 0.0001;
    opacity = random.nextDouble() * 0.4 + 0.1;
  }

  void update() {
    y -= speed;
    if (y < 0) _reset();
  }
}

class _ParticlesPainter extends CustomPainter {
  final List<_Particle> particles;
  _ParticlesPainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      AppColors.primary,
      AppColors.accent,
      AppColors.accentGreen,
      AppColors.accentPink,
    ];
    for (int i = 0; i < particles.length; i++) {
      final p = particles[i];
      final paint = Paint()
        ..color = colors[i % colors.length].withOpacity(p.opacity)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        p.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

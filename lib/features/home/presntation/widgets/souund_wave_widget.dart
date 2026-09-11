import 'dart:math';
import 'package:flutter/material.dart';

class SoundWaveWidget extends StatefulWidget {
  const SoundWaveWidget({super.key});

  @override
  State<SoundWaveWidget> createState() => _SoundWaveWidgetState();
}

class _SoundWaveWidgetState extends State<SoundWaveWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
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
          size: const Size(double.infinity, 100),
          painter: SoundWavePainter(_controller.value),
        );
      },
    );
  }
}

class SoundWavePainter extends CustomPainter {
  final double animationValue;
  SoundWavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final barCount = 30;
    final barWidth = size.width / barCount;

    for (int i = 0; i < barCount; i++) {
      // Vary phase per bar so they don't move in lockstep
      final phase = animationValue * 2 * pi + (i * 0.3);
      final heightFactor = (cos(phase) + 1) / 2; // 0..1
      final barHeight = 10 + heightFactor * (size.height - 10);
      final x = i * barWidth + barWidth / 2;
      final centerY = size.height / 2;
      canvas.drawLine(
        Offset(x, centerY - barHeight / 2),
        Offset(x, centerY + barHeight / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant SoundWavePainter oldDelegate) => true;
}
//
import 'dart:math' as math;

import 'package:flutter/material.dart';

class ScoreWidget extends StatefulWidget {
  final double score;
  final double size;

  const ScoreWidget({
    super.key,
    required this.score,
    this.size = 170,
  });

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get scoreColor {
    if (widget.score >= 90) {
      return const Color(0xFF16C784);
    }

    if (widget.score >= 75) {
      return const Color(0xFF42C96B);
    }

    if (widget.score >= 60) {
      return const Color(0xFFF5B700);
    }

    if (widget.score >= 40) {
      return const Color(0xFFFF8A00);
    }

    return const Color(0xFFE53935);
  }

  String get scoreText {
    if (widget.score >= 90) return "Excelente";
    if (widget.score >= 75) return "Muy bueno";
    if (widget.score >= 60) return "Bueno";
    if (widget.score >= 40) return "Regular";
    return "Malo";
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [

              Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: scoreColor.withValues(alpha: .25),
                      blurRadius: 35,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),

              CustomPaint(
                size: Size.square(widget.size),
                painter: _ScorePainter(
                  progress: (widget.score.clampScore() / 100) * _animation.value,
                  color: scoreColor,
                ),
              ),

              Transform.scale(
                scale: .85 + (_animation.value * .15),
                child: Container(
                  width: widget.size * .72,
                  height: widget.size * .72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .12),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text(
                        "NUTRIPET SCORE",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        widget.score.clampScore().toInt().toString(),
                        style: TextStyle(
                          fontSize: widget.size * .25,
                          fontWeight: FontWeight.bold,
                          height: .9,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        scoreText,
                        style: TextStyle(
                          color: scoreColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ScorePainter extends CustomPainter {
      final double progress;
        final Color color;

          _ScorePainter({
              required this.progress,
                  required this.color,
                    });

                      @override
                        void paint(Canvas canvas, Size size) {
                            final stroke = size.width * 0.09;

                                final center = Offset(
                                      size.width / 2,
                                            size.height / 2,
                                                );

                                                    final radius = (size.width / 2) - stroke;

                                                        final rect = Rect.fromCircle(
                                                              center: center,
                                                                    radius: radius,
                                                                        );

                                                                            // Fondo del anillo

                                                                                final background = Paint()
                                                                                      ..color = Colors.white.withValues(alpha: .18)
                                                                                            ..style = PaintingStyle.stroke
                                                                                                  ..strokeCap = StrokeCap.round
                                                                                                        ..strokeWidth = stroke;

                                                                                                            canvas.drawArc(
                                                                                                                  rect,
                                                                                                                        -math.pi / 2,
                                                                                                                              math.pi * 2,
                                                                                                                                    false,
                                                                                                                                          background,
                                                                                                                                              );

                                                                                                                                                  // Sombra del progreso

                                                                                                                                                      final glow = Paint()
                                                                                                                                                            ..shader = SweepGradient(
                                                                                                                                                                    startAngle: 0,
                                                                                                                                                                            endAngle: math.pi * 2,
                                                                                                                                                                                    colors: [
                                                                                                                                                                                              color.withValues(alpha: .15),
                                                                                                                                                                                                        color.withValues(alpha: .65),
                                                                                                                                                                                                                  color,
                                                                                                                                                                                                                            color.withValues(alpha: .65),
                                                                                                                                                                                                                                      color.withValues(alpha: .15),
                                                                                                                                                                                                                                              ],
                                                                                                                                                                                                                                                    ).createShader(rect)
                                                                                                                                                                                                                                                          ..maskFilter = const MaskFilter.blur(
                                                                                                                                                                                                                                                                  BlurStyle.normal,
                                                                                                                                                                                                                                                                          10,
                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                      ..style = PaintingStyle.stroke
                                                                                                                                                                                                                                                                                            ..strokeWidth = stroke + 1.5
                                                                                                                                                                                                                                                                                                  ..strokeCap = StrokeCap.round;

                                                                                                                                                                                                                                                                                                      canvas.drawArc(
                                                                                                                                                                                                                                                                                                            rect,
                                                                                                                                                                                                                                                                                                                  -math.pi / 2,
                                                                                                                                                                                                                                                                                                                        math.pi * 2 * progress,
                                                                                                                                                                                                                                                                                                                              false,
                                                                                                                                                                                                                                                                                                                                    glow,
                                                                                                                                                                                                                                                                                                                                        );

                                                                                                                                                                                                                                                                                                                                            // Arco principal

                                                                                                                                                                                                                                                                                                                                                final progressPaint = Paint()
                                                                                                                                                                                                                                                                                                                                                      ..shader = SweepGradient(
                                                                                                                                                                                                                                                                                                                                                              startAngle: -math.pi / 2,
                                                                                                                                                                                                                                                                                                                                                                      endAngle: math.pi * 1.5,
                                                                                                                                                                                                                                                                                                                                                                              colors: [
                                                                                                                                                                                                                                                                                                                                                                                        color.withValues(alpha: .55),
                                                                                                                                                                                                                                                                                                                                                                                                  color,
                                                                                                                                                                                                                                                                                                                                                                                                            Colors.white,
                                                                                                                                                                                                                                                                                                                                                                                                                      color,
                                                                                                                                                                                                                                                                                                                                                                                                                              ],
                                                                                                                                                                                                                                                                                                                                                                                                                                      stops: const [
                                                                                                                                                                                                                                                                                                                                                                                                                                                0,
                                                                                                                                                                                                                                                                                                                                                                                                                                                          .45,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    .72,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                              1,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ],
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ).createShader(rect)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ..strokeCap = StrokeCap.round
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ..strokeWidth = stroke
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ..style = PaintingStyle.stroke;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  canvas.drawArc(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        rect,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              -math.pi / 2,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    math.pi * 2 * progress,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          false,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                progressPaint,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    );

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        // Brillo final

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            final angle = (-math.pi / 2) + (math.pi * 2 * progress);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                final dot = Offset(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      center.dx + radius * math.cos(angle),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            center.dy + radius * math.sin(angle),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                );

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    canvas.drawCircle(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          dot,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                stroke * .48,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Paint()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ..color = Colors.white
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ..maskFilter = const MaskFilter.blur(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                BlurStyle.normal,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          8,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      );

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          canvas.drawCircle(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                dot,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      stroke * .28,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Paint()..color = color,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                );
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    @override
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      bool shouldRepaint(covariant _ScorePainter oldDelegate) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          return oldDelegate.progress != progress ||
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  oldDelegate.color != color;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    }

}
extension ScoreWidgetExtension on double {
  double clampScore() {
    if (isNaN) return 0;

    if (this < 0) return 0;

    if (this > 100) return 100;

    return this;
  }
}
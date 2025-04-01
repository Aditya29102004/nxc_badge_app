import 'package:flutter/material.dart';

class FadeIn extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;

  const FadeIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}

class SlideIn extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Offset begin;
  final Curve curve;

  const SlideIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
    this.begin = const Offset(0, 0.25),
    this.curve = Curves.easeOutCubic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: begin, end: Offset.zero),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Transform.translate(
          offset: value,
          child: child,
        );
      },
      child: child,
    );
  }
}

class ScaleIn extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double begin;

  const ScaleIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.begin = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: 1.0),
      duration: duration,
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }
}

class StaggeredAnimation extends StatelessWidget {
  final Widget child;
  final int position;
  final int totalItems;
  final Duration baseDuration;

  const StaggeredAnimation({
    Key? key,
    required this.child,
    required this.position,
    required this.totalItems,
    this.baseDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final delay = (position * 200).clamp(0, 1000);

    return FadeIn(
      delay: Duration(milliseconds: delay),
      child: SlideIn(
        begin: Offset(position.isEven ? -0.5 : 0.5, 0),
        duration: baseDuration,
        child: child,
      ),
    );
  }
}

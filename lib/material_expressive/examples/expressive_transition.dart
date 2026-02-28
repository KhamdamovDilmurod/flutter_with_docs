import 'package:flutter/material.dart';

class ExpressivePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  ExpressivePageRoute({required this.page})
      : super(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );

      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.1, 0),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
    },
  );
}

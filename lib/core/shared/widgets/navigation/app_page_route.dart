import 'package:flutter/material.dart';

class AppPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Duration transitionDurationValue;
  final Duration reverseTransitionDurationValue;

  AppPageRoute({
    required this.page,
    this.transitionDurationValue = const Duration(milliseconds: 400),
    this.reverseTransitionDurationValue = const Duration(milliseconds: 400),
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionDuration: transitionDurationValue,
         reverseTransitionDuration: reverseTransitionDurationValue,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           const begin = Offset(1.0, 0.0);
           const end = Offset.zero;
           const curve = Curves.easeInOutCubic;

           var tween = Tween(
             begin: begin,
             end: end,
           ).chain(CurveTween(curve: curve));
           var offsetAnimation = animation.drive(tween);
           var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
             CurvedAnimation(
               parent: animation,
               curve: const Interval(0.0, 0.8, curve: Curves.easeIn),
             ),
           );

           return SlideTransition(
             position: offsetAnimation,
             child: FadeTransition(opacity: fadeAnimation, child: child),
           );
         },
       );
}

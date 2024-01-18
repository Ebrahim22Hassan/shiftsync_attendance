import 'package:flutter/material.dart';

class AppNavigator {
  static void navigatorTo(BuildContext context, bool back, Widget widget) {
    if (back) {
      Navigator.push(
        context,
        CustomRoute(
          child: widget,
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        CustomRoute(
          child: widget,
        ),
      );
    }
  }

  static void dismiss(context) => Navigator.pop(context);

  static void navigatorToAndRemoveUntil(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      CustomRoute(
        child: widget,
      ),
          (route) => false,
    );
  }
}

class CustomRoute<T> extends PageRouteBuilder<T> {
  final Widget child;

  CustomRoute({required this.child})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      if (animation.status == AnimationStatus.reverse) {
        return AnimatedOpacity(
          opacity: 0.0,
          duration: const Duration(milliseconds: 300),
          child: child,
        );
      } else {
        return child;
      }
    },
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
  );

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
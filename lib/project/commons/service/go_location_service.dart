import 'package:flutter/material.dart';

class GoLocationService {
  GoLocationService._();

  static navigatorPush(BuildContext context, Widget pageClass) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pageClass));
  }

  static navigatorPushReplacemeant(BuildContext context, Widget pageClass) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => pageClass));
  }

  static navigatorPop(BuildContext context) {
    Navigator.pop(context);
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

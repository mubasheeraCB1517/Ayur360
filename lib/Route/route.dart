import 'package:flutter/cupertino.dart';

class RoutesName {
  static const String WELCOME_PAGE = '/welcome';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.WELCOME_PAGE:
        return _GeneratePageRoute(
            widget: WelcomeScreen(), routeName: settings.name);
      default:
        return _GeneratePageRoute(
            widget: WelcomeScreen(), routeName: settings.name);
    }
    }
}
class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String? routeName;

  _GeneratePageRoute({required this.widget, this.routeName})
      : super(
      settings: RouteSettings(name: routeName),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionDuration: Duration(milliseconds: 100),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        return SlideTransition(
          textDirection: TextDirection.ltr,
          position: Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      });
}
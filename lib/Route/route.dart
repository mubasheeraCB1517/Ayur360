import 'package:ayur360_app/Doctor/DashBoard/DashBoardMainScreen.dart';
import 'package:ayur360_app/Doctor/doctorLoginScreen.dart';
import 'package:ayur360_app/HomeScreen/Welcome.dart';
import 'package:ayur360_app/Patinet/RegistrationScreen/Patient_Registration.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

class RoutesName {
  static const String Patient_Registration = '/Patient_Registration';
  static const String WELCOME_PAGE = '/welcome';
   static const String LOGIN_PAGE = '/login Page';
   static const String DOCTOR_LOGIN = '/doctorLoginScreen';
  static const String DASHBOARD_PAGE = '/DashBoardMainScreen';


}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.Patient_Registration:
        return _GeneratePageRoute(widget:  PatientRegistration(), routeName: settings.name);}
    switch (settings.name) {
      case RoutesName.WELCOME_PAGE:
        return _GeneratePageRoute(
            widget: WelcomeScreen(), routeName: settings.name);

      case RoutesName.DOCTOR_LOGIN:
        return _GeneratePageRoute(
            widget: DoctorLogin (), routeName: settings.name);
      case RoutesName.DASHBOARD_PAGE:
        return _GeneratePageRoute(
            widget: DashBoard (), routeName: settings.name);

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
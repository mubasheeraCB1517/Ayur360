import 'package:ayur360_app/Helpers/CONSULTATIONS/LiveConsultation.dart';
import 'package:ayur360_app/Helpers/CONSULTATIONS/MyAppointments.dart';
import 'package:ayur360_app/Helpers/ChangePassword/ChangePasswordScrren.dart';
import 'package:ayur360_app/Helpers/DashBoard/DashBoardMainScreen.dart';
import 'package:ayur360_app/Helpers/MYPROFILE/MYProfileEditScreen.dart';
import 'package:ayur360_app/Helpers/MYPROFILE/MyPracticeTimeScreen.dart';
import 'package:ayur360_app/Helpers/PATIENT/Appointmentlist.dart';
import 'package:ayur360_app/Helpers/PATIENT/ClinicalNotes.dart';
import 'package:ayur360_app/Helpers/PATIENT/LabTest.dart';
import 'package:ayur360_app/Helpers/PATIENT/Treatmentplancreen.dart';
import 'package:ayur360_app/Helpers/PATIENT/VitalSign.dart';
import 'package:ayur360_app/Helpers/PATIENT/prescriptions.dart';
import 'package:ayur360_app/HomeScreen/Welcome.dart';
import 'package:ayur360_app/HomeScreen/doctorLoginScreen.dart';
import 'package:ayur360_app/HomeScreen/alluserlogin.dart';
import 'package:flutter/cupertino.dart';



//import '../Helpers/DashBoard/UserSetting/MYPROFILE/Myprofilescreeen.dart';
import '../Helpers/MYPROFILE/Myprofilescreeen.dart';
import '../Helpers/UserSetting/DoctorEventScreen.dart';
import '../main.dart';

class RoutesName {
  static const String HOME_PAGE = '/home';
  static const String WELCOME_PAGE = '/welcome';
   static const String LOGIN_PAGE = '/alluserlogin';
   static const String DOCTOR_LOGIN = '/doctorLoginScreen';
  static const String DASHBOARD_PAGE = '/DashBoardMainScreen';
  static const String HOMEPAGE_ = '/homepage';
  static const String DOCTOR_EVENT = '/DoctorEventScreen';
  static const String MY_PROFILE ='/MyProfilescreeen';
  static const String PATIENT_PAGE ='/prescriptions';
  static const String APPINTMENT_PAGE ='/Appointmentlist';
  static const String LABTEST_PAGE ='/LabTest';
  static const String TREATMENT_PLAN = '/Treatmentplancreen';
  static const String VITAL_SIGN ='/VitalSign';
  static const String CLINICAL_NOTES = '/ClinicalNotes';
  static const String LIVE_CONSULTIION= '/LiveConsultation';
  static const String MY_APPOINTMENTS = '/MyAppointments';
  static const String MY_PROFILEEDIT = '/MYProfileEditScreen';
  static const String MY_PRACTICETIME = '/MyPracticeTimeScreen';
  static const String CHANGE_PASSWORD = '/ChangePasswordScrren';



}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.HOME_PAGE:
        return _GeneratePageRoute(widget: HomePage(), routeName: settings.name);}
    switch (settings.name) {
      case RoutesName.WELCOME_PAGE:
        return _GeneratePageRoute(
            widget: WelcomeScreen(), routeName: settings.name);

      case RoutesName.LOGIN_PAGE:
        return _GeneratePageRoute(
            widget: Login (), routeName: settings.name);
      case RoutesName.DOCTOR_LOGIN:
        return _GeneratePageRoute(
            widget: DoctorLogin (), routeName: settings.name);
      case RoutesName.DASHBOARD_PAGE:
        return _GeneratePageRoute(
            widget: DashBoard (), routeName: settings.name);
      case RoutesName.DOCTOR_EVENT:
        return _GeneratePageRoute(
            widget: DoctorEvent (), routeName: settings.name);
      case RoutesName.MY_PROFILE:
        return _GeneratePageRoute(
            widget: MyProfilescreen (), routeName: settings.name);
      case RoutesName.PATIENT_PAGE:
        return _GeneratePageRoute(
            widget: PrescriptionsScreen (), routeName: settings.name);
      case RoutesName.APPINTMENT_PAGE:
        return _GeneratePageRoute(
            widget: AppointmentlIstScreen (), routeName: settings.name);
      case RoutesName.LABTEST_PAGE:
        return _GeneratePageRoute(
            widget: LabTestScreen (), routeName: settings.name);
      case RoutesName.TREATMENT_PLAN:
        return _GeneratePageRoute(
            widget: TreatmentPlanScreen (), routeName: settings.name);
      case RoutesName.VITAL_SIGN:
        return _GeneratePageRoute(
            widget: VitalSignScreen (), routeName: settings.name);
      case RoutesName.CLINICAL_NOTES:
        return _GeneratePageRoute(
            widget: ClinicalNotesScreen (), routeName: settings.name);
      case RoutesName.LIVE_CONSULTIION:
        return _GeneratePageRoute(
            widget: LiveConsutationcreen (), routeName: settings.name);
      case RoutesName.MY_APPOINTMENTS:
        return _GeneratePageRoute(
            widget: MYAppointmentScreen (), routeName: settings.name);
      case RoutesName.MY_PROFILEEDIT:
        return _GeneratePageRoute(
            widget: MyProfileEditScreen (), routeName: settings.name);
      case RoutesName.MY_PRACTICETIME:
        return _GeneratePageRoute(
            widget: MyPracticeTimeScreen (), routeName: settings.name);

      case RoutesName.CHANGE_PASSWORD:
        return _GeneratePageRoute(
            widget: ChangePasswordScreen (), routeName: settings.name);

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
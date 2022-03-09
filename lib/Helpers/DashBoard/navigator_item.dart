import 'package:ayur360_app/Helpers/CONSULTATIONS/MyAppointments.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:flutter/material.dart';

import '../CONSULTATIONS/LiveConsultation.dart';
import '../UserSetting/DoctorEventScreen.dart';
import 'DashBoardMainScreen.dart';
import 'homepage.dart';

class NavigatorItem {
  final String label;
  final int index;

  final  screen;
  final ICON;




  NavigatorItem(this.label, this.index, this.screen,this
  .ICON);
}
List  <NavigatorItem>  navigatorItems = [

  NavigatorItem("Home", 0, homepage(),Icon(Icons.home)),
  NavigatorItem(
      "Consultation", 1, LiveConsutationcreen(),Icon( Icons.video_call_outlined,size: 35,)),
  NavigatorItem("Appointments",  2, MYAppointmentScreen(),Icon(  Icons.calendar_today_outlined)),

  NavigatorItem("Doctor Events",  3, DoctorEvent(),Icon( Icons.event_note_sharp)),

 // NavigatorItem("Account", "assets/icons/account_icon.svg", 4, Cus_id == null?LoginPage():AccountScreen(),0),
];

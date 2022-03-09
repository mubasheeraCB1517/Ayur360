import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../Route/route.dart';
import 'navigator_item.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(


     body:
     navigatorItems[currentIndex].screen,
      bottomNavigationBar: Container(


        decoration: BoxDecoration(

          borderRadius: BorderRadius.only(
            // topRight: Radius.circular(15),
            // topLeft: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 37,
                offset: Offset(0, -12)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(15),
            // topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.green[900],
            currentIndex: currentIndex,
            onTap: (index) async {

              if (index == 0)
              { Icons.home;

                print("hellooooooooo");
                setState(()   {

                  currentIndex = index;




                });

              }
              if (index == 1)
              {

                setState(()  {

                  currentIndex = index;


                });

              }
              if (index == 2)
              {

                setState(()   {

                  currentIndex = index;

                });

              }
              if (index == 3)
              {
                setState(()  {

                  currentIndex = index;
                  print("index==${index}");

                });

              }



            },

            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,

            selectedIconTheme: IconThemeData(
              color: Colors.white,
            ),
            unselectedIconTheme: IconThemeData(
              color:Colors.orange[800],

            ),
iconSize: 29
            ,

            // selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            //unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedItemColor: Colors.white,
            items: navigatorItems.map((e) {
              return getNavigationBarItem(
                  label: e.label, index: e.index,icon: e.ICON);
            }).toList(),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getNavigationBarItem(
      {required String label,  required int index,required icon}) {
    Color iconColor =
    index == currentIndex ? Colors.black : Colors.white;

    return
      BottomNavigationBarItem(
          label: label,
          icon:icon
      );
  }

//
//   List<Meeting> _getDataSource() {
//     final List<Meeting> meetings = <Meeting>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime =
//     DateTime(today.year, today.month, today.day, 9, 0, 0);
//     final DateTime endTime = startTime.add(const Duration(hours: 2));
//     meetings.add(Meeting(
//         'Conference', startTime, endTime, const Color(0xFF0F8644), false));
//     return meetings;
//   }
//
//
// class MeetingDataSource extends CalendarDataSource {
//   /// Creates a meeting data source, which used to set the appointment
//   /// collection to the calendar
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }
//
//   @override
//   DateTime getStartTime(int index) {
//     return _getMeetingData(index).from;
//   }
//
//   @override
//   DateTime getEndTime(int index) {
//     return _getMeetingData(index).to;
//   }
//
//   @override
//   String getSubject(int index) {
//     return _getMeetingData(index).eventName;
//   }
//
//   @override
//   Color getColor(int index) {
//     return _getMeetingData(index).background;
//   }
//
//   @override
//   bool isAllDay(int index) {
//     return _getMeetingData(index).isAllDay;
//   }
//
//   Meeting _getMeetingData(int index) {
//     final dynamic meeting = appointments![index];
//     late final Meeting meetingData;
//     if (meeting is Meeting) {
//       meetingData = meeting;
//     }
//
//     return meetingData;
//   }
// }class Meeting {
//   /// Creates a meeting class with required details.
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
//
//   /// Event name which is equivalent to subject property of [Appointment].
//   String eventName;
//
//   /// From which is equivalent to start time property of [Appointment].
//   DateTime from;
//
//   /// To which is equivalent to end time property of [Appointment].
//   DateTime to;
//
//   /// Background which is equivalent to color property of [Appointment].
//   Color background;
//
//   /// IsAllDay which is equivalent to isAllDay property of [Appointment].
//   bool isAllDay;
// }
}

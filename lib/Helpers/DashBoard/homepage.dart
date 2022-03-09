import 'package:ayur360_app/Route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Container(
              width: width * 0.64,
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            SizedBox(
              width: 27,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    // color: Colors.white,
                    ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.green,
                                  size: 70,
                                ),
                                flex: 4,
                              ),
                              Expanded(
                                flex: 8,
                                child: Text(
                                  "Sarath R",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
              ExpansionTile(
                title: Row(
                    children: [Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                  Icons.local_hotel_outlined,
                  color: Colors.black,

                ),
                    ),
                      SizedBox(width: 15,),
                      Text("Patient",
                   style: TextStyle(fontSize: 22, color: Colors.grey[900],fontWeight: FontWeight.bold,),),
                    ]
              ),

                //Text("Patient",
                //     style: TextStyle(fontSize: 19, color: Colors.green[900],),),

                children: [
                  ListTile(
                    title: Text('     Prescriptions',
                        style:
                            TextStyle(fontSize: 19, color: Colors.green[900])),
                    onTap: () => {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, RoutesName.PATIENT_PAGE);
                      })
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: Text('     Appointment List',
                        style:
                            TextStyle(fontSize: 19, color: Colors.green[900])),
                    onTap: () => {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pushNamed(
                            context, RoutesName.APPINTMENT_PAGE);
                      })
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: Text('     Lab Tests',
                        style:
                            TextStyle(fontSize: 19, color: Colors.green[900])),
                    onTap: () => {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, RoutesName.LABTEST_PAGE);
                      })
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: Text('     Treatment Plan',
                        style:
                            TextStyle(fontSize: 19, color: Colors.green[900])),
                    onTap: () => {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, RoutesName.TREATMENT_PLAN);
                      })
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: Text('     Vital Sign',
                        style:
                            TextStyle(fontSize: 19, color: Colors.green[900])),
                    onTap: () => {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, RoutesName.VITAL_SIGN);
                      })
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: Text('     Clinical Notes',
                        style:
                            TextStyle(fontSize: 19, color: Colors.green[900])),
                    onTap: () => {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, RoutesName.CLINICAL_NOTES);
                      })
                    },
                  ),
                ],
                //leading: new Icon(Icons.mail),
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: Row(
                  children: [Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.account_box_outlined),
                  ),
                    
                    SizedBox(width: 15,),
                    Text(
                    "My Profile",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900]),
                  ),
                ]
                ),
                onTap: () {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, RoutesName.MY_PROFILE);
                  });
                },
              ),
              ListTile(
                title: Row(

                  children: [

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(Icons.visibility_outlined),
                    ),

                    SizedBox(width: 15,),
                    Text(
                    "Change password",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900]),
                  ),
                ]
                ),
                onTap: () {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                  });
                },
              ),
              ListTile(
                title: Row(

                  children: [


                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(Icons.logout),
                    ),
                    SizedBox(width: 15,),
                    Text(
                    "Log Out",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900]),
                  ),
                ]
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(children: [
          SfCalendar(
            view: CalendarView.month,
            dataSource: MeetingDataSource(_getDataSource()),
            // by default the month appointment display mode set as Indicator, we can
            // change the display mode as appointment using the appointment display
            // mode property
            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode:
                    MonthAppointmentDisplayMode.appointment),
          ),
        ]),
      )),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}

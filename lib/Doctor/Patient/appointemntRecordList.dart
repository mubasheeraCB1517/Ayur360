import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Route/route.dart';

class AppointmentRecordScreen extends StatefulWidget {
  const AppointmentRecordScreen({
    Key? key, this.AppointmentIds,
  }) : super(key: key);
final AppointmentIds;
  @override
  _AppointmentRecordScreenState createState() =>
      _AppointmentRecordScreenState();
}

class _AppointmentRecordScreenState extends State<AppointmentRecordScreen> {
//"assets/images/icons8-notes-100.png
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () =>
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Navigator.pushNamed(
                      context,
                      RoutesName.APPOINTMENT_LISTEDIT,
                    );
                  })),
          iconTheme: const IconThemeData(color: Colors.black),
          title: Row(
            children: [
              Container(
                width: width * 0.64,
                height: 30,
                margin: const EdgeInsets.only(left: 5),
                child: Center(
                    child: Text(
                  "RECORDS",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                width: 27,
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.only(top: 60),
              sliver: SliverGrid.count(
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Column(children: [
                    Container(
                      width: 160,
                      height: 150,
                      decoration:
                          BoxDecoration(color: Colors.green[400], boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(1.0, 0.0),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]), //B),
                      child: ElevatedButton(
                          onPressed: () {
                            WidgetsBinding.instance!.addPostFrameCallback((_) {
                              Navigator.pushNamed(
                                context,
                                RoutesName.APPOINTMENT_VITALSCREEN,arguments: widget.AppointmentIds,
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[400], // Background color
                          ),
                          child: Image.asset(
                            "assets/images/icons8-stethoscope-100-2.png",
                          )),
                    ),
                    Container(
                      width: 160,
                      height: 30,
                      child: Center(
                          child: const Text(
                        'Vital Sign',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )),
                      decoration:
                          BoxDecoration(color: Colors.green[400], boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]),
                    ),
                  ]),
                  Column(children: [
                    Container(
                      width: 160,
                      height: 150,
                      decoration:
                          BoxDecoration(color: Colors.green[400], boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(1.0, 0.0),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]), //B),
                      child: ElevatedButton(
                          onPressed: () {
                            WidgetsBinding.instance!.addPostFrameCallback((_) {
                              Navigator.pushNamed(
                                context,
                                RoutesName.APPOINTMENT_CLINICALNOTES,arguments: widget.AppointmentIds
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[400], // Background color
                          ),
                          child: Image.asset(
                            "assets/images/icons8-notes-100.png",
                          )),
                    ),
                    Container(
                      width: 160,
                      height: 30,
                      child: Center(
                          child: const Text('Clinical Notes',
                              style: TextStyle(fontSize: 18))),
                      decoration:
                          BoxDecoration(color: Colors.green[400], boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]),
                    ),
                  ]),
                  Column(children: [
                    Container(
                      width: 160,
                      height: 150,
                      decoration:
                          BoxDecoration(color: Colors.green[400], boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(1.0, 0.0),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]), //B),
                      child: ElevatedButton(
                          onPressed: () {
                            WidgetsBinding.instance!.addPostFrameCallback((_) {
                              Navigator.pushNamed(
                                context,
                                RoutesName.APPOINTMENT_LABTEST,arguments: widget.AppointmentIds
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[400], // Background color
                          ),
                          child: Image.asset(
                            "assets/images/icons8-test-100.png",
                          )),
                    ),
                    Container(
                      width: 160,
                      height: 30,
                      child: Center(
                          child: const Text('Lab Test',
                              style: TextStyle(fontSize: 18))),
                      decoration:
                          BoxDecoration(color: Colors.green[400], boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]),
                    ),
                  ]),
                  Column(children: [
                    Container(
                      width: 160,
                      height: 150,
                      decoration:
                          BoxDecoration(color: Colors.green[400], boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(1.0, 0.0),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]), //B),
                      child: ElevatedButton(
                        onPressed: () {
                          WidgetsBinding.instance!.addPostFrameCallback((_) {
                            Navigator.pushNamed(
                              context,
                              RoutesName.APOOINTEMENT_PRESCRIPTION,
                            );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[400], // Background color
                        ),
                        child: Image.asset(
                            "assets/images/icons8-prescription-100.png"),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 30,
                      child: Center(
                          child: const Text('Prescriptions',
                              style: TextStyle(fontSize: 18))),
                      decoration:
                          BoxDecoration(color: Colors.green[400], boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]),
                    ),
                  ]),
                  Column(children: [
                    Container(
                      width: 160,
                      height: 150,
                      decoration:
                          BoxDecoration(color: Colors.green[400], boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(1.0, 0.0),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]), //B),
                      child: ElevatedButton(
                        onPressed: () {
                          WidgetsBinding.instance!.addPostFrameCallback((_) {
                            Navigator.pushNamed(
                              context,
                              RoutesName.APPOINTEMENT_RECCONEXTAPPOINTEMNT,arguments: widget.AppointmentIds
                            );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[400], // Background color
                        ),
                        child: Image.asset("assets/images/whiterecommend.png"),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 50,
                      child: Center(
                          child: const Text(
                              ' Recommend & '
                              'Next Appointment',
                              style: TextStyle(fontSize: 18))),
                      decoration:
                          BoxDecoration(color: Colors.green[400], boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ]),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ));
  }
}

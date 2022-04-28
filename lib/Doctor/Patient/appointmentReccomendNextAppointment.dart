import 'package:ayur360_app/Constants.dart';
import 'package:ayur360_app/Doctor/bloc/appointmentTimeZoneBloc.dart';
import 'package:ayur360_app/Updater/network/response.dart';
import 'package:ayur360_app/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Route/route.dart';
import '../models/appointemntTimeaSlotsModel.dart';

String dates = "";
String selectedSlot = "";
var ReccomendArray = {};
DateTime selectedDate = DateTime.now();
String formattedDatenextAppointment = DateFormat('dd/MM/yyyy').format(selectedDate);

class AppointmentReccoNextAppointment extends StatefulWidget {
  AppointmentReccoNextAppointment({
    Key? key,
    required this.date,
    this.RecommendAndNextAppoID,
  }) : super(key: key);
  late final date;
  final RecommendAndNextAppoID;

  @override
  _AppointmentReccoNextAppointmentState createState() =>
      _AppointmentReccoNextAppointmentState();
}

class _AppointmentReccoNextAppointmentState
    extends State<AppointmentReccoNextAppointment> {
  @override
  late AppointmentTimeZoneBloc _bloc;
  late List<AppointmentTimeZoneModel> prescriptiontimelist;

  void initState() {
    super.initState();
    _bloc = AppointmentTimeZoneBloc(formattedDatenextAppointment);
    setState(() {});
  }

  Widget build(BuildContext context) {
    int selectedIndex = -1;
    List TimeArray =[];
    double width = MediaQuery.of(context).size.width;
    TextEditingController RecommendController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Container(
              width: width * 0.7,
              height: 30,
              margin: const EdgeInsets.only(right: 5),
              child: Center(
                  child: Text(
                "Reccomend & NextAppointment",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              width: 27,
            ),
          ],
        ),
      ),
      body: StreamBuilder<Response<List<AppointmentTimeZoneModel>>>(
          stream: _bloc.TimeZoneDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return LessonViewShimmer(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                  break;
                case Status.SUCCESS:
                  prescriptiontimelist = snapshot.data!.data;

                  print(
                      "prescriptiontimelist->>>>>>>>>>>${prescriptiontimelist.length}");
                 // print("s->>>>>>>>>>>${prescriptiontimelist[0].slotes}");
                  return SingleChildScrollView(
                    child: StatefulBuilder(builder: (context, setState) {
                      DateTime date;
                      String checkin = "";

                      return Column(children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              ReccomendArray = {
                                "recommendId": 0,
                                "recommends": RecommendController.text,
                                "appointmentId": widget.RecommendAndNextAppoID,
                                "clinicId": ClinicId
                              };
                              selectedSlot = TimeArray[0];
                              print("selectedslot->>>>${selectedSlot}");
                              WidgetsBinding.instance!
                                  .addPostFrameCallback((_) {
                                Navigator.pushNamed(context,
                                    RoutesName.APPOINTMENT_RECORDSCREEN);
                              });
                              print("vitalsignArray->>>>>>>.${ReccomendArray}");
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            margin: EdgeInsets.only(left: 300),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.red[900],
                            ),
                            child: Center(
                                child: Text(
                              "Done",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 140,
                          margin: EdgeInsets.only(top: 30, right: 230),
                          child: Text(
                            "Recommends",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30, top: 20),
                          child: TextField(
                            controller: RecommendController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Recommends',
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 190,
                          margin: EdgeInsets.only(top: 40, right: 180),
                          child: Text(
                            "Next Appointment",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectDate(context);
                            });
                          },
                          child: Text("Choose Date"),
                        ),
                        Text(
                            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                        ListView.builder(
                            itemCount: prescriptiontimelist.length == null
                                ? 0
                                : prescriptiontimelist.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              print(
                                  "timelist->>>>>>>${prescriptiontimelist.length}");
                              return InkWell(
                                onTap: () {
                                  TimeArray.clear();
                                  setState(() => selectedIndex = index);

                                  TimeArray.add(prescriptiontimelist[index].slotes);
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 60,
                                      width: 400,
                                      child: Card(
                                        shape: (selectedIndex == index)
                                            ? RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.blue,
                                                    width: 3))
                                            : null,
                                        elevation: 10,
                                        //   color: Colors.red,
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: ListTile(
                                          title: Center(
                                            child: Container(
                                              width: 300,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.blue)),
                                              child: Center(
                                                child: Text(
                                                  "   ${prescriptiontimelist[index].slotes}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.red[900],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider()
                                  ],
                                ),
                              );
                            })
                      ]);
                    }),
                  );
                  break;
                case Status.ERROR:
                  return Container(
                    color: Colors.yellow,
                  );
              }
            }
            return LessonViewShimmer();
          }),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        formattedDatenextAppointment = DateFormat('dd/MM/yyyy').format(selectedDate);
        _bloc = AppointmentTimeZoneBloc(formattedDatenextAppointment);

        // widget.date = selectedDate;
        print("selcted->>>>>>>${formattedDatenextAppointment}");
      });
  }
}

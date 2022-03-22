import 'package:ayur360_app/Doctor/bloc/prescriptionBloc.dart';
import 'package:ayur360_app/Doctor/bottomsheet.dart';
import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:ayur360_app/Updater/network/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shimmer.dart';
import '../bloc/doctorEventBloc.dart';
import '../models/doctorEventModel.dart';

class DoctorEvent extends StatefulWidget {
  const DoctorEvent({Key? key}) : super(key: key);

  @override
  _DoctorEventState createState() => _DoctorEventState();
}

class _DoctorEventState extends State<DoctorEvent> {
  int day = 0;

  late DoctorEventListBloc _bloc;
  late List<doctorEventmodel> doctoreventList;

  void initState() {
    super.initState();
    _bloc = DoctorEventListBloc();
    setState(() {});
  }
  void showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return BottomsheetEvent();
        });
  }
  @override
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: doctoreventList.length,
        itemBuilder: (context, index) {
          //  print("data->>>>>>${data[index].detailsdtos}");
          return _tile(
              data[index].doctorName,
              data[index].eventsName,
              data[index].eventsDate,
              data[index].fullDay,
              data[index].timeDurationFrom,
              data[index].timeDurationTo);
        });
  }

  _tile(String doctorName,
      String eventsName,
      String eventsDate,
      String fullDay,
      String timeDurationFrom,
      String timeDurationTo,) =>
      Card(
        margin: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 2),
        elevation: 2,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        shadowColor: Colors.grey,
        child: ListTile(
          // leading: Container(height: 60,width: 60,
          //     child: Image.asset("assets/images/prescription1.png",)),
            title: Text(doctorName,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.red[900])),
            subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(
                  "Reason        : ",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  " ${eventsName}",
                  style: TextStyle(color: Colors.grey[600], fontSize: 20),
                ),
              ]),
              Row(children: [
                Text(
                  "Leave Date : ",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  "${eventsDate}",
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ]),
              Row(children: [
                Text(
                  "Leave Type : ",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  "${fullDay == "1" ? "Full Day" : "Half Day"}",
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ]),
              Row(
                children: [
                  Text(
                    "Leave From : ",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    "${timeDurationFrom}",
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Leave To : ",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    "${timeDurationFrom}",
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                ],
              ),
            ]),
            onTap: () {
              // WidgetsBinding.instance!.addPostFrameCallback((_) {
              //   Navigator.pushNamed(
              //       context, RoutesName.PRESCRIPTION_LISt, arguments: DetailsDto);
              // });
            }),
      );

  Widget build(BuildContext context) {
    bool isChecked = false;



    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
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
                      RoutesName.DASHBOARD_PAGE,
                    );
                  })),
          iconTheme: const IconThemeData(color: Colors.black),
          title: Row(
            children: [
              Container(
                width: width * 0.64,
                height: 30,
                margin: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                child: Center(
                    child: Text(
                      "LEAVE REPORT",
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                width: 0,
              ),
            ],
          ),
          actions: <Widget>[
            Container(color: Colors.white,
              child: GestureDetector(

                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.add_outlined,
                    size: 35,
                  ),
                ),
                onTap: () {
                  showBottomSheet(context);
                },

              ),
            )
          ]),
      body: StreamBuilder<Response<List<doctorEventmodel>>>(
          stream: _bloc.doctorEventListDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("snapshot.data!.data--->${snapshot.data!.data}");
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return LessonViewShimmer(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                  break;
                case Status.SUCCESS:
                  doctoreventList = snapshot.data!.data;
                  return SingleChildScrollView(
                      child: Container(
                          color: Colors.white,
                          //height: height,
                          child: _jobsListView(doctoreventList)));
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
}

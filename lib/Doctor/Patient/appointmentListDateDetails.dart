import 'package:ayur360_app/Doctor/bloc/appointemntDateDetailsBloc.dart';
import 'package:ayur360_app/Doctor/bloc/appointemtEditDetailsBloc.dart';
import 'package:ayur360_app/Doctor/models/appointemntEditDateDetailsModel.dart';
import 'package:ayur360_app/Doctor/models/appointmentEditDetailsModel.dart';
import 'package:ayur360_app/shimmer1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Updater/network/response.dart';
import '../../shimmer.dart';
String AppointemntDate = "";
String AppointementTime = "";

class AppointemntlistDateEdit extends StatefulWidget {
  const AppointemntlistDateEdit(
      {Key? key, required this.appointemtdateDetaisID})
      : super(key: key);
  final appointemtdateDetaisID;

  @override
  _AppointemntlistDateEditState createState() =>
      _AppointemntlistDateEditState();
}

class _AppointemntlistDateEditState extends State<AppointemntlistDateEdit> {
  @override
  late AppointmentDateEditDetailsBloc _bloc;
  late AppointementdateDetailsModel appointmentdatedetailslist;

  void initState() {
    super.initState();
    _bloc = AppointmentDateEditDetailsBloc(widget.appointemtdateDetaisID);
    setState(() {});
  }

  _jobsListView(data) {
    return Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 70),
                child: Icon(
                  Icons.calendar_today,
                  size: 30,
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 10),
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${AppointemntDate = data.appointmentDate}",
                    style: TextStyle(fontSize: 17),
                  ),

                ),
              ),

            ],
          ),
          Container(
              height: 40,
              width: 275,
              margin: EdgeInsets.only(top: 40, left: 30),
              //color: Colors.grey,
              child: Text(
                "Appointment Time",
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 70),
                child: Icon(
                  Icons.access_time,
                  size: 30,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${ AppointementTime = data.appointmentTime}",
                    style: TextStyle(fontSize: 17),
                  ),

                ),
              ),

            ],
          ),
        ]);

    // Center(child: Text("25Yrs",style: TextStyle(color: Colors.black,fontSize: 25),)),
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return StreamBuilder<Response<AppointementdateDetailsModel>>(
        stream: _bloc.appointmentdateEditDetailsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data!.status) {
              case Status.LOADING:
                return LessonViewShimmer1(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                break;
              case Status.SUCCESS:
                appointmentdatedetailslist = snapshot.data!.data;
                return  Container(
                        color: Colors.white,

                        child: _jobsListView(appointmentdatedetailslist));
                break;
              case Status.ERROR:
                return Container(
                  color: Colors.yellow,
                );
            }
          }
          return LessonViewShimmer1();
        });
  }
}

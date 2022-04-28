import 'package:ayur360_app/Doctor/Patient/appointmentListDateDetails.dart';
import 'package:ayur360_app/Doctor/bloc/appointemtEditDetailsBloc.dart';
import 'package:ayur360_app/Doctor/models/appointmentEditDetailsModel.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:ayur360_app/shimmer1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Updater/network/response.dart';
import '../../shimmer.dart';
import '../repositories/patientappointmenteditSaveRepositories.dart';
import 'appointmentsavelistScreen.dart';

class AppointemntlistEdit extends StatefulWidget {
  const AppointemntlistEdit(
      {Key? key, required this.dateId, this.appointemtDetaisID})
      : super(key: key);
  final appointemtDetaisID;
  final dateId;

  @override
  _AppointemntlistEditState createState() => _AppointemntlistEditState();
}

class _AppointemntlistEditState extends State<AppointemntlistEdit> {
  @override
  late AppointmentEditDetailsBloc _bloc;
  late AppointmentDetailsModel appointmentdetailslist;

  void initState() {
    super.initState();
    print("id->>>>>>..${widget.appointemtDetaisID}");
    _bloc = AppointmentEditDetailsBloc(widget.dateId);
    setState(() {});
  }

  AppointmentEditSaveRepository EditSaveApi = AppointmentEditSaveRepository();

  _jobsListView(data) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 0, top: 40),
          height: 100,
          width: 125,
          // color: Colors.red,
          child: Image.asset("${data.imagePath}"),
        ),
        Container(
          height: 40,
          width: 275,
          margin: EdgeInsets.only(top: 20, left: 0),
          // color: Colors.grey,
          child: Center(
              child: Text(
            "${data.fullName}",
            style: TextStyle(color: Colors.black, fontSize: 25),
          )),
        ),
        Center(
            child: Text(
          "${data.patientRegId}",
          style: TextStyle(color: Colors.red[900], fontSize: 20),
        )),
        Center(
            child: data.gender == "F"
                ? Text(
                    "FEMALE/${data.age}",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                : Text(
                    "MALE/${data.age}",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
        Container(
            height: 40,
            width: 275,
            margin: EdgeInsets.only(top: 70, left: 30),
//color: Colors.grey,
            child: Text(
              "Appointment Date",
              style: TextStyle(color: Colors.black, fontSize: 20),
            )),

       AppointemntlistDateEdit(appointemtdateDetaisID: widget.appointemtDetaisID),
         appointmentsaveListing(appointiDs: widget.appointemtDetaisID,),

        Row(children: [
          Container(
            height: 50,
            width: 175,
            margin: EdgeInsets.only(top: 170, left: 50),
            color: Colors.green,
            child: Center(
                child: GestureDetector(
              onTap: () {
                EditSaveApi.AppointmentEditSave(widget.appointemtDetaisID,widget.dateId,context).then((value) {
                  value % 1 == 0 ? Navigator.pushNamed(context, RoutesName.APPINTMENT_PAGE):null;
                });
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 50,
            width: 175,
            margin: EdgeInsets.only(top: 170, right: 20),
            color: Colors.red[900],
            child: Center(
                child: FlatButton(
              onPressed: () {
                print("rgh");
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushNamed(
                      context, RoutesName.APPOINTMENT_RECORDSCREEN,arguments: widget.appointemtDetaisID);
                });
              },
              child: Text(
                "Record",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )),
          ),
        ]),

        // Center(child: Text("25Yrs",style: TextStyle(color: Colors.black,fontSize: 25),)),
      ],
    );
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Container(
              width: width * 0.70,
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                  child: Text(
                "APPOINTMENTS EDIT",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              width: 27,
            ),
            // AppointemntlistDateEdit(appointemtdateDetaisID: app)
          ],
        ),
      ),
      body: StreamBuilder<Response<AppointmentDetailsModel>>(
          stream: _bloc.appointmentEditDetailsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return LessonViewShimmer(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                  break;
                case Status.SUCCESS:
                  appointmentdetailslist = snapshot.data!.data;
                  return SingleChildScrollView(
                      child: Container(
                          color: Colors.white,

                          child: _jobsListView(appointmentdetailslist)));
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

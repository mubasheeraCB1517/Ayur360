import 'package:ayur360_app/Doctor/bloc/leaveReportEditBloc.dart';
import 'package:ayur360_app/Doctor/models/leaveReportEditingModel.dart';
import 'package:ayur360_app/Doctor/repositories/LeaveReportCreationRepository.dart';
import 'package:ayur360_app/Doctor/repositories/leaveReportEditingRepositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Route/route.dart';
import '../Updater/network/response.dart';
import '../shimmer.dart';
import 'UserSetting/DoctorEventScreen.dart';
import 'models/labTestModel.dart';

class BottomsheetEventEdit extends StatefulWidget {
  const BottomsheetEventEdit({Key? key, required this.Eventid})
      : super(key: key);
  final Eventid;

  @override
  _BottomsheetEventEditState createState() => _BottomsheetEventEditState();
}

class _BottomsheetEventEditState extends State<BottomsheetEventEdit> {
  late LeaveReportEditBloc _bloc;
  late LeavereportEditModel leavereportedit;

  void initState() {
    super.initState();
    print("eventId=${widget.Eventid}");

    _bloc = LeaveReportEditBloc(widget.Eventid);

    setState(() {});
  }

  @override
  bool valuefirsrt = false;
  bool viewVisible = false;
  bool viewVisible1 = true;
  bool _validatePassword = false;
  LeaveReportRepository leaveReposiroty = LeaveReportRepository();
  LeaveReportEditRepository leaveEditrepository = LeaveReportEditRepository();
  TextEditingController reasonController = TextEditingController();

  TextEditingController leavedateController = TextEditingController();
  TextEditingController durationfromController = TextEditingController();
  TextEditingController durationtoController = TextEditingController();

  // final _formKeys = GlobalKey<FormState>();
  bool _validate = false;

  //GlobalKey<FormState> _formKeys = GlobalKey<FormState>();
  void hideWidget() {
    setState(() {
      viewVisible = !viewVisible;
      print(viewVisible);
    });
  }

  showWidget() {
    setState(() {
      viewVisible = !viewVisible1;
      print(viewVisible);
    });
  }

  _jobsListView(data) {
    // data != null ? reasonController.text = data.eventsName : reasonController.text;
    // data != null ? durationfromController.text = data.timeDurationFrom : durationfromController.text;
    // data != null ? durationtoController.text = data.timeDurationTo : durationtoController.text ;
    // data != null ? leavedateController.text = data.eventsDate : leavedateController.text;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 60,
          width: 500,
          color: Colors.green[900],
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 10),
            child: Row(children: [
              Text(
                "CREATE",
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              SizedBox(
                width: 250,
              ),
            ]),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30, right: 310),
          child: Text(
            "Reason",
            style: TextStyle(fontSize: 22),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 400,
          //height: 60,
          child: new TextFormField(
            controller: reasonController,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              filled: true,
              hintText: "${data.eventsName}",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
        Row(children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              "Leave Date",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 170),
            child: Text(
              "Full Day",
              style: TextStyle(fontSize: 22),
            ),
          ),
        ]),
        SizedBox(
          height: 10,
        ),
        Row(children: [
          Container(
            margin: EdgeInsets.only(left: 30),
            width: 200,
            child: TextFormField(
              controller: leavedateController,
              autofocus: false,
              style: TextStyle(fontSize: 17.0, color: Colors.black),
              decoration: InputDecoration(
                hintText: "${data.eventsDate}",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              ),

              // onSaved: (value) => leavedateController.text = value!,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(left: 70),
            child: Transform.scale(
              scale: 2.0,
              child: Checkbox(
                checkColor: Colors.greenAccent,
                //activeColor: Colors.red,
                value: this.valuefirsrt,
                onChanged: (bool? value) {
                  setState(() {
                    viewVisible = true;
                    this.valuefirsrt = value!;
                  });
                },
              ),
            ),
          )
        ]),
        viewVisible == false
            ? Column(children: [
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 30),
                    child: Text(
                      "Duration From",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 100),
                    child: Text(
                      "Duration To",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    width: 180,
                    child: TextField(
                      controller: durationfromController,
                      autofocus: false,
                      style: TextStyle(fontSize: 17.0, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "${data.timeDurationFrom}",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    width: 180,
                    child: TextField(
                      controller: durationtoController,
                      autofocus: false,
                      style: TextStyle(fontSize: 17.0, color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "${data.timeDurationTo}",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                      ),
                    ),
                  ),
                ]),
              ])
            : SizedBox(
                height: 0,
              ),
        SizedBox(
          height: 100,
        ),
        Row(
          children: [
            Container(
              height: 35,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[900],
              ),
              margin: EdgeInsets.only(left: 70),
              child: Center(
                  child: FlatButton(
                      onPressed: () {
                        leaveReposiroty.getLeaveeport(
                            reasonController.text,
                            leavedateController.text,
                            durationfromController.text,
                            durationtoController.text,
                            context,
                            widget.Eventid);
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushNamed(context, RoutesName.DOCTOR_EVENT);
                });
              },
              child: Container(
                height: 35,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[900],
                ),
                margin: EdgeInsets.only(left: 20),
                child: Center(
                    child: Text(
                  "Close",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return StreamBuilder<Response<LeavereportEditModel>>(
          stream: _bloc.leaveReportEditDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("snapshot.data!.data--->${snapshot.data!.data}");
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return LessonViewShimmer(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                  break;
                case Status.SUCCESS:
                  leavereportedit = snapshot.data!.data;
                  return SingleChildScrollView(
                      child: Container(
                          color: Colors.white,
                          height: 600,
                          margin: EdgeInsets.only(top: 290),
                          child: _jobsListView(leavereportedit)));
                  break;
                case Status.ERROR:
                  return Container(
                    color: Colors.yellow,
                  );
              }
            }
            return LessonViewShimmer();
          });
    });
  }
}

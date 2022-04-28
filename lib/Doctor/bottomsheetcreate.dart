import 'package:ayur360_app/Doctor/repositories/LeaveReportCreationRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Route/route.dart';

class BottomsheetEvent extends StatefulWidget {
  const BottomsheetEvent({Key? key}) : super(key: key);

  @override
  _BottomsheetEventState createState() => _BottomsheetEventState();
}

class _BottomsheetEventState extends State<BottomsheetEvent> {
  @override
  int EventListid = 0;
  bool valuefirsrt = false;
  bool viewVisible = false;
  bool viewVisible1 = true;
  bool _validatePassword = false;
  LeaveReportRepository leaveReposiroty = LeaveReportRepository();
  TextEditingController reasonController = TextEditingController();
  TextEditingController leavedateController = TextEditingController();
  TextEditingController durationfromController = TextEditingController();
  TextEditingController durationtoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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

  showAlertDialog(
    BuildContext context,
  ) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("ok"),
      onPressed: () {
        leaveReposiroty.getLeaveeport(
            reasonController.text,
            leavedateController.text,
            durationfromController.text,
            durationtoController.text,
            context,
            EventListid);
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          Navigator.pushNamed(context, RoutesName.DOCTOR_EVENT);
        });
      },
    );
    Widget noButton = TextButton(
      child: Text("cancel"),
      onPressed: () {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          Navigator.pushNamed(context, RoutesName.DOCTOR_EVENT);
        });

        print("sdfgh");
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure to take leave"),
      actions: [okButton, noButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return alert;
      },
    );
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return SingleChildScrollView(
          child: Container(
        height: 600,
        color: Colors.white,
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 60,
                  width: width,
                  color: Colors.green[900],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 10),
                    child: Row(children: [
                      Text(
                        "CREATE LEAVE",
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
                  width: width * 0.84,
                  //height: 60,
                  child: new TextFormField(
                    controller: reasonController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      filled: true,
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
                    width: width * 0.50,
                    child: TextFormField(
                      controller: leavedateController,
                      autofocus: false,

                      style: TextStyle(fontSize: 17.0, color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
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
                            width: width * 0.40,
                            child: TextField(
                              controller: durationfromController,
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.black),
                              decoration: InputDecoration(
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
                            width: width * 0.40,
                            child: TextField(
                              controller: durationtoController,
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.black),
                              decoration: InputDecoration(
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
                                showAlertDialog(context);
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
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
            ),
          ),
        ),
      ));
    });
  }
}

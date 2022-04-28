import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../../Route/route.dart';

var ClinicalNotesArray = [];

class AppointemntclinicalnotesScreen extends StatefulWidget {
  const AppointemntclinicalnotesScreen({Key? key, this.ClinicalApoointmentId}) : super(key: key);
final ClinicalApoointmentId;
  @override
  _AppointemntclinicalnotesScreenState createState() =>
      _AppointemntclinicalnotesScreenState();
}

class _AppointemntclinicalnotesScreenState
    extends State<AppointemntclinicalnotesScreen> {
  @override
  TextEditingController HistoryController = TextEditingController();
  TextEditingController DiagnosisController = TextEditingController();
  TextEditingController NotesController = TextEditingController();

  void initState() {
    super.initState();
    HistoryController.text = "";
    DiagnosisController.text = "";
    NotesController.text = "";

    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushNamed(
                    context,
                    RoutesName.APPOINTMENT_RECORDSCREEN,
                  );
                })),
        title: Row(
          children: [
            Container(
              width: 320,
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                  child: Text(
                "Clinical Notes",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              width: 27,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60, right: 30, left: 30),
            height: 178,
            child: Card(
              elevation: 5.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(children: [
                      Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(top: 0, left: 20),
                        child: Image.asset(
                            "assets/images/icons8-time-machine-100.png"),
                      ),
                      Container(
                        height: 50,
                        width: 120,
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          "History",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    Container(
                      height: 80,
                      width: 300,
                      margin: EdgeInsets.only(left: 60, bottom: 10),
                      child: TextFormField(
                        controller: HistoryController,
                        style: TextStyle(
                            fontSize: 16.0, height: 2.0, color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60, right: 30, left: 30),
            height: 178,
            child: Card(
              elevation: 5.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(children: [
                      Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(top: 0, left: 20),
                        child: Image.asset(
                            "assets/images/icons8-doctor-male-skin-type-1-100.png"),
                      ),
                      Container(
                        height: 50,
                        width: 120,
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          "Diagnosis",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    Container(
                      height: 80,
                      width: 300,
                      margin: EdgeInsets.only(left: 60, bottom: 10),
                      child: TextFormField(
                        controller: DiagnosisController,
                        style: TextStyle(
                            fontSize: 16.0, height: 2.0, color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60, right: 30, left: 30),
            height: 178,
            child: Card(
              elevation: 5.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(children: [
                      Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(top: 0, left: 20),
                        child:
                            Image.asset("assets/images/icons8-notes-100.png"),
                      ),
                      Container(
                        height: 50,
                        width: 120,
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          "Notes",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    Container(
                      height: 80,
                      width: 300,
                      margin: EdgeInsets.only(left: 60, bottom: 10),
                      child: TextFormField(
                        controller: NotesController,
                        style: TextStyle(
                            fontSize: 16.0, height: 2.0, color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                ClinicalNotesArray =
                  [{
                     "clinicalNotesId": 0,
                     "clinicalType": null,
                     "complaints": HistoryController.text,
                     "clinicalNotes": NotesController.text,
                     "diagnosis": DiagnosisController.text,
                     "clinicalImagesList": null,
                     "appointmentId":widget.ClinicalApoointmentId,
                     "clinicId":ClinicId,
                  }];
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushNamed(
                      context,
                      RoutesName.APPOINTMENT_RECORDSCREEN
                  );
                });
                print("ClinicalNotesArray->>>>>>>.${ClinicalNotesArray}");
              });
            },
            child: Container(
              height: 40,
              width: 200,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red[900],
              ),
              child: Center(
                  child: Text(
                "Done",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          )
        ],
      )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClinicalTestListScreen extends StatefulWidget {
  const ClinicalTestListScreen({Key? key, title, required this.detailsDTO})
      : super(key: key);
  final List detailsDTO;

  @override
  _ClinicalTestListScreenState createState() => _ClinicalTestListScreenState();
}

class _ClinicalTestListScreenState extends State<ClinicalTestListScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.green[900],
            iconTheme: const IconThemeData(color: Colors.black),
            title: Row(
              children: [
                Container(
                  width: width * 0.64,
                  height: 30,
                  margin: const EdgeInsets.only(left: 4.1),
                  child: Center(
                      child: Text(
                    "List Of Clinical Test ",
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
            actions: <Widget>[Image.asset("assets/images/ayurlogo.png")],
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: Colors.black,
              indicator: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              tabs: [
                Tab(
                    child: Row(children: [
                  Text(
                    "Complaints",
                    style: TextStyle(fontSize: 17),
                  ),
                ])),
                // SizedBox(width: 10,),
                Tab(
                    child: Row(children: [
                  Center(
                    child: Text(
                      "Diagnois",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ])),
                Tab(
                    child: Text(
                  "Notes",
                  style: TextStyle(fontSize: 18),
                )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Complaintclinical(
                complaints: widget.detailsDTO[0][0].complaints,
              ),
              clinicalDiagnois(diagnosis: widget.detailsDTO[0][0].diagnosis),
              clinicalnote(
                note: widget.detailsDTO[0][0].clinicalNotes,
              )
            ],
          )
          // height: height,

          ),
    );
  }
}

class Complaintclinical extends StatefulWidget {
  const Complaintclinical({Key? key, this.complaints}) : super(key: key);
  final String? complaints;

  @override
  _ComplaintclinicalState createState() => _ComplaintclinicalState();
}

class _ComplaintclinicalState extends State<Complaintclinical> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Image.asset("assets/images/complaint.png",),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.complaints ?? "",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class clinicalDiagnois extends StatefulWidget {
  const clinicalDiagnois({Key? key, this.diagnosis}) : super(key: key);
  final String? diagnosis;

  @override
  _clinicalDiagnoisState createState() => _clinicalDiagnoisState();
}

class _clinicalDiagnoisState extends State<clinicalDiagnois> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Image.asset("assets/images/complaint.png",),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.diagnosis ?? "",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class clinicalnote extends StatefulWidget {
  const clinicalnote({Key? key, this.note}) : super(key: key);
  final String? note;

  @override
  _clinicalnoteState createState() => _clinicalnoteState();
}

class _clinicalnoteState extends State<clinicalnote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Image.asset("assets/images/complaint.png",),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.note ?? "",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

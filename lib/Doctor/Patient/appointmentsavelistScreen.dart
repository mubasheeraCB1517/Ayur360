import 'package:ayur360_app/Doctor/bloc/pateintapppointementSaveBloc.dart';
import 'package:ayur360_app/Doctor/models/patientAppointementListModel.dart';
import 'package:ayur360_app/Doctor/models/patientMyAppointmentModel.dart';
import 'package:ayur360_app/shimmer1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Updater/network/response.dart';
import '../../shimmer.dart';
import '../models/myAppointmentsModel.dart';
import 'appointmentPrescriptionScreen.dart';
import 'medicedoseDropDown.dart';

class appointmentsaveListing extends StatefulWidget {
  const appointmentsaveListing({Key? key, this.appointiDs}) : super(key: key);
  final appointiDs;

  @override
  _appointmentsaveListingState createState() => _appointmentsaveListingState();
}

class _appointmentsaveListingState extends State<appointmentsaveListing> {
  @override
  late PatientAppointemntSaveListBloc _bloc;
  late PatientAppointmentList appointmentsavedetailslist;

  void initState() {
    super.initState();
    _bloc = PatientAppointemntSaveListBloc(widget.appointiDs);
    setState(() {});
  }

  _jobsListView(data) {
    //print("object->>>>>${data.clinicalNotesList.last}");
    return Column(children: [
      Center(
        child: data.virtualSignDetails.virtualSignId != null
            ? Container(
                decoration: BoxDecoration(color: Colors.green,
                  border: Border.all(color: Colors.grey),
                ),
                margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Card(
                  elevation: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'VitalSign Chart',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                children: <Widget>[
                                  Text('Weight '),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Center(
                                        child: Text(
                                            data.virtualSignDetails.weight)),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('Pulse '),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Center(
                                        child: Text(
                                            data.virtualSignDetails.pulse)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  Text('Temperature'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Center(
                                        child: Text(data
                                            .virtualSignDetails.temperature)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  Text('Blood Pressure'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Center(
                                        child:
                                            Text(data.virtualSignDetails.bp)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox(
                height: 0,
              ),
      ),

      Center(

        child: data.clinicalNotesList.length != 0 ? data.clinicalNotesList[data.clinicalNotesList.length-1].clinicalNotesId != null
            ? Container(
          decoration: BoxDecoration(color: Colors.green,
            border: Border.all(color: Colors.grey),
          ),
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Card(
            elevation: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Clinical Notes',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          children: <Widget>[
                            Text('complaints '),

                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 56,
                              width: 242,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child:
                              Padding(padding: EdgeInsets.only(left: 20,top: 5),
                                  child: Text(data.clinicalNotesList[data.clinicalNotesList.length-1].complaints)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Text('Diagnosis'),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              height: 40,
                              width: 242,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),

                                  child:
                                      Padding(padding: EdgeInsets.only(left: 20,top: 5),
                                      child: Text(data.clinicalNotesList[data.clinicalNotesList.length-1].diagnosis)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Text('Notes'),
                            SizedBox(
                              width: 55,
                            ),
                            Container(
                              height: 40,
                              width: 240,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child:
                                     Padding(padding: EdgeInsets.only(left: 20,top: 5),child: Text(data.clinicalNotesList[data.clinicalNotesList.length-1].clinicalNotes)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ):SizedBox(height: 0,):SizedBox(height: 0,),
      ),
      SizedBox(height: 20,),

      ListView.builder(
          itemCount: data.labList.length == null
              ? 0
              : data.labList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Container(
                  height: 80,
                  child: data.labList[index].labId!= null ?Card(
                    color: Colors.green,
                    margin:
                    EdgeInsets.only(left: 40, right: 30),
                    child: ListTile(
leading: Text("Lab test"),
                      title: Container(
                          height: 40,
                          width: 180,
                          color: Colors.white,
                          margin: EdgeInsets.only(
                              left: 0, top: 20),
                          child: Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Text(
                                data.labList[index].labTest ?? data.labList[index].otherTest),
                          )),
                    ),
                  ):SizedBox(height: 0,),
                ),
                Divider()


              ],
            );
          }),

      ListView.builder(
          itemCount: data.prescriptionList.length == null
              ? 0
              : data.prescriptionList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {

            return Column(
              children: <Widget>[
                Container(
                  height: 420,
                  child:data.prescriptionList[index].prescriptionId!=null? Card(
                    elevation: 10,
                    //   color: Colors.red,
                    margin:
                    EdgeInsets.only(left: 10, right: 10),
                    child: ListTile(
                        trailing: GestureDetector(
                          onTap: () {
                            setState(() {
                              data.prescriptionList.removeAt(index);
                            });
                          },
                          child: Container(
                              margin:
                              EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.blue,
                              )),
                        ),
                        title: Column(children: [
                          Container(
                              height: 55,
                              width: 370,
                              color: Colors.white,
                              margin: EdgeInsets.only(top: 0),
                              child: Padding(
                                padding:
                                const EdgeInsets.all(1.0),
                                child: Text(data.prescriptionList[index].drugName,

                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red[900],
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                              )),
                          Divider(),
                          Row(children: [
                            Container(
                                margin:
                                EdgeInsets.only(left: 10),
                                child: Text(
                                  "Dose",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )),
                            SizedBox(
                              width: 90,
                            ),
                            Container(
                                margin:
                                EdgeInsets.only(left: 50),
                                child: Text(
                                  "Duration",
                                  style:
                                  TextStyle(fontSize: 20),
                                )),
                          ]),
                          Row(children: [
                            Container(
                                margin:
                                EdgeInsets.only(left: 10),
                                child:
                                MedicineDoseDropDown()),
                            SizedBox(
                              width: 45,
                            ),
                            Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.green),
                              ),
                              child: TextField(decoration: new InputDecoration
                                  .collapsed(
                                  hintText:
                                  data.prescriptionList[index].duration),
                               // controller: DurationPrescriptionController[index],
                              ),
                            )
                          ]),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 20),
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(),
                                  )),
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 30, top: 20),
                                  child: Text(
                                    "Use",
                                    style: TextStyle(),
                                  )),
                            ],
                          ),
                          Row(children: [
                            Container(
                              height: 40,
                              width: 140,
                              margin:
                              EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.green),
                              ),
                              child: TextField( decoration:
                              new InputDecoration
                                  .collapsed(
                                  hintText:
                                  data.prescriptionList[index].purchaseQuantity),
                               // controller: QuatityprescriptionController[index],
                              ),
                            ),
                            SizedBox(
                              width: 47,
                            ),
                            Dropdowm()
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Text(
                                    "Morning",
                                    style: TextStyle(),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(5),
                                      border: Border.all(
                                          color:
                                          Colors.green),
                                    ),
                                    child: TextField(
                                      //controller: MorningCountController,
                                      decoration:
                                      new InputDecoration
                                          .collapsed(
                                          hintText:
                                          data.prescriptionList[index].morningCount.toString()),
                                    ),
                                  )
                                ]),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Column(children: [
                                Text(
                                  "Noon",
                                  style: TextStyle(),
                                ),
                                Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(
                                        5),
                                    border: Border.all(
                                        color: Colors.green),
                                  ),
                                  child: TextField(
                                  //  controller: NoonCountController[index],
                                    decoration:
                                    new InputDecoration
                                        .collapsed(
                                        hintText:
                                        data.prescriptionList[index].noonCount.toString()),
                                  ),
                                )
                              ]),
                              SizedBox(
                                width: 80,
                              ),
                              Column(children: [
                                Text(
                                  "Night",
                                  style: TextStyle(
                                      color:
                                      Colors.green[400]),
                                ),
                                Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(
                                        5),
                                    border: Border.all(
                                        color: Colors.green),
                                  ),
                                  child: TextField(

                                    decoration:
                                    new InputDecoration
                                        .collapsed(
                                        hintText:data.prescriptionList[index].nightCount.toString()),
                                  ),
                                )
                              ]),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              height: 20,
                              width: 90,
                              margin:
                              EdgeInsets.only(right: 250),
                              child: Text(
                                "ADVICE",
                                style: TextStyle(
                                    color: Colors.green[400]),
                              )),
                          Container(
                            height: 50,
                            width: 340,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.green),
                            ),
                            child: TextField(  decoration: new InputDecoration.collapsed(
                                hintText:data.prescriptionList[index].doctorSuggestion
                            ),
                            ),
                          )
                        ])),
                  ):SizedBox(height: 0,),
                ),
                Divider()
              ],
            );
          }),

      Center(
        child:data.recommendId!= null ? Container(
          height: 80,
          child: Card(
            color: Colors.green,
            margin:
            EdgeInsets.only(left: 40, right: 30),
            child: ListTile(
              leading: Text("Recommend"),
              title: Container(
                  height: 40,
                  width: 180,
                  color: Colors.white,
                  margin: EdgeInsets.only(
                      left: 0, top: 20),
                  child: Padding(
                    padding:
                    const EdgeInsets.all(8.0),
                    child: Text(
                        data.recommends),
                  )),
            ),
          ),
        ):SizedBox(height: 0,),
      ),
    ]);

    // Center(child: Text("25Yrs",style: TextStyle(color: Colors.black,fontSize: 25),)),
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return StreamBuilder<Response<PatientAppointmentList>>(
        stream: _bloc.patientAppointmentSaveDataStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data!.status) {
              case Status.LOADING:
                return LessonViewShimmer1(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                break;
              case Status.SUCCESS:
                appointmentsavedetailslist = snapshot.data!.data;
                return SingleChildScrollView(
                    child: Container(
                        color: Colors.white,
                        child: _jobsListView(appointmentsavedetailslist,)
                    )
                );
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

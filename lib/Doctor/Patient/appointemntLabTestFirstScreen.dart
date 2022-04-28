import 'package:ayur360_app/Constants.dart';
import 'package:ayur360_app/Doctor/bloc/appointmentLabTestBloc.dart';
import 'package:ayur360_app/Doctor/models/appointmentLabTestModel.dart';
import 'package:ayur360_app/Updater/network/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Route/route.dart';
import '../../shimmer.dart';
import '../models/myAppointmentsModel.dart';

String MySelection = "";
int labTestId = 0;

var LabListArray = [];
class AppointmentLabtestScreen extends StatefulWidget {
  const AppointmentLabtestScreen({
    Key? key, this.LabtestAppointemntid,
  }) : super(key: key);
  final LabtestAppointemntid ;

  @override
  _AppointmentLabtestScreenState createState() =>
      _AppointmentLabtestScreenState();
}

class _AppointmentLabtestScreenState extends State<AppointmentLabtestScreen> {
  String dropdownvalue = 'Item 1';
  String otherTest = "";

  @override
  late AppointmentLabTestDetailsBloc _bloc;
  late List<AppointemntLabTestModel> appointmentlablist;
  List<AppointemntLabTestModel> labTestList = [];

  void initState() {
    super.initState();
    _bloc = AppointmentLabTestDetailsBloc();
    setState(() {});
  }

  int id = 0;

  TextEditingController LabTestController = TextEditingController();
  TextEditingController OtherLabTestController = TextEditingController();

  showAlertDialog(
    BuildContext context,
  ) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("ok"),
      onPressed: () {
        otherTest = OtherLabTestController.text;
        AppointemntLabTestModel labtest = AppointemntLabTestModel(
          clinicId: ClinicId,
          labTest: otherTest,
          labTestId: 0,
        );
        setState(() {
          labTestList.add(labtest);
          Navigator.pop(context);
          OtherLabTestController.clear();
        });
      },
    );
    Widget noButton = TextButton(
      child: Text("cancel"),
      onPressed: () {
        Navigator.pop(context);

        print("sdfgh");
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: TextFormField(
        controller: OtherLabTestController,
        decoration: InputDecoration(
          hintText: "Type...",
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Container(
              width: width * 0.64,
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                  child: Text(
                "Lab Tests",
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
      body: StreamBuilder<Response<List<AppointemntLabTestModel>>>(
          stream: _bloc.appointmentlabtestDetailsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return LessonViewShimmer(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                  break;
                case Status.SUCCESS:
                  appointmentlablist = snapshot.data!.data;
                  if (MySelection == "") {
                    Text(
                      "${MySelection = "Select Lab Test"}",
                      style: TextStyle(color: Colors.black),
                    );
                    print("MySElecgt->>>>>>>>>${MySelection}");
                  } else {
                    MySelection = MySelection;
                  }
                  return SingleChildScrollView(
                    child: StatefulBuilder(builder: (context, setState) {
                      return Column(children: [
                        GestureDetector(
                          onTap: () {
                            showAlertDialog(context);
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            margin: EdgeInsets.only(left: 305, top: 10),
                            child: Center(child: Text("Other Test")),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green[500],
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          margin: EdgeInsets.only(top: 30, left: 10),
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: Colors.red,
                                style: BorderStyle.solid,
                                width: 2.00),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: Colors.grey,
                              hint: Text("   Select Lab Test"),
                              // value: MySelection,

                              items: appointmentlablist.map((items) {
                                return DropdownMenuItem(
                                    onTap: () {
                                      setState(() {
                                        id = items.labTestId!;
                                        labTestList.add(items);

                                        labTestId = id;

                                        print("idlab->>>>>>${labTestId}");
                                      });
                                    },
                                    value: items.labTest,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          items.labTest!,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ));
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  // LabTestController.text = MySelection;

                                  print("MySelection->>>>>>${ MySelection}");
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ListView.builder(
                            itemCount: labTestList.length == null
                                ? 0
                                : labTestList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  Container(
                                    height: 80,
                                    child: Card(
                                      color: Colors.green[100],
                                      margin:
                                          EdgeInsets.only(left: 40, right: 30),
                                      child: ListTile(
                                        trailing: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              labTestList.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Icon(
                                                Icons.delete,
                                                size: 30,
                                                color: Colors.blue,
                                              )),
                                        ),
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
                                                  labTestList[index].labTest!),
                                            )),
                                      ),
                                    ),
                                  ),
                                  Divider()


                                ],
                              );
                            }),
                        GestureDetector(onTap: (){

                          LabListArray = [];
                        for (var i = 0; i<labTestList.length; i++)  {

                          var Lablistarry = {
                            "appointmentId":widget.LabtestAppointemntid,
                            "clinicId":ClinicId,
                            "labId": 0,
                            "labTest": labTestList[i].labTest == otherTest?"":labTestList[i].labTest,
                            "labTestId": labTestList[i].labTestId,
                            "otherTest": labTestList[i].labTest == otherTest?otherTest:""

                          };
                          LabListArray.add(Lablistarry);

                        }

                          print("array->>>>>>>>>.${LabListArray}");
                          setState((){
                            WidgetsBinding.instance!.addPostFrameCallback((_) {
                              Navigator.pushNamed(
                                  context,
                                  RoutesName.APPOINTMENT_RECORDSCREEN
                              );
                            });
                          });
                        },
                          child: Container(
                            height: 40,
                            width: 200,
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
                        ),
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
      //
    );
  }
}

import 'package:ayur360_app/Doctor/bloc/appointementPrescriptionBloc.dart';
import 'package:ayur360_app/Doctor/models/appointementPrescriptionModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../../Route/route.dart';
import '../../Updater/network/response.dart';
import '../../shimmer.dart';
import 'medicedoseDropDown.dart';
List PrescriptionArray =[];
class AppointmentPrescriptionscreen extends StatefulWidget {
  const AppointmentPrescriptionscreen({Key? key}) : super(key: key);

  @override
  _AppointmentPrescriptionscreenState createState() =>
      _AppointmentPrescriptionscreenState();
}

class _AppointmentPrescriptionscreenState
    extends State<AppointmentPrescriptionscreen> {
  @override
 List <TextEditingController> DurationPrescriptionController = [];
 List <TextEditingController> QuatityprescriptionController = [];
 List <TextEditingController> MorningCountController = [];
 List <TextEditingController> NoonCountController = [];
 List <TextEditingController> NightCountController = [];
  List <TextEditingController> AdviceCotroller = [];
  String PrescriptiponOtherMedicines = '';
  late AppointementPrescriptionBloc _bloc;
  late List<AppointmentPrescriptionModel> prescriptionmedicinelist;
  List<AppointmentPrescriptionModel> medicinelist = [];



  void initState() {
    super.initState();
    _bloc = AppointementPrescriptionBloc();
    setState(() {});
  }

  int id = 0;
  String MySelection = "";
  int prescriptionid = 0;

  TextEditingController prescriptionmedicineController =
      TextEditingController();
  TextEditingController OtherMedicineController = TextEditingController();

  showAlertDialog(
    BuildContext context,
  ) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("ok"),
      onPressed: () {PrescriptiponOtherMedicines = OtherMedicineController.text;
        AppointmentPrescriptionModel prescription =
            AppointmentPrescriptionModel(
          categoryName: "",
          drugsId: 0,
          drugsName: PrescriptiponOtherMedicines,
          drugsQuantity: 0,
          drugsRate: "",
          model: "",
          weight: 0,
          weightClassId: 0,
        );
        setState(() {
          medicinelist.add(prescription);
          Navigator.pop(context);
          OtherMedicineController.clear();
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
        controller: OtherMedicineController,
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
                "Prescriptions",
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
      body: StreamBuilder<Response<List<AppointmentPrescriptionModel>>>(
          stream: _bloc.appointmentprescriptionDetailsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                  break;
                case Status.SUCCESS:
                  prescriptionmedicinelist = snapshot.data!.data;
                  if (MySelection == "") {
                    Text(
                      "${MySelection = "Select Medicines"}",
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
                            width: 120,
                            margin: EdgeInsets.only(left: 305, top: 10),
                            child: Center(child: Text("Other Medicines")),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green[500],
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          margin: EdgeInsets.only(
                            top: 30,
                            left: 10,
                          ),
                          width: 430,
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
                              hint: Text("   Select Medicines"),
                              // value: MySelection,

                              items: prescriptionmedicinelist.map((items) {
                                return DropdownMenuItem(
                                    onTap: () {
                                      setState(() {
                                        id = items.drugsId!;
                                        medicinelist.add(items);

                                        prescriptionid = id;

                                        print("id->>>>>>${id}");
                                      });
                                    },
                                    value: items.drugsName,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          " ${items.drugsName!}(${items.categoryName})",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ));
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  // LabTestController.text = MySelection;

                                  print("MySelection->>>>>>${MySelection}");
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ListView.builder(
                            itemCount: medicinelist.length == null
                                ? 0
                                : medicinelist.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              DurationPrescriptionController.add(new TextEditingController());
                              QuatityprescriptionController.add(new TextEditingController());
                              MorningCountController.add(new TextEditingController());
                              NoonCountController.add(new TextEditingController());
                              NightCountController.add(new TextEditingController());
                              AdviceCotroller.add(new TextEditingController());
                              return Column(
                                children: <Widget>[
                                  Container(
                                    height: 420,
                                    child: Card(
                                      elevation: 10,
                                      //   color: Colors.red,
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: ListTile(
                                          trailing: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                medicinelist.removeAt(index);
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
                                                  child: Text(
                                                    "  ${medicinelist[index].drugsName!}(${medicinelist[index].categoryName}),",
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
                                                child: TextField(
                                                 controller: DurationPrescriptionController[index],
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
                                                child: TextField(
                                                  controller: QuatityprescriptionController[index],
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
                                                                    '    0'),
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
                                                      controller: NoonCountController[index],
                                                      decoration:
                                                          new InputDecoration
                                                                  .collapsed(
                                                              hintText:
                                                                  '    0'),
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
                                                      controller: NightCountController[index],
                                                      decoration:
                                                          new InputDecoration
                                                                  .collapsed(
                                                              hintText: '     '
                                                                  '0'),
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
                                              child: TextFormField(
                                               controller: AdviceCotroller[index],
                                              ),
                                            )
                                          ])),
                                    ),
                                  ),
                                  Divider()
                                ],
                              );
                            }),

                        GestureDetector(onTap: (){
                          PrescriptionArray = [];
                          for (var i = 0; i<medicinelist.length; i++)  {

                            var prescrArray = {
                              "prescriptionId": 0,
                                "drugId": id,
                                "drugName": medicinelist[i].drugsName==PrescriptiponOtherMedicines?"":medicinelist[i].drugsName,
                                "drugStrength": MySelectiondose,
                                "duration": DurationPrescriptionController[i].text,
                                "durationType": "days",
                                "morningCount": MorningCountController[i].text,
                                "noonCount": NoonCountController[i].text,
                                "nightCount": NightCountController[i].text,
                                "foodStatus": dropdownvalue,
                                "notes": AdviceCotroller[i].text,
                                "doctorSuggestion": "",
                                "purchaseQuantity": QuatityprescriptionController[i].text,
                                "otherMedicines":medicinelist[i].drugsName==PrescriptiponOtherMedicines?PrescriptiponOtherMedicines:""

                            };
                            PrescriptionArray.add(prescrArray);

                          }

                          print("array->>>>>>>>>.${PrescriptionArray}");
                          setState((

                          ){
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
            return Container();
          }),
    );
  }
}
String dropdownvalue = 'After food';
class Dropdowm extends StatefulWidget {
  const Dropdowm({Key? key}) : super(key: key);

  @override
  _DropdowmState createState() => _DropdowmState();
}

class _DropdowmState extends State<Dropdowm> {
// Initial Selected Value


// List of items in our dropdown menu
  var items = [
    'After food',
    'Before Food',
    'External',
    'None',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(items),
                  ),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  print("Dropdownvalue ->>>>>>${dropdownvalue}");
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

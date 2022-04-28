import 'package:ayur360_app/Doctor/bloc/appointemntDateDetailsBloc.dart';
import 'package:ayur360_app/Doctor/bloc/appointemtEditDetailsBloc.dart';
import 'package:ayur360_app/Doctor/bloc/appointmentmeasuremntBloc.dart';
import 'package:ayur360_app/Doctor/models/appointemntEditDateDetailsModel.dart';
import 'package:ayur360_app/Doctor/models/appointmentEditDetailsModel.dart';
import 'package:ayur360_app/Doctor/models/appointmentmeasurmentofmedicieModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Updater/network/response.dart';
import '../../shimmer.dart';
String MySelectiondose = "";
class MedicineDoseDropDown extends StatefulWidget {
  const MedicineDoseDropDown({
    Key? key,
  }) : super(key: key);

  // final appointemtdateDetaisID;

  @override
  _MedicineDoseDropDownState createState() => _MedicineDoseDropDownState();
}

class _MedicineDoseDropDownState extends State<MedicineDoseDropDown> {
  @override
  late AppointmentMeasurmentDetailsBloc _bloc;
  late AppointementmeasurmentModel appointmentdatedetailslist;
  late List<AppointementmeasurmentModel> prescriptionmeasuermentlist;
  List<AppointementmeasurmentModel> medicinemeasurmentlist = [];

  void initState() {
    super.initState();
    _bloc = AppointmentMeasurmentDetailsBloc();
    setState(() {});
  }

  int id = 0;

  int prescriptionid = 0;

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return StreamBuilder<Response<List<AppointementmeasurmentModel>>>(
        stream: _bloc.appointmentmeasurmentDetailsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data!.status) {
              case Status.LOADING:
                return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                break;
              case Status.SUCCESS:
                prescriptionmeasuermentlist = snapshot.data!.data;
                if (MySelectiondose == "") {
                  Text(
                    "${MySelectiondose = prescriptionmeasuermentlist[0].measuringUnits!}",
                    style: TextStyle(color: Colors.black),
                  );
                  print("MySElecgt->>>>>>>>>${MySelectiondose}");
                } else {
                  MySelectiondose = MySelectiondose;
                }
                return SingleChildScrollView(
                  child: StatefulBuilder(builder: (context, setState) {
                    return Column(children: [
                      Container(
                        height: 40,
                        // margin: EdgeInsets.only(top: 30, left: 10),
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: Colors.green,
                              style: BorderStyle.solid,
                              width: 2.00),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            dropdownColor: Colors.grey,
                            hint: Text("Select"),
                            value: MySelectiondose,
                            items: prescriptionmeasuermentlist.map((items) {
                              return DropdownMenuItem(
                                  onTap: () {
                                    setState(() {
                                      id = items.measuringUnitsId!;
                                      medicinemeasurmentlist.add(items);

                                      prescriptionid = id;

                                      print("prescriptionid->>>>>>${prescriptionid}");
                                    });
                                  },
                                  value: items.measuringUnits,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        " ${items.measuringUnits!}",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ],
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                MySelectiondose = newValue as String;
                                print("MySelection->>>>>>${MySelectiondose}");
                              });
                            },
                          ),
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
        });
  }
}

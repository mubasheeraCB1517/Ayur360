import 'package:ayur360_app/Route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var VitalSignArray = {};

class AppointmentVitalsignScreen extends StatefulWidget {
  const AppointmentVitalsignScreen({Key? key, this.appointemnentVitalid}) : super(key: key);
final appointemnentVitalid;
  @override
  _AppointmentVitalsignScreenState createState() =>
      _AppointmentVitalsignScreenState();
}

class _AppointmentVitalsignScreenState
    extends State<AppointmentVitalsignScreen> {
  TextEditingController WeightController = TextEditingController();
  TextEditingController PulseController = TextEditingController();
  TextEditingController TemperatureController = TextEditingController();
  TextEditingController BpController = TextEditingController();

  void initState() {
    super.initState();
    WeightController.text = "";
    PulseController.text = "";
    TemperatureController.text = "";
    BpController.text = "";

    setState(() {});
  }

  @override
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
                "Vital Sign Chart",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
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
            margin: EdgeInsets.only(top: 50, right: 30, left: 30),
            height: 150,
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(children: [
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(top: 0, left: 20),
                      child: Image.asset("assets/images/icons8-bmi-96.png"),
                    ),
                    Container(
                      height: 50,
                      width: 120,
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Body Weight",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ]),
                  Row(children: [
                    Container(
                      height: 40,
                      width: 180,
                      margin: EdgeInsets.only(left: 80, bottom: 10),
                      child: TextFormField(
                        controller: WeightController,
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
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      child: Text(
                        "Kg",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50, right: 30, left: 30),
            height: 150,
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(children: [
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(top: 0, left: 20),
                      child: Image.asset("assets/images/pulse.png"),
                    ),
                    Container(
                      height: 50,
                      width: 120,
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Pulse",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ]),
                  Row(children: [
                    Container(
                      height: 40,
                      width: 180,
                      margin: EdgeInsets.only(left: 80, bottom: 10),
                      child: TextFormField(
                        controller: PulseController,
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
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40,
                      width: 70,
                      child: Text(
                        "Rate",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50, right: 30, left: 30),
            height: 150,
            child: Card(
              elevation: 5,
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
                          "assets/images/icons8-temperature-100.png"),
                    ),
                    Container(
                      height: 50,
                      width: 120,
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Temperature",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ]),
                  Row(children: [
                    Container(
                      height: 40,
                      width: 180,
                      margin: EdgeInsets.only(left: 80, bottom: 10),
                      child: TextFormField(
                        controller: TemperatureController,
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
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40,
                      width: 70,
                      child: Text(
                        "Degree",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50, right: 30, left: 30),
            height: 150,
            child: Card(
              elevation: 5,
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
                          "assets/images/icons8-blood-sample-100.png"),
                    ),
                    Container(
                      height: 50,
                      width: 180,
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Blood Pressure",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ]),
                  Row(children: [
                    Container(
                      height: 40,
                      width: 180,
                      margin: EdgeInsets.only(left: 80, bottom: 10),
                      child: TextFormField(
                        controller: BpController,
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
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40,
                      width: 70,
                      child: Text(
                        "mmHg",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () {

                VitalSignArray = {
                  "appointmentId": widget.appointemnentVitalid,
                  "clinicId": 1,
                  "virtualSignId": 0,
                  "weight": WeightController.text,
                  "pulse": PulseController.text,
                  "temperature": TemperatureController.text,
                  "bp": BpController.text
                };
                print("vitalsignArray->>>>>>>.${VitalSignArray}");
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushNamed(
                      context,
                      RoutesName.APPOINTMENT_RECORDSCREEN
                  );
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
          )
        ],
      )),
    );
  }
}

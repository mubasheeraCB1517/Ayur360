
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TreatmentPlanScreen extends StatefulWidget {
  const TreatmentPlanScreen({Key? key}) : super(key: key);

  @override
  _TreatmentPlanScreenState createState() => _TreatmentPlanScreenState();
}

class _TreatmentPlanScreenState extends State<TreatmentPlanScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.green[900],


          iconTheme: const IconThemeData(color: Colors.black),
          title: Row(
            children: [
              Container(
                width: width*0.64,
                height: 30,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                    child: Text(
                      "Treatment Plan",
                      style: TextStyle(color: Colors.grey[900], fontSize: 25,fontWeight:FontWeight.bold),
                    )),
              ),
              SizedBox(
                width: 27,
              ),

            ],

          ),
          actions: <Widget>[
            Image.asset("assets/images/ayurlogo.png")]),

    );
  }
}

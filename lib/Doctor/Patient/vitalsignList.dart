import 'package:ayur360_app/Doctor/bloc/myAppointemntBloc.dart';
import 'package:ayur360_app/Doctor/bloc/vitalSignBloc.dart';
import 'package:ayur360_app/Doctor/models/myAppointmentsModel.dart';
import 'package:ayur360_app/Doctor/models/vitalSignMode.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/prescriptionBloc.dart';
import '../models/prescriptionModel.dart';

class vitalsignListScreen extends StatefulWidget {
  const vitalsignListScreen({Key? key, title, required this.vitaldetailsDTO})
      : super(key: key);
  final List vitaldetailsDTO;

  @override
  _vitalsignListScreenState createState() => _vitalsignListScreenState();
}

class _vitalsignListScreenState extends State<vitalsignListScreen> {

  @override
  ListView _jobsListView(data) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tileWiidget(data[index]);
        });
  }

  _tileWiidget(title) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),

        itemCount: title.length,
        itemBuilder: (context, index) {
          return _tile(title[index]);
        });
  }
//ClinicalTestListScreen


  _tile(title) {
    return
      Card(
        margin: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 0),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Row(
                children: [

                  Container(height: 45,width: 45,
                    child: Image.asset("assets/images/pulse.png",)),
                  SizedBox(width: 6,),

                  Text(" ${title.weight.toString()}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green[900])),

                ]
            ),

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    "Weight       : ",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    " ${title.pulse.toString()}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  SizedBox(width: 28,),

                  Text("Temperature : ",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  Text(
                    " ${title.temperature.toString()}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  SizedBox(width: 28,),
                  Text("Bp   : ",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  Text(
                    "${title.bp.toString()}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ]),

                SizedBox(height: 10,),
                Row(children: [



                ]),

              ],
            ),
          ),
        ),

      );
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print("dto===>>${widget.vitaldetailsDTO[0]}");
    print("widget->>>>>>${widget.vitaldetailsDTO}");
    double height = MediaQuery.of(context).size.height;
    TextEditingController SearchController = TextEditingController();
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
                  height: 33,
                  margin: const EdgeInsets.only(left: 4.1),
                  child: Center(
                      child: Text(
                        "Vital Sign List",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  width: 27,
                ),
              ],
            ),
            actions: <Widget>[Image.asset("assets/images/ayurlogo.png")]),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                // height: height,
                width: width,
                color: Colors.white,
                child: Stack(
                  children: [

                    _jobsListView(widget.vitaldetailsDTO)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

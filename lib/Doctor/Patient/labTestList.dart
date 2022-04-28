import 'package:ayur360_app/Doctor/bloc/myAppointemntBloc.dart';
import 'package:ayur360_app/Doctor/models/myAppointmentsModel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/prescriptionBloc.dart';
import '../models/prescriptionModel.dart';

class lablistScreen extends StatefulWidget {
  const lablistScreen({Key? key, title, required this.detailsDTO})
      : super(key: key);
  final List detailsDTO;

  @override
  _lablistScreenState createState() => _lablistScreenState();
}

class _lablistScreenState extends State<lablistScreen> {
  late PrescriptionListBloc _bloc;
  late List<prescription> prescriptionList;

  void initState() {
    super.initState();
    _bloc = PrescriptionListBloc();
    // print("detailsdto ====${}");

    setState(() {});
  }

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

  _tile(title) {
    return SizedBox(
      height: 100,
      child: Card(
        margin: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 2),
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Row(children: [
              Container(
                height: 25, width: 25,
                //  child: Image.asset("assets/images/medicine.png",)
              ),
              SizedBox(
                width: 6,
              ),
              Text(" ${title.labTest.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.green[900])),
            ]),
            //
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                  height: 30,
                  margin: const EdgeInsets.only(left: 4.1),
                  child: Center(
                      child: Text(
                    "Lab Test List",
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
            actions: <Widget>[Image.asset("assets/images/ayurlogo.png")]),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: height,
                width: width,
                color: Colors.white,
                child: Stack(
                  children: [
                    // Positioned(
                    //     top: 8,
                    //     left: 10,
                    //     //  bottom: 10,
                    //
                    //     child: Container(
                    //       width: width * 0.96,
                    //       height: 42,
                    //       color: Colors.white,
                    //       child: TextField(controller: SearchController,
                    //
                    //         keyboardType: TextInputType.text,
                    //
                    //         showCursor: true,
                    //
                    //
                    //
                    //         decoration: InputDecoration(
                    //           hintText: 'Search',
                    //
                    //           prefixIcon: Icon(Icons.search),
                    //           contentPadding:
                    //           EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 5.0),
                    //           border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(5.0),
                    //               borderSide: BorderSide(color: Colors.grey)),
                    //         ),
                    //       ),
                    //
                    //
                    //
                    //
                    //     ),
                    //
                    //
                    // ),
                    _jobsListView(widget.detailsDTO)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

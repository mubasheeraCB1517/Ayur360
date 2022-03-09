import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorEvent extends StatefulWidget {
  const DoctorEvent({Key? key}) : super(key: key);

  @override
  _DoctorEventState createState() => _DoctorEventState();
}

class _DoctorEventState extends State<DoctorEvent> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Colors.white,
      //
      //   actions: <Widget>[
      //     Image.asset("assets/images/ayurlogo.png"),
      //   ],
      // ),
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
                  "LEAVE REPORTING",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 24,
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
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              color: Colors.green[50],
              child: Stack(
                children: [
                  Positioned(
                      top: 8,
                      left: 9,
                      //  bottom: 10,
                   child: Container(
                      width: width * 0.65,
                      height: 43,
                      color: Colors.white,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        initialValue: '',

                        decoration: InputDecoration(
                          hintText: 'Search',
                          counterText: "",
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 2.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    ),),
                  Positioned(
                    top: 8,
                    //  bottom: 10,
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: ElevatedButton(
                          child: const Text('showModalBottomSheet'),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 200,
                                  color: Colors.amber,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text('Modal BottomSheet'),
                                        ElevatedButton(
                                          child: const Text('Close BottomSheet'),
                                          onPressed: () => Navigator.pop(context),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      margin: EdgeInsets.only(left: 310),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: EdgeInsets.only(top: 60),
                      // color: Colors.white,
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'S.No',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Reason',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Leave Date',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Time Duration From',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Time Duration To',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Doctor',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Full Day Leave',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Edit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Delete',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('1'),
                              ),
                              DataCell(
                                Text('Fever'),
                              ),
                              DataCell(
                                Text('23/02/2022'),
                              ),
                              DataCell(
                                Text('00:00'),
                              ),
                              DataCell(
                                Text('00:00'),
                              ),
                              DataCell(
                                Text('Sarath'),
                              ),
                              DataCell(
                                Text('Full day'),
                              ),
                              DataCell(

                                  Icon(
                                    Icons.edit,
                                    color: Colors.cyan,
                                  )

                              ),
                              DataCell(

                                    Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )

                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('2'),
                              ),
                              DataCell(
                                Text('cold'),
                              ),
                              DataCell(
                                Text('24/02/2022'),
                              ),
                              DataCell(
                                Text('00:00'),
                              ),
                              DataCell(
                                Text('00:00'),
                              ),
                              DataCell(
                                Text('Sarath'),
                              ),
                              DataCell(
                                Text('full Day'),
                              ),
                              DataCell(

                                  Icon(
                                    Icons.edit,
                                    color: Colors.cyan,
                                  )

                              ),
                              DataCell(

                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('3'),
                              ),
                              DataCell(
                                Text('Marrriage Function'),
                              ),
                              DataCell(
                                Text('3/03/2022'),
                              ),
                              DataCell(
                                Text('9:00 am'),
                              ),
                              DataCell(
                                Text('1:00pm'),
                              ),
                              DataCell(
                                Text('Sarath'),
                              ),
                              DataCell(
                                Text('Half Day'),
                              ),
                              DataCell(

                                  Icon(
                                    Icons.edit,
                                    color: Colors.cyan,
                                  )

                              ),
                              DataCell(
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,

                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
           ],
        ),
      ),
    );


  }

  //
}

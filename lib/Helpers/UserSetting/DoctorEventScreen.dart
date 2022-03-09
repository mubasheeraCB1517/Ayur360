import 'dart:convert';

import 'package:ayur360_app/Route/route.dart';
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
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
    leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () =>                WidgetsBinding.instance!.addPostFrameCallback((_) {
    Navigator.pushNamed(
    context, RoutesName.DASHBOARD_PAGE);
    }),
    ),
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
                      fontSize: 29,
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
                        autofocus: false,
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
                          child: const Text('Create New'),
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
                                  fontSize: 19),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Reason',
                              style: TextStyle(
                                   fontSize: 19),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Leave Date',
                              style: TextStyle(
                                   fontSize: 19),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Time Duration From',
                              style: TextStyle(
                                  fontSize: 19),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Time Duration To',
                              style: TextStyle(
                              fontSize: 19),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Doctor',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Full Day Leave',
                              style: TextStyle(
                              fontSize: 19),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 19),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 19),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('1',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('Fever',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('23/02/2022',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('00:00',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('00:00',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('Sarath',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('Full day',style: TextStyle(fontSize: 19),),
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
                                Text('2',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('cold',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('24/02/2022',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('00:00',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('00:00',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('Sarath',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('full Day',style: TextStyle(fontSize: 19),),
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
                                Text('3',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('Marrriage Function',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('3/03/2022',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('9:00 am',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('1:00pm',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('Sarath',style: TextStyle(fontSize: 19),),
                              ),
                              DataCell(
                                Text('Half Day',style: TextStyle(fontSize: 19),),
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

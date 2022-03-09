import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MYAppointmentScreen extends StatefulWidget {
  const MYAppointmentScreen({Key? key}) : super(key: key);

  @override
  _MYAppointmentScreenState createState() => _MYAppointmentScreenState();
}

class _MYAppointmentScreenState extends State<MYAppointmentScreen> {
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
          title: Row(
            children: [
              Container(
                width: width * 0.64,
                height: 30,
                margin: const EdgeInsets.only(left: 4.1),
                child: Center(
                    child: Text(
                  "MY APPOINTMENTS",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 30,
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
                      left: 10,
                      //  bottom: 10,

                      child: Container(
                        width: width * 0.96,
                        height: 42,
                        color: Colors.white,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          initialValue: '',
                          decoration: InputDecoration(
                            hintText: 'Search',
                            counterText: "",
                            prefixIcon: Icon(Icons.search),
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 5.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      )),
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
                                  fontWeight: FontWeight.bold, fontSize: 19),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Booking',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Action',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('1',style: TextStyle(fontSize: 19)),
                              ),
                              DataCell(
                                Text(
                                  'Appointment for Arun K on 19 Feb 2022 20:27:51',
                                  style: TextStyle(fontSize: 19),
                                ),
                              ),
                              DataCell(Icon(
                                Icons.edit,
                                color: Colors.cyan,
                              )),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('2',style: TextStyle(fontSize: 19)),
                              ),
                              DataCell(
                                Text(
                                  'Appointment for Arun K on 19 Feb 2022 20:27:51',
                                  style: TextStyle(fontSize: 19),
                                ),
                              ),
                              DataCell(Icon(
                                Icons.edit,
                                color: Colors.cyan,
                              )),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('3' ,style: TextStyle(fontSize: 19)),
                              ),
                              DataCell(
                                Text(
                                  'Appointment for Arun K on 19 Feb 2022 20:27:51',
                                  style: TextStyle(fontSize: 19),
                                ),
                              ),
                              DataCell(Icon(
                                Icons.edit,
                                color: Colors.cyan,
                              )),
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
}
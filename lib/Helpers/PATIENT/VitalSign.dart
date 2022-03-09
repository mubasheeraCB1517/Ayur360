
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VitalSignScreen extends StatefulWidget {
  const VitalSignScreen({Key? key}) : super(key: key);

  @override
  _VitalSignScreenState createState() => _VitalSignScreenState();
}

class _VitalSignScreenState extends State<VitalSignScreen> {
  @override
  ListView _jobsListView() {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) =>
            Divider(
              color: Colors.black,
            ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
              color: Colors.blue[50],
              child: Stack(

                  children: [
                    Column(children: [

                      Container(
                        child: Text(
                          "AMAL THOMAS",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                        padding:
                        EdgeInsets.only(top: 30, right: 112),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Text(
                          "P202202210906",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]),

                        ),
                        padding:
                        EdgeInsets.only( right: 140),
                      ),
                      Container(
                        child: Text("22 Jan 20220 9:00:00",style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),),
                        padding: EdgeInsets.only(right: 105,top: 10),

                      ),
                      Container(
                        child: Text("Prescribed by Dr.Sarath R",style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),),
                        padding: EdgeInsets.only(right: 80,top: 10),
                      )



                    ]),


                    Container(
                      height: 150,
                      width: 300,

                      margin: EdgeInsets.only(left: 200),
                      color: Colors.green[50],
                      child:  ListView.builder(

                          scrollDirection: Axis.horizontal,

                          itemCount: 1,
                          itemBuilder: (context,index){
                            return  DataTable(
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text(
                                    'Pluse',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Weight',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Temperature',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    ' Bp ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                ),



                              ],
                              rows: const <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text('60'),
                                    ),
                                    DataCell(
                                      Text('80'),
                                    ),
                                    DataCell(
                                      Text('82'),
                                    ),
                                    DataCell(
                                      Text('130/200'),
                                    ),


                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text('2'),
                                    ),
                                    DataCell(
                                      Text('PRASARNAYADI KASHAYAM'),
                                    ),
                                    DataCell(
                                      Text('mg (milligram)'),
                                    ),
                                    DataCell(
                                      Text('mg (milligram)'),
                                    ),


                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text('3'),
                                    ),
                                    DataCell(
                                      Text('PRASARNAYADI KASHAYAM'),
                                    ),
                                    DataCell(
                                      Text('mg (milligram)'),
                                    ),

                                    DataCell(
                                      Text('mg (milligram)'),
                                    ),

                                  ],
                                ),
                              ],
                            );

                          }
                        // color: Colors.white,

                      ),


                    ),

                  ]));
        });
  }



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
                width: width*0.64,
                height: 35,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                    child: Text(
                      "Vital Sign",
                      style: TextStyle(color: Colors.grey[600], fontSize: 25,fontWeight:FontWeight.bold),
                    )),
              ),
              SizedBox(
                width: 27,
              ),

            ],

          ),
          actions: <Widget>[
            Image.asset("assets/images/ayurlogo.png")]),
      body: SingleChildScrollView(
        child: _jobsListView(),
      ),

    );
  }
}

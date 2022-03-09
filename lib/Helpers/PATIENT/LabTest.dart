

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabTestScreen extends StatefulWidget {
  const LabTestScreen({Key? key}) : super(key: key);

  @override
  _LabTestScreenState createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LabTestScreen> {
  int data = 1;
  @override
  ListView _jobsListView() {
    return ListView.builder(
      itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (context,index){

     return (
         Card(
              color: Colors.blue[50],
              child: Stack(

                children: [
                  Column(children: [

                    Container(
                      child: Text(
                        "AMAL THOMAS",
                        style: TextStyle(
                            fontSize: 12,
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
                      EdgeInsets.only( right: 100),
                    ),
                    Container(
                      child: Text("22 Jan 20220 9:00:00",style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),),
                      padding: EdgeInsets.only(right: 65,top: 10),

                    ),
                    Container(
                      child: Text("Prescribed by Dr.Sarath R",style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),),
                      padding: EdgeInsets.only(right: 40,top: 10),
                    )



                  ]),
                   Container(
                     height: 40,
                     width: 300
                     ,
                     color: Colors.green[50],
                     child: Text("Lab test",style: TextStyle(fontSize: 18),),
                     margin: EdgeInsets.only(left: 200,),
                     padding: EdgeInsets.only(left: 20,top: 10),
                   ),

                  Container(
                    height: 1,
                    width: 300
                    ,
                    color: Colors.grey,

                    margin: EdgeInsets.only(left: 200,top: 40),
                    padding: EdgeInsets.only(left: 20),
                  ),

                   Container(
                     height: 150,
                     width: 300,

                     margin: EdgeInsets.only(left: 200,top: 40),
                     color: Colors.green[50],
                     child:  ListView.builder(

                         scrollDirection: Axis.vertical,
                         itemCount: 2,
                         itemBuilder: (context,index){

                           return Column(
                             children: [
                               Container(
                                 color:Colors.grey[400],
                                 height: 40,
                                 width
                                     :300,
                                 child: Text("Bleeding/Clotting Time Test",style: TextStyle(fontSize: 16,color: Colors.grey[800],fontWeight: FontWeight.bold),),
                                 margin: EdgeInsets.only(top: 20),


                               ),
                               Divider(),


                               // Divider(),
                               // Container(
                               //   child: Text("Lab test"),
                               //
                               // ),
                               // Divider(),
                               // Container(
                               //   child: Text("Lab test"),
                               //
                               // ),


                             ],
                             
                           );
                         }),
                   ),



                ],
              ),

            ));



     }
     );

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
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                  child: Text(
                    "LAB TEST",
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



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Route/route.dart';

class MyPracticeTimeScreen extends StatefulWidget {
  const MyPracticeTimeScreen({Key? key}) : super(key: key);

  @override
  _MyPracticeTimeScreenState createState() => _MyPracticeTimeScreenState();
}

class _MyPracticeTimeScreenState extends State<MyPracticeTimeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.green[900],
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () =>
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, RoutesName.MY_PROFILE);
                  })),
          iconTheme: const IconThemeData(color: Colors.black),
          title: Row(
            children: [
              Container(
                width: width * 0.64,
                height: 30,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                    child: Text(
                      "DOCTOR PRACTICE TIME",
                      style: TextStyle(
                          color: Colors.grey[900],
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
        child: Container(padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [



              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Monday Duration From",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color:Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "09:00:00",
                      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                      border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),


              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Monday Duration To",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color:Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "15:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),

              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Tuesday Duration From",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color:Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "09:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Tuesday Duration To",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color:Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "15:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Wednesday Duration From",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color: Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "09:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Wednesday Duration To",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color: Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "15:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Thursday Duration From",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color: Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "09:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Thursday Duration To",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color:Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "15:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),

              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Friday Duration From",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color:Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "09:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Friday Duration To",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color: Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "15:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Saturday Duration From",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color: Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "09:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "saturday Duration To",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color:Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "15:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Sunday Duration From",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color: Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "09:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Sunday Duration To",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color: Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "15:00:00",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.access_time,color: Colors.grey[800],)



                    ),
                  )),



            ],
          ),
        ),
      ),
    );
  }
}

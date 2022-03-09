

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(appBar: AppBar(
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
                    "CHANGE PASSWORD",
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
        child: Container(
          height: height,
          width: width,
          color: Colors.green[50],
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20,top: 100),
                width: width*0.90,
                child: Text(
                  "Current Password",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                      border: OutlineInputBorder(),



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "New Password",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                      border: OutlineInputBorder(),



                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20,top: 30),
                width: width*0.90,
                child: Text(
                  "Confirm Password",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),



              Container(
                  height: 40,
                  width: width *0.90,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: TextField(
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                      border: OutlineInputBorder(),



                    ),
                  )),
              Row(
                children:[

                  Container(
                  margin: EdgeInsets.only(left: 29,top: 60),
                  width: width*0.40,
                  height: 30,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      "Chage Password",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),

                ),
                  Container(
                    margin: EdgeInsets.only(left: 0,top: 60),
                    width: width*0.10,
                    height: 30,
                    color: Colors.green,
                    child: Center(
                      child:Icon(Icons.arrow_forward,color: Colors.white,)
                    ),

                  ),

      ]
              ),

            ],
          ),
        ),
      ),


    );
  }
}

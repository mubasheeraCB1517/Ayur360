import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Route/route.dart';

class MyProfileEditScreen extends StatefulWidget {
  const MyProfileEditScreen({Key? key}) : super(key: key);

  @override
  _MyProfileEditScreenState createState() => _MyProfileEditScreenState();
}

class _MyProfileEditScreenState extends State<MyProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
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
                  "MY PROFILE",
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
                       margin: EdgeInsets.only(left: 20,top: 30),
                       width: width*0.90,
                       child: Text(
                "Full Name",
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
hintText: "Sarath.R",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              border: OutlineInputBorder(),



            ),
                )),


            Container(
              margin: EdgeInsets.only(left: 20,top: 20),
              width: width*0.90,
              child: Text(
                "Email Id",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.grey[800]),
              ),
            ),

            Container(
                height: 40,
                width: width *0.90,
                color:  Colors.green[50],
                margin: EdgeInsets.only(top: 10,left: 10),
                child: TextField(
                  decoration: InputDecoration(
hintText: "sarathr@gmail.com",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    border: OutlineInputBorder(),



                  ),
                )),

            Container(
              margin: EdgeInsets.only(left: 20,top: 20),
              width: width*0.90,
              child: Text(
                "Mobile Country Code",
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
hintText: "+91",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    border: OutlineInputBorder(),



                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 20,top: 20),
              width: width*0.90,
              child: Text(
                "Mobile No",
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
hintText: "7878785757",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    border: OutlineInputBorder(),



                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 20,top: 20),
              width: width*0.90,
              child: Text(
                "Whatsapp Country Code",
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
hintText: "+91",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    border: OutlineInputBorder(),



                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 20,top: 20),
              width: width*0.90,
              child: Text(
                "Whatsapp No",
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
hintText: "8989866887",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    border: OutlineInputBorder(),



                  ),
                )),
            Row(
              children: [Container(
                margin: EdgeInsets.only(left: 28,top: 20),
                width: width*0.40,
                child: Text(
                  "Country",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
              ),
                Container(
                  margin: EdgeInsets.only(left: 25,top: 20),
                  width: width*0.40,
                  child: Text(
                    "Place",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.grey[800]),
                  ),
                ),
    ]
            ),
            Row(
              children: [Container(
                  height: 40,
                  width: width *0.40,
                  color: Colors.green[50],
                  margin: EdgeInsets.only(top: 10,left: 25),
                  child: TextField(
                    decoration: InputDecoration(
hintText: "india",
                      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                      border: OutlineInputBorder(),



                    ),
                  )),
                SizedBox(width: 20,),
                Container(
                    height: 40,
                    width: width *0.43,
                    color: Colors.green[50],
                    margin: EdgeInsets.only(top: 10,left: 10),
                    child: TextField(
                      decoration: InputDecoration(
hintText: "kerala",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),



                      ),
                    )),
      ]
            ),

            Container(
              margin: EdgeInsets.only(left: 20,top: 20),
              width: width*0.90,
              child: Text(
                "Qualification",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.grey[800]),
              ),
            ),
            Container(
                height: 40,
                width: width *0.90,
                color:  Colors.green[50],

              margin: EdgeInsets.only(top: 10,left: 10,right: 10),

                  child: TextFormField(
                    decoration: InputDecoration(


                      border: OutlineInputBorder(),
                      hintText: "MD",
                      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),


                    ),

                  ),
                ),
            Container(
              margin: EdgeInsets.only(left: 20,top: 20),
              width: width*0.90,
              child: Text(
                "Specialization",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.grey[800]),
              ),
            ),
            Container(
                height: 40,
                width: width *0.90,
                color:  Colors.green[50],
                margin: EdgeInsets.only(top: 10,left: 10),
                child: TextField(
                  decoration: InputDecoration(
hintText: "Master of Surgery",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    border: OutlineInputBorder(),



                  ),
                )),



          ],
        ),
      ),
    );
  }
}

import 'package:ayur360_app/Route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({Key? key}) : super(key: key);

  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: width,
              color: Colors.green[900],
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 170,
                    width: width,
                    child: Image.asset("assets/images/ayurlogo.png"),
                  ),
                  Center(
                    child: Container(
                      width: width,
                      padding:
                      EdgeInsets.symmetric(vertical: 2, horizontal: 50),
                      child: Center(
                        child: Text(
                          "Online Consultation With",
                          style: TextStyle(
                              fontSize: 27,
                              //: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Center(
                        child: Text(
                          "Ayurveda Doctors",
                          style: TextStyle(fontSize: 27, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Center(
                        child: Text(
                          "(General & Specialities)",
                          style: TextStyle(
                              fontSize: 25,
                              //fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Doctor Login",
                  style: TextStyle(
                      fontSize: 30,
                      //fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width * 0.84,
              height: 47,
              child: TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                initialValue: '',
                decoration: InputDecoration(
                  hintText: 'Username',
                  counterText: "",
                  contentPadding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: width * 0.84,
              height: 47,
              child: TextFormField(
                // style: TextStyle(color: Colors.green),
                keyboardType: TextInputType.text,

                autofocus: true,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  counterText: "",
                  contentPadding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
            Container(
              width: width,
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Lost Password?",
                  style: TextStyle(
                      fontSize: 22,
                      //fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width * 0.84,

              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.blue, boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              ),
              // padding: EdgeInsets.only(top: 20),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.pushNamed(context, RoutesName.DASHBOARD_PAGE);
                    });
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 22,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width * 0.84,

              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.lightGreen[800],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],),
              // padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "PATIENT LOGIN",
                  style: TextStyle(
                      fontSize: 22,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

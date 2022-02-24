import 'dart:async';
import 'package:ayur360_app/Route/route.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Image.asset("assets/images/ayurlogo.png"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Flexible(
          flex: 5,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: height * 0.420,
                  color: Color(0xFF0F4A05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width,
                        height: height * 0.30,
                        child: Stack(children: [
                          Center(
                            child: Image.asset(
                              'assets/images/ayurlogo.png',
                            ),
                          ),
                        ]),
                      ),
                      Text(
                        "Online Consultation With Ayurveda Doctors",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "(General & Specialities)",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Patient Login",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width * 0.90,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width * 0.90,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Lost Password? | Login with OTP",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF169dda),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: width * 0.90,
                    height: 40,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "LOG IN",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))),
                SizedBox(
                  height: 15,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFf08a1a),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    width: width * 0.90,
                    height: 40,
                    child: TextButton(
                        onPressed: () {
                 WidgetsBinding.instance!.addPostFrameCallback((_) {
                   Navigator.pushNamed(context, RoutesName.Patient_Registration);
                 });
                        },
                        child: Text(
                          "NEW USER REGISTRATION",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ))),
                SizedBox(
                  height: 15,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green[600],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    width: width * 0.90,
                    height: 40,
                    child: TextButton(
                        onPressed: () {
                          WidgetsBinding.instance!.addPostFrameCallback((_) {
                            Navigator.pushNamed(context, RoutesName.DOCTOR_LOGIN);
                          });
                        },
                        child: Text(
                          "DOCTOR LOGIN",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

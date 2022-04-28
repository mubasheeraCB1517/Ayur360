import 'dart:async';

import 'package:ayur360_app/Route/route.dart';
import 'package:ayur360_app/Updater/upgrader.dart';

import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';

import 'alluserlogin.dart';
import 'alluserlogin.dart';

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
      backgroundColor: Colors.green[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: width,
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Center(
                child: Text(
                  "Online Consultation",
                  style: TextStyle(
                      fontSize: 35,
                      //: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Center(
                child: Text(
                  " With",
                  style: TextStyle(fontSize: 39, color: Colors.white),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Center(
                child: Text(
                  "Ayurveda Doctors",
                  style: TextStyle(fontSize: 35, color: Colors.white),
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
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 350,
            width: width,
            child: Image.asset("assets/images/ayurlogo.png"),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            margin: EdgeInsets.only(left: 110, right: 110),
            height: 40,
            width: width * 0.40,
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: FlatButton(
                    onPressed: () {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
                      });
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ))),
          ),
        ],
      ),
    );
  }
}

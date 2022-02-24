import 'dart:async';

import 'package:ayur360_app/Helpers/deviceInfo.dart';
import 'package:ayur360_app/Helpers/hiveshareperfrence.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:ayur360_app/Updater/upgrader.dart';

import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';

import 'homeScreen.dart';
import 'homeScreen.dart';
class WelcomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
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
    return Scaffold(

      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.green[900],
              child: Column(
                children: [
                  Center(
              child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 90),
              child: Image.asset("assets/images/ayurlogo.png"),
                  )
                  ),
                  Text("Online Consultation With Ayurveda Doctors",style: TextStyle(color: Colors.white,fontSize: 20),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("(General & Specialities)",style: TextStyle(color: Colors.blue,fontSize: 20),),
                ],
              ),
            ),
            Text("Patient Login",style: TextStyle(color: Colors.blue,fontSize: 20)),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          maxLength: 4,

          autofocus: true,
          initialValue: '',
          decoration: InputDecoration(
            hintText: 'User Name',
            counterText: "",
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 4,

              autofocus: true,
              initialValue: '',
              decoration: InputDecoration(
                hintText: 'Password',
                counterText: "",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Lost Password? | Login with OTP",style: TextStyle(color: Colors.black,fontSize: 20),),
            SizedBox(
              height: 10,
            ),
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.blue[300],
               ),

                 width: 400,
                 height: 50,
                 child: TextButton(onPressed: (){}, child: Text("LOGO IN",style: TextStyle(color: Colors.white,fontSize: 20),))),
            SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange[300],
                ),

                width: 400,
                height: 50,
                child: TextButton(onPressed: (){}, child: Text("NEW USER REGITRATION",style: TextStyle(color: Colors.white,fontSize: 20),))),
            SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[300],
                ),

                width: 400,
                height: 50,
                child: TextButton(onPressed: (){}, child: Text("DOCTOR LOGOIN",style: TextStyle(color: Colors.white,fontSize: 20),))),


          ],
        ),
      )


    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientRegistration extends StatefulWidget {
  const PatientRegistration({Key? key}) : super(key: key);

  @override
  _PatientRegistrationState createState() => _PatientRegistrationState();
}

class _PatientRegistrationState extends State<PatientRegistration> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
         body: Stack(
             children: [
               Container(
                 color: Color(0xFF0F4A05),
                 width: width,
                 height: height * 0.20,
                 child: Stack(
                   children: [
                     Positioned(child:Center(
           child: Image.asset(
           'assets/images/ayurlogo.png',
           ),
         ),
                     )
                   ],
                 ),
               ),
               Container(
                 child: Text("123"),
               )
             ],
           )
    );

  }
}

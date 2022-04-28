import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Route/route.dart';
import '../MYPROFILE/MYProfileEditScreen.dart';
import '../MYPROFILE/MyPracticeTimeScreen.dart';

class MyProfilescreen extends StatefulWidget {
  const MyProfilescreen({Key? key}) : super(key: key);

  @override
  _MyProfilescreenState createState() => _MyProfilescreenState();
}

class _MyProfilescreenState extends State<MyProfilescreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 80,
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            title: Text(
              "PROFILE",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            //  actions: <Widget>[Image.asset("assets/images/ayurlogo.png")],
            bottom: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              indicator: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              tabs: [
                Tab(
                    child: Center(
                  child: Text(
                    "My Profile",
                    style: TextStyle(fontSize: 17),
                  ),
                )),
                // SizedBox(width: 10,),
                Tab(
                  child: Center(
                    child: Text(
                      "My Practice Time",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [MyProfileEditScreen(), MyPracticeTimeScreen()],
          )
          //  height: height,

          ),
    );
  }
}

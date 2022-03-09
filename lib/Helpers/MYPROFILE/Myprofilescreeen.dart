import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Route/route.dart';

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
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Colors.white,
      //
      //   actions: <Widget>[
      //     Image.asset("assets/images/ayurlogo.png"),
      //   ],
      // ),
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () =>
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, RoutesName.DASHBOARD_PAGE);
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
                  "PROFILE",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
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
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 150),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2, 2),
                        blurRadius: 5.0,
                      ),
                    ]),
                height: height * 0.220,
                width: width * 0.800,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 70,
                      width: 50,
                      child: Image.asset(
                        "assets/images/user.png",
                      ),
                    ),
                    Center(
                      child: Text(
                        "MY PROFILE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(

                          child: TextButton(

                            onPressed: () {  WidgetsBinding.instance!.addPostFrameCallback((_) {
                              Navigator.pushNamed(context, RoutesName.MY_PROFILEEDIT);

                            }); },
                            child: Text(
                        "click here to edit profile",
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                          )
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(2, 2),
                      ),
                    ]),
                height: height * 0.220,
                width: width * 0.800,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/images/clock.png"),
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            // WidgetsBinding.instance!.addPostFrameCallback((_) {
                            //   Navigator.pushNamed(context, RoutesName.YOUR_APPOINTMENT  );
                            // });
                          },
                          child: Text(
                            "MY PRACTICE TIME",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Center(
                      child: TextButton(  onPressed: () {  WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, RoutesName.MY_PRACTICETIME);

                      }); },

                        child: Text(
                          "click here to edit practice time",
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

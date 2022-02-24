import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
      appBar:
      AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            /* Write listener code here */
          },
          child: Icon(
            Icons.menu, color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Image.asset("assets/images/ayurlogo.png"),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [Container(
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 35),
          child: Text("DASHBOARD", style: TextStyle(fontSize: 25,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold),),
          ),

          ],
        ),

      ),
    );
  }
}

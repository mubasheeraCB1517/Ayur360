import 'package:ayur360_app/Route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveConsutationcreen extends StatefulWidget {
  const LiveConsutationcreen({Key? key}) : super(key: key);

  @override
  _LiveConsutationcreenState createState() => _LiveConsutationcreenState();
}

class _LiveConsutationcreenState extends State<LiveConsutationcreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.green[900],
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () =>                WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushNamed(
                  context, RoutesName.DASHBOARD_PAGE);
            }),
          ),
          title: Row(
            children: [
              Container(
                width: width * 0.64,
                height: 40,
                margin: const EdgeInsets.only(left: 4),
                child: Center(
                    child: Text(
                  "LIVE CONSULTATION",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
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
        child: Column(children: [
          Container(

            padding: EdgeInsets.only(top: 25,),
            child: Container(

              width: width*0.95,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.only(left: 12),
              child: ListTile(
                  title: Container(

                      child: Padding(
                        padding: const EdgeInsets.only(top: 26),
                        child: Text("YOU ARE ONLINE NOW",style: TextStyle(fontSize: 19),),
                      )),
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 26),
                    child: Icon(
                      Icons.circle,
                      color: Colors.lightGreenAccent[400],
                      size: 24,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: Container(
                        width: width * 0.30,
                        height: 50,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.green,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text("Make offline",style: TextStyle(fontSize: 17),),
                        )),
                      ),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              "Waiting for Consultation...!",
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.bold,fontSize: 19),
            ),
          )
        ]),
      ),
    );
  }
}

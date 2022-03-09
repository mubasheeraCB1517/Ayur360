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
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Row(
            children: [
              Container(
                width: width * 0.64,
                height: 30,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                    child: Text(
                  "LIVE CONSULTATION",
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
        child: Column(children: [
          Container(

            padding: EdgeInsets.only(top: 20,),
            child: Card(
              child: ListTile(
                  title: Container(

                      child: Text("YOU ARE ONLINE NOW")),
                  leading: Icon(
                    Icons.circle,
                    color: Colors.lightGreenAccent[400],
                    size: 20,
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: width * 0.30,
                      height: 30,

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
                      child: Center(child: Text("Change to offline")),
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
                  color: Colors.grey[600], fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}

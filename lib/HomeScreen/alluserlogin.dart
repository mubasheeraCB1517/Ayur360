import 'package:ayur360_app/Route/route.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  @override

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.green[800],
        body:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Container(
                margin: EdgeInsets.only(top: 90,right: 10),
                child: Center(
                    child: Text(
                  " Patient Login",
                  style: TextStyle(fontSize: 45, color: Colors.green[100]),
                )),
              ),
            Form(
              child: new Column(
                children: <Widget>[
                  SizedBox(
                    width: width * 0.84,
                    child: Padding(
             padding: EdgeInsets.only(top: 40),
                      child: TextField(
                        autofocus: false,
                        style: TextStyle(fontSize: 17.0, color: Color(0xFFbdc6cf)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: width * 0.84,
                    // height: 60,
                    child: TextField(
                      autofocus: false,
                      style: TextStyle(fontSize: 17.0, color: Color(0xFFbdc6cf)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        contentPadding:
                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),

                      ),
                    ),
                  ),
                  Row(children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 80),
                      child: Center(
                        child: Text(
                          "Lost Password  |",
                          style: TextStyle(
                              fontSize: 19,
                              //fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text(
                          "Login With OTP?",
                          style: TextStyle(
                              fontSize: 19,
                              //fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ]),
                  new Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                  ),
                  Container(
                    width: width * 0.84,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.lightGreen[700],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,

                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 27,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width * 0.84,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.orange,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,

                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: FlatButton(
                        onPressed: (){
                          WidgetsBinding.instance!.addPostFrameCallback((_) {
                            Navigator.pushNamed(context, RoutesName.DOCTOR_LOGIN);
                          });
                        },
                        child: Text(
                          "DOCTOR LOGIN",
                          style: TextStyle(
                              fontSize: 27,
                              //fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 130),
                    height: 120,
                    width: width,
                    child: Image.asset("assets/images/ayurlogo.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "New User Registration ?",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  ),
                ],
              ),
              // TextFormField(
              //   keyboardType: TextInputType.number,
              //   maxLength: 2,
              //
              //   autofocus: true,
              //   initialValue: '',
              //   decoration: InputDecoration(
              //     hintText: 'Password',
              //     counterText: "",
              //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              //   ),
              // ),
              //


            )
          ]
        )

    );



  }
}

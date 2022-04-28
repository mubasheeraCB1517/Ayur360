import 'package:ayur360_app/Doctor/repositories/lostpasswordReposiories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Route/route.dart';

TextEditingController UserNameController = TextEditingController();
TextEditingController EmailController = TextEditingController();

class LostPasswordScreen extends StatefulWidget {
  const LostPasswordScreen({Key? key}) : super(key: key);

  @override
  _LostPasswordScreenState createState() => _LostPasswordScreenState();
}

class _LostPasswordScreenState extends State<LostPasswordScreen> {
  void initState() {
    super.initState();
    UserNameController.text = "";
    EmailController.text = "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String Errormsg = "";
    showAlertDialog(BuildContext context) {
      // set up the button
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
          });
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Center(
            child: Text(
          "Shared",
          style: TextStyle(fontSize: 22, color: Colors.green[900]),
        )),
        content: Text(
          "We will share a link to your given mail Id !",
          style: TextStyle(fontSize: 19),
        ),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    lostpassword LostpasswordApi = lostpassword();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        elevation: 3,
        leading: GestureDetector(
          onTap: () {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushNamed(context, RoutesName.DOCTOR_LOGIN);
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 60,
            width: width * 0.6,
            margin: EdgeInsets.only(top: 90, left: 40),
            child: Center(
                child: Text(
              "Reset Your Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              width: width * 0.8,
              margin: EdgeInsets.only(left: 50),
              child: TextField(
                controller: UserNameController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  hintText: " UserName",
                ),
              )),
          SizedBox(
            height: 50,
          ),
          Container(
              width: width * 0.8,
              margin: EdgeInsets.only(left: 50),
              child: TextField(
                controller: EmailController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  hintText: " Email",
                ),
              )),
          SizedBox(
            height: 60,
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            height: 40,
            width: width * 0.50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[900]),
            child: Center(
                child: GestureDetector(
              onTap: () {
                LostpasswordApi.lostPassword().then((value) {
                  if (value == 0) {
                    showAlertDialog(context);
                  } else {
                    Fluttertoast.showToast(
                      msg: "Username or Email is not registerd",
                      gravity: ToastGravity.SNACKBAR,
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  }
                });
              },
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
          )
        ]),
      ),
    );
  }
}

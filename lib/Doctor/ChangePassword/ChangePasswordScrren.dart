import 'package:ayur360_app/Doctor/ChangePassword/currentPasswordNotifier.dart';
import 'package:ayur360_app/Doctor/repositories/updatepasswordRepository.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../repositories/changepasswordRepository.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  String errormessage = "";
  String errormessage1 = "";
  var confirmPass;
  final errorMsg = CurrentPassordNotifier();

  Widget build(BuildContext context) {
    showAlertDialog(
      BuildContext context,
    ) {
      // set up the button
      Widget okButton = TextButton(
        child: Text("ok"),
        onPressed: () {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Navigator.pushNamed(context, RoutesName.DASHBOARD_PAGE);
          });
        },
      );
      Widget noButton = TextButton(
        child: Text("cancel"),
        onPressed: () {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Navigator.pushNamed(context, RoutesName.DOCTOR_EVENT);
          });

          print("sdfgh");
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Password Updated Successfully"),
        actions: [okButton, noButton],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (
          BuildContext context,
        ) {
          return alert;
        },
      );
    }

    ChangePasswordRepository changepasswordsapi = ChangePasswordRepository();
    final GlobalKey<FormState> _form = GlobalKey<FormState>();
    UpdatePasswordRepository updatepasswordapi = UpdatePasswordRepository();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController ChangepasswordController = TextEditingController();
    TextEditingController NewpasswordController = TextEditingController();
    TextEditingController ConfirmpasswordController = TextEditingController();
    bool _validate = false;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.green[900],
          iconTheme: const IconThemeData(color: Colors.black),
          title: Row(
            children: [
              Container(
                width: width * 0.64,
                height: 30,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                    child: Text(
                  "CHANGE PASSWORD",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 26,
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
        child: Container(
          height: height,
          width: width,
          color: Colors.green[50],
          child: Form(
            key: _form,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 100),
                  width: width * 0.90,
                  child: Text(
                    "Current Password",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.grey[800]),
                  ),
                ),
                AnimatedBuilder(
                    animation: errorMsg,
                    builder: (BuildContext context, Widget? child) {
                      return Container(
                          height: 40,
                          width: width * 0.90,
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: TextField(
                            controller: ChangepasswordController,
                            onChanged: (String value) {
                              changepasswordsapi
                                  .changePassword(value)
                                  .then((value) {
                                if (value == false) {
                                  errorMsg.getErrorMsg("Incorrect Password");

                                  print("fg");
                                } else {
                                  errorMsg.getErrorMsg("");
                                }
                              });
                            },
                            decoration: InputDecoration(
                              errorText: errorMsg.errorMsg,
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              errorStyle: TextStyle(
                                height: 0,
                                color: Colors.blue[400],
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),

                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 20, 10, 0),
                              border: OutlineInputBorder(),

                              // errorText: _validate ? "Please enter a Username" : null
                            ),
                          ));
                    }),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  width: width * 0.90,
                  child: Text(
                    "New Password",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.grey[800]),
                  ),
                ),
                Container(
                    height: 40,
                    width: width * 0.90,
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: TextFormField(
                      // textDirection: TextDirection.rtl,
                      controller: NewpasswordController,
                      validator: (validator) {
                        if (validator!.isEmpty) return 'Empty';
                        return null;
                      },
                      //   onChanged: (value) => NewpasswordController.text = value,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  width: width * 0.90,
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.grey[800]),
                  ),
                ),
                Container(
                    height: 40,
                    width: width * 0.90,
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value! == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        if (value != NewpasswordController.text) {
                          return ' Password does not match ';
                        }

                        return null;
                      },
                      //  onChanged: (value) => ConfirmpasswordController.text = value,
                      controller: ConfirmpasswordController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        border: OutlineInputBorder(),
                      ),
                    )),
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(left: 29, top: 60),
                    width: width * 0.40,
                    height: 30,
                    color: Colors.green,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          _form.currentState?.validate();
                          updatepasswordapi
                              .updatePassword(ConfirmpasswordController.text);
                          showAlertDialog(context);
                        },
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 60),
                    width: width * 0.10,
                    height: 30,
                    color: Colors.green,
                    child: Center(
                        child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

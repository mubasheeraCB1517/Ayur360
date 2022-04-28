import 'package:ayur360_app/Route/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DoctorLoginRepository/DrLoginApi.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({Key? key}) : super(key: key);

  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

bool _validate = false;
bool _validatePassword = false;

class _DoctorLoginState extends State<DoctorLogin> {
  TextEditingController UserNameController = TextEditingController();
  TextEditingController PassWordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  //final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool _isobsucure = true;
  drLOginRepository loginApiCall = new drLOginRepository();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              color: Colors.green[900],

              // child: loginScreen(context)
            ),
            Container(
              margin: EdgeInsets.only(top: 90),
              height: 200,
              width: width,
              child: Image.asset("assets/images/ayurlogo.png"),
            ),
            Container(
              width: width,
              padding: EdgeInsets.only(top: 300),
              child: Center(
                child: Text(
                  "Doctor Login",
                  style: TextStyle(fontSize: 45, color: Colors.green[100]),
                ),
              ),
            ),

            Container(
                margin: EdgeInsets.only(top: 400),
                child: LoginCredentials(context)),
            SizedBox(
              height: 10,
            ),
            // Logins(context)
          ],
        ),
      ),
    );
  }

  //==================================================================================================================
  Widget loginScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50),
          height: 170,
          width: width,
          child: Image.asset("assets/images/ayurlogo.png"),
        ),
        Center(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 50),
            child: Center(
              child: Text(
                "Online Consultation With",
                style: TextStyle(
                    fontSize: 27,
                    //: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Center(
              child: Text(
                "Ayurveda Doctors",
                style: TextStyle(fontSize: 27, color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Center(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Center(
              child: Text(
                "(General & Specialities)",
                style: TextStyle(
                    fontSize: 25,
                    //fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //==================================================================================================================

  // loginApiCall.createUser(UserNameController.text, PassWordController.text,context);

  Widget LoginCredentials(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return new Form(
      key: _formKey,
      child: new Column(
        children: <Widget>[
          SizedBox(
            width: width * 0.84,
            //height: 60,
            child: new TextFormField(
              controller: UserNameController,
              decoration: InputDecoration(
                //  contentPadding: EdgeInsets.all(8.0),

                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                filled: true,
                fillColor: Colors.white,
                hintText: " User Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                errorText: _validatePassword ? 'Please fill this field' : null,
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "* Required";
                } else
                  return null;
              },
              onSaved: (value) => UserNameController.text = value!,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            width: width * 0.84,
            // height: 60,
            child: new TextFormField(
              controller: PassWordController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  //contentPadding: EdgeInsets.all(5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  hintText: " Password",
                  errorText:
                      _validatePassword ? 'Please fill this field' : null,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isobsucure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isobsucure = !_isobsucure;
                        });
                      })),
              obscureText: _isobsucure,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "* Required";
                } else
                  return null;
              },
              onSaved: (value) => PassWordController.text = value!,
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: FlatButton(
                onPressed: () {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, RoutesName.LOST_PASSWORD);
                  });
                },
                child: Text(
                  "Lost Password?",
                  style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          Container(
            width: width * 0.84,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.lightGreen[700],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,

                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      print("Form was Submitted Successfully");
                      UserNameController.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                      PassWordController.text.isEmpty
                          ? _validatePassword = true
                          : _validatePassword = false;
                    }
                    loginApiCall.createUser(UserNameController.text,
                        PassWordController.text, context);
                  });
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 27,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
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
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.orange,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,

                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Patient LOGIN",
                style: TextStyle(
                    fontSize: 27,
                    //fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

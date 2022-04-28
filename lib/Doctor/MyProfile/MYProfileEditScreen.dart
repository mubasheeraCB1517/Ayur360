import 'package:ayur360_app/Doctor/bloc/labTestBloc.dart';
import 'package:ayur360_app/Doctor/bloc/myProfileBloc.dart';
import 'package:ayur360_app/Doctor/bloc/prescriptionBloc.dart';
import 'package:ayur360_app/Doctor/models/labTestModel.dart';
import 'package:ayur360_app/Doctor/models/myProfileModel.dart';
import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:ayur360_app/Updater/network/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shimmer.dart';

class MyProfileEditScreen extends StatefulWidget {
  const MyProfileEditScreen({Key? key}) : super(key: key);

  @override
  _MyProfileEditScreenState createState() => _MyProfileEditScreenState();
}

class _MyProfileEditScreenState extends State<MyProfileEditScreen> {
  late MyProfileListBloc _bloc;
  late MyprofileModel myprofilelist;

  void initState() {
    super.initState();
    _bloc = MyProfileListBloc();
    setState(() {});
  }

  @override
  _jobsListView(data) {
    return Container(
      // margin: EdgeInsets.only(top: 40,left: 30,right: 30),
      height: 900,
      color: Colors.green[100],
      child: Stack(alignment: Alignment.center, children: [
        CustomPaint(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          painter: HeaderCurvedContainer(),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(27.0),
            child: Text(
              '${data.fullName}',
              style: TextStyle(
                fontSize: 23.0,
                //  letterSpacing: 1.5,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.width / 3,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.green.shade900)
                  //Image.asset("assets/images/name.png"),

                  ),
              child: FittedBox(
                child: Image.asset(
                  "assets/images/whatsappProfile.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                ),
                child: Container(
                  height: 40,
                  width: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/name.png"),
                  ),
                ),
              ),
              //SizedBox(width: 30,),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                ),
                child: Container(
                  height: 70,
                  width: 70,
                  child: Center(
                      child: Text(
                    "${data.fullName}",
                    style: TextStyle(fontSize: 20),
                  )),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/email.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 0),
                    child: Container(
                      height: 60,
                      width: 200,
                      child: Center(
                          child: Text(
                        "${data.emailId}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset("assets/images/phone.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 0),
                    child: Container(
                      height: 60,
                      width: 130,
                      child: Center(
                          child: Text(
                        "${data.mobileNo}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset("assets/images/whatsapp.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 0),
                    child: Container(
                      height: 60,
                      width: 130,
                      child: Center(
                          child: Text(
                        "${data.mobileNo}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset("assets/images/qualification.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 38, top: 20),
                    child: Container(
                      height: 60,
                      width: 160,
                      child: Center(
                          child: Text(
                        "${data.qualification}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset("assets/images/specialization.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      height: 60,
                      width: 130,
                      child: Center(
                          child: Text(
                        "${data.specialization}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ])
      ]),
    );
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: StreamBuilder<Response<MyprofileModel>>(
          stream: _bloc.myprofileDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("ahh");
              // print("snapshot.data!.data--->${snapshot.data!}");
              // print("data->>>>>>${myprofilelist}");
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return LessonViewShimmer(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                  break;
                case Status.SUCCESS:
                  myprofilelist = snapshot.data!.data;

                  return SingleChildScrollView(
                      child: Container(child: _jobsListView(myprofilelist)));
                  break;
                case Status.ERROR:
                  return Container(
                    color: Colors.yellow,
                  );
              }
            }
            return LessonViewShimmer();
          }),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 250.0, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

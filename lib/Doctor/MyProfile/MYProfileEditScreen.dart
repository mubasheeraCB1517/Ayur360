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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70.0, left: 20, right: 20),
          child: Column(children: [
            Container(
              height: 650,
              width: 500,
              //  color: Colors.green[900],
              child: Card(
                color: Colors.white,
                child: ListTile(
                  //leading: Icon(Icons.music_note),
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 20),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/name.png"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 20),
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
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0, top: 20),
                            child: Container(
                              height: 70,
                              width: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/email.png"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only( top: 20),
                            child: Container(
                              height: 60,
                              width: 200,

                              child: Center(
                                  child: Text(
                                "${data.emailId}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              )),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0, top: 20),
                            child: Container(
                              height: 70,
                              width: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset("assets/images/phone.png"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only( top: 20),
                            child: Container(
                              height: 60,
                              width: 130,

                              child: Center(
                                  child: Text(
                                    "${data.mobileNo}",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                elevation: 10,
                shadowColor: Colors.grey,
                margin: EdgeInsets.all(10),
              ),
            ),
          ]),
        ),
      ],
    );
  }

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
                  "My Profile",
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

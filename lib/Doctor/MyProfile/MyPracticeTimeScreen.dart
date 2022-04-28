import 'package:ayur360_app/Doctor/bloc/myPracticeTImeBloc.dart';
import 'package:ayur360_app/Doctor/models/myPracticeTimeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Updater/network/response.dart';
import '../../shimmer.dart';

class MyPracticeTimeScreen extends StatefulWidget {
  const MyPracticeTimeScreen({Key? key}) : super(key: key);

  @override
  _MyPracticeTimeScreenState createState() => _MyPracticeTimeScreenState();
}

class _MyPracticeTimeScreenState extends State<MyPracticeTimeScreen> {
  late MyPracticeTimeBloc _bloc;
  late MypracticeTimeModel mypracticetimelist;

  void initState() {
    super.initState();
    _bloc = MyPracticeTimeBloc();
    setState(() {});
  }

  @override
  _jobsListView(data) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blueAccent),
                    boxShadow: [
                      // color: Colors.white, //background color of box
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 1.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                          1.0, // Move to right 10  horizontally
                          1.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 350,
                      child: Text(
                        "Monday Duration From",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.monTimeFrom}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      width: 350,
                      child: Text(
                        "Monday Duration To",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.monTimeTo}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blueAccent),
                    boxShadow: [
                      // color: Colors.white, //background color of box
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 1.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                          1.0, // Move to right 10  horizontally
                          1.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 350,
                      child: Text(
                        "Tuesday Duration From",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                            ),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.tuesTimeFrom}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 15),
                      width: 350,
                      child: Text(
                        "Tuesday Duration To",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.tuesTimeTo}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueAccent),
                  boxShadow: [
                    // color: Colors.white, //background color of box
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 1.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        1.0, // Move to right 10  horizontally
                        1.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 350,
                      child: Text(
                        "Wednesday Duration From",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.wedTimeFrom}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 350,
                      child: Text(
                        "Wednesday Duration To",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.wedTimeTo}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueAccent),
                  boxShadow: [
                    // color: Colors.white, //background color of box
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 1.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        1.0, // Move to right 10  horizontally
                        1.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 350,
                      child: Text(
                        "Thursday Duration From",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.thursTimeFrom}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 350,
                      child: Text(
                        "Thursday Duration To",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.thursTimeTo}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueAccent),
                  boxShadow: [
                    // color: Colors.white, //background color of box
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 1.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        1.0, // Move to right 10  horizontally
                        1.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 350,
                      child: Text(
                        "Friday Duration From",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.friTimeFrom}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 350,
                      child: Text(
                        "Friday Duration To",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.friTimeTo}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueAccent),
                  boxShadow: [
                    // color: Colors.white, //background color of box
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 1.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        1.0, // Move to right 10  horizontally
                        1.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 350,
                      child: Text(
                        "Saturday Duration From",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.satTimeTo}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 350,
                      child: Text(
                        "saturday Duration To",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.satTimeTo}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueAccent),
                  boxShadow: [
                    // color: Colors.white, //background color of box
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 1.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        1.0, // Move to right 10  horizontally
                        1.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 450,
                      child: Text(
                        "Sunday Duration From",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.sunTimeFrom}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 450,
                      child: Text(
                        "Sunday Duration To",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 350,
                      color: Colors.green[50],
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.access_time),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "${data.sunTimeTo}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: StreamBuilder<Response<MypracticeTimeModel>>(
          stream: _bloc.mypracticeTimeDataStream,
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
                  mypracticetimelist = snapshot.data!.data;

                  return SingleChildScrollView(
                      child:
                          Container(child: _jobsListView(mypracticetimelist)));
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

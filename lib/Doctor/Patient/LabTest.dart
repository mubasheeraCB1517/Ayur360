import 'package:ayur360_app/Doctor/bloc/labTestBloc.dart';
import 'package:ayur360_app/Doctor/bloc/prescriptionBloc.dart';
import 'package:ayur360_app/Doctor/models/labTestModel.dart';
import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:ayur360_app/Updater/network/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shimmer.dart';

class LabTestScreen extends StatefulWidget {
  const LabTestScreen({Key? key}) : super(key: key);

  @override
  _LabTestScreenState createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LabTestScreen> {
  late LabTestListBloc _bloc;
  late List<Labtest> labtestlist;

  void initState() {
    super.initState();
    _bloc = LabTestListBloc();
    setState(() {});
  }

  @override
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),

        itemCount: labtestlist.length,
        itemBuilder: (context, index) {
   print("data->>>>>>${data[index].detailsdto}");
          return _tile(  data[index].patientName,
              data[index].patientRegId,data[index].appointmentDate,data[index].doctorName,
            data[index].detailsdto

          );

        });
  }

  SizedBox _tile(String title, String subtitle, String subtitle1, String subtitle2,labtestDetailsDto ) =>

      SizedBox(height: 150,
        child: Card(
          margin: EdgeInsets.only(right: 15,left: 15,top: 10,bottom: 2),
          elevation: 2,


          shape: RoundedRectangleBorder(
              side:  BorderSide(color: Colors.green,width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          shadowColor: Colors.grey,
          child: ListTile(

              title: Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  )),
              subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("${subtitle}",style: TextStyle(color: Colors.red[900],fontSize: 20),),
                Text("${subtitle1}",style: TextStyle(fontSize: 20,color: Colors.black),),
                Text("Prescribed By${subtitle2}",style: TextStyle(fontSize: 20,color: Colors.black),),


              ]),
              onTap: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushNamed(
                      context, RoutesName.LAB_TESTLIST, arguments: labtestDetailsDto);
                });
              }),






        ),
      );


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
                      "Lab Test",
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



      body: StreamBuilder<Response<List<Labtest>>>(
          stream: _bloc.labtestDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("snapshot.data!.data--->${snapshot.data!.data}");
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return LessonViewShimmer(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                  break;
                case Status.SUCCESS:
                  labtestlist = snapshot.data!.data;
                  return SingleChildScrollView(
                      child: Container(
                          color: Colors.white,
                          height: height,
                          child: _jobsListView(labtestlist)));
                  break;
                case Status.ERROR:
                  return Container(
                    color: Colors.yellow,
                  );
              }
            }
            return LessonViewShimmer(

            );
          }),
    );
  }
}
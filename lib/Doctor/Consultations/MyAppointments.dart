
import 'package:ayur360_app/Doctor/bloc/prescriptionBloc.dart';
import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:ayur360_app/Updater/network/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shimmer.dart';
import '../bloc/doctorEventBloc.dart';
import '../bloc/myAppointemntBloc.dart';
import '../models/doctorEventModel.dart';
import '../models/myAppointmentsModel.dart';

class MYAppointmentScreen extends StatefulWidget {
  const MYAppointmentScreen({Key? key}) : super(key: key);

  @override
  _MYAppointmentScreenState createState() => _MYAppointmentScreenState();
}

class _MYAppointmentScreenState extends State<MYAppointmentScreen> {
  int day = 0;
  late MyAppointmentListBloc _bloc;
  late List<myAppointment> appointmentList;
  void initState() {
    super.initState();
    _bloc = MyAppointmentListBloc();
    setState(() {

    });
  }

  @override
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: appointmentList.length,
        itemBuilder: (context, index) {
          //  print("data->>>>>>${data[index].detailsdtos}");
          return _tile(
              data[index].patientName,
              data[index].appointmentDate,

          );
        });
  }

  _tile(
      String patientName,
      String appointmentDate,


      ) =>
      Card(
        margin: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 2),
        elevation: 2,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        shadowColor: Colors.grey,
        child: ListTile(
          // leading: Container(height: 60,width: 60,
          //     child: Image.asset("assets/images/prescription1.png",)),
            title: Text("Appointment for ${patientName} on ${appointmentDate}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.grey[600]
                )),
            trailing:Icon(Icons.video_call_outlined,color: Colors.cyan,size: 34,),

            onTap: () {
              // WidgetsBinding.instance!.addPostFrameCallback((_) {
              //   Navigator.pushNamed(
              //       context, RoutesName.PRESCRIPTION_LISt, arguments: DetailsDto);
              // });
            }),
      );

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () =>  WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.pushNamed(
                  context, RoutesName.DASHBOARD_PAGE, );
              })
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          title: Row(
            children: [
              Container(
                width: width * 0.64,
                height: 30,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                    child: Text(
                      "My Apppointments",
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
      body: StreamBuilder<Response<List<myAppointment>>>(
          stream: _bloc.myAppointmentListDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("snapshot.data!.data--->${snapshot.data!.data}");
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return LessonViewShimmer(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                  break;
                case Status.SUCCESS:
                  appointmentList = snapshot.data!.data;
                  return SingleChildScrollView(
                      child: Container(
                          color: Colors.white,
                          //height: height,
                          child: _jobsListView(appointmentList)));
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




// import 'package:ayur360_app/Doctor/bloc/myAppointemntBloc.dart';
// import 'package:ayur360_app/Doctor/models/myAppointmentsModel.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../Route/route.dart';
// import '../../Updater/network/response.dart';
//
// class MYAppointmentScreen extends StatefulWidget {
//   const MYAppointmentScreen({Key? key}) : super(key: key);
//
//   @override
//   _MYAppointmentScreenState createState() => _MYAppointmentScreenState();
// }
//
// class _MYAppointmentScreenState extends State<MYAppointmentScreen> {
//   late MyAppointmentListBloc _bloc;
//   late List<myAppointment> appointmentList;
//   void initState() {
//     super.initState();
//     _bloc = MyAppointmentListBloc();
//     setState(() {
//
//     });
//   }
//   @override
//
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     TextEditingController SearchController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//           elevation: 0,
//           centerTitle: true,
//           leading: IconButton(
//               icon: Icon(Icons.arrow_back, color: Colors.black),
//               onPressed: () =>  WidgetsBinding.instance!.addPostFrameCallback((_) {
//                 Navigator.pushNamed(
//                   context, RoutesName.DASHBOARD_PAGE, );
//               })
//           ),
//           backgroundColor: Colors.green[900],
//           iconTheme: const IconThemeData(color: Colors.black),
//           title: Row(
//             children: [
//               Container(
//                 width: width * 0.64,
//                 height: 30,
//                 margin: const EdgeInsets.only(left: 4.1),
//                 child: Center(
//                     child: Text(
//                   "MY APPOINTMENTS",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 27,
//                       fontWeight: FontWeight.bold),
//                 )),
//               ),
//               SizedBox(
//                 width: 27,
//               ),
//             ],
//           ),
//           actions: <Widget>[Image.asset("assets/images/ayurlogo.png")]),
//     body: StreamBuilder<Response<List<myAppointment>>>(
//     stream: _bloc.myAppointmentListDataStream,
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         print("snapshot.data!.data--->${snapshot.data!.data}");
//         switch (snapshot.data!.status) {
//           case Status.LOADING:
//             return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
//             break;
//           case Status.SUCCESS:
//             appointmentList = snapshot.data!.data;
//             return  Column(
//               children: [
//                 Container(
//                //   height: height,
//                   width: width,
//                   color: Colors.green[50],
//                   child: Stack(
//                     children: [
//                       Positioned(
//                           top: 8,
//                           left: 10,
//                           //  bottom: 10,
//
//                           child: Container(
//                             width: width * 0.96,
//                             height: 42,
//                             color: Colors.white,
//                             child: TextField(controller: SearchController,
//
//                               keyboardType: TextInputType.text,
//
//                               showCursor: true,
//
//
//
//                               decoration: InputDecoration(
//                                 hintText: 'Search',
//
//                                 prefixIcon: Icon(Icons.search),
//                                 contentPadding:
//                                 EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 5.0),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(5.0),
//                                     borderSide: BorderSide(color: Colors.grey)),
//                               ),
//                             ),
//                           )),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Container(
//                           margin: EdgeInsets.only(top: 60),
//                           // color: Colors.white,
//                           child: DataTable(
//                             columns: const <DataColumn>[
//                               DataColumn(
//                                 label: Text(
//                                   'S.No',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold, fontSize: 19),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Booking',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold, fontSize: 19),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Action',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold, fontSize: 19),
//                                 ),
//                               ),
//                             ],
//                             rows:
//                             appointmentList // Loops through dataColumnText, each iteration assigning the value to element
//                                 .map(
//                               ((element) => DataRow (
//
//                                 cells: <DataCell>[
//                                   DataCell(Text("${element.slno}"),
//                                   ),
//                                   DataCell(Text("Appointment for ${element.patientName} on ${element.appointmentDate}"),
//                                     //Extracting from Map element the value
//                                   ),
//
//                                   DataCell(Center(child: Icon(Icons.video_call_outlined)),
//                                     //Extracting from Map element the value
//                                   ),
//                                 ],
//                               )),
//                             )
//                                 .toList(),
//
//
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             );
//             break;
//           case Status.ERROR:
//             return Container();
//         }
//
//
//       }
//       return Container();
//
//     }
//
//
//
//       )
//     );
//
//   }
//
// }

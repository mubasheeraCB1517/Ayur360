//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../../Updater/network/response.dart';
// import '../../shimmer.dart';
// import '../bloc/appointmentTimeZoneBloc.dart';
// import '../models/appointemntTimeaSlotsModel.dart';
// DateTime selectedDate = DateTime.now();
// String formattedDate ="";
// class datepicker extends StatefulWidget {
//   datepicker({Key? key, required this.date,}) : super(key: key);
//   late final  date;
//   @override
//   _datepickerState createState()
//   {
//     return _datepickerState();
//   }
// }
//
// class _datepickerState extends State<datepicker> {
//   //String date = "";
//
//   @override
//
//
//
//   late AppointmentTimeZoneBloc _bloc;
//   late List<AppointmentTimeZoneModel> prescriptiontimelist;
//   List<AppointmentTimeZoneModel> timelist = [];
//   List<String> list = [];
//
//   void initState() {
//     super.initState();
//     _bloc = AppointmentTimeZoneBloc(widget.date);
//     setState(() {});
//   }
//
//   int id = 0;
//   String MySelection = "";
//   int prescriptionid = 0;
//       Widget build(BuildContext context) {
//       double width = MediaQuery.of(context).size.width;
//       String datefrom;
//       return StreamBuilder<Response<List<AppointmentTimeZoneModel>>>(
//             stream: _bloc.TimeZoneDataStream,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 print("snapshot.data!.data--->${snapshot.data!.data}");
//                 switch (snapshot.data!.status) {
//                   case Status.LOADING:
//                     return LessonViewShimmer(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
//                     break;
//                   case Status.SUCCESS:
//                     prescriptiontimelist = snapshot.data!.data;
//
//                     print(
//                         "prescriptiontimelist->>>>>>>>>>>${prescriptiontimelist.length}");
//                     print("s->>>>>>>>>>>${prescriptiontimelist[0].slotes}");
//                     return SingleChildScrollView(
//                       child: StatefulBuilder(builder: (context, setState) {
//                         DateTime date;
//                         String checkin = "";
//
//                         return Column(children: [
//
//
//
//
//
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       setState((){
//                                         _selectDate(context);
//                                       });
//
//                                     },
//                                     child: Text("Choose Date"),
//                                   ),
//                                   Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
//
//                           SizedBox(
//                             height: 40,
//                           ),
//                           ListView.builder(
//                               itemCount: prescriptiontimelist.length == null
//                                   ? 0
//                                   : prescriptiontimelist.length,
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemBuilder: (BuildContext context, int index) {
//                                 print(
//                                     "timelist->>>>>>>${prescriptiontimelist.length}");
//                                 return Column(
//                                   children: <Widget>[
//                                     Container(
//                                       height: 60,
//                                       width: 400,
//                                       child: Card(
//                                         elevation: 10,
//                                         //   color: Colors.red,
//                                         margin:
//                                         EdgeInsets.only(left: 10, right: 10),
//                                         child: ListTile(
//                                           title: Center(
//                                             child: Container(
//                                               width: 300,
//                                               height: 30,
//                                               decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                       color: Colors.blue)),
//                                               child: Center(
//                                                 child: Text(
//                                                   "   ${prescriptiontimelist[index].slotes}",
//                                                   style: TextStyle(
//                                                       fontSize: 20,
//                                                       color: Colors.red[900],
//                                                       fontWeight:
//                                                       FontWeight.bold),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Divider()
//                                   ],
//                                 );
//                               })
//                         ]);
//                       }),
//                     );
//                     break;
//                   case Status.ERROR:
//                     return Container(
//                       color: Colors.yellow,
//                     );
//                 }
//               }
//               return LessonViewShimmer();
//             });
//
//     }
//
//
//
//
//
//
//   //
//   //
//   //
//   // }
// //
//   _selectDate(BuildContext context) async {
//     final DateTime? selected = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2010),
//       lastDate: DateTime(2025),
//     );
//     if (selected != null && selected != selectedDate)
//       setState(() {
//
//          formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
//          selectedDate = selected;
//         _bloc = AppointmentTimeZoneBloc(formattedDate);
//
//
//    // widget.date = selectedDate;
//         print("selcted->>>>>>>${ formattedDate}");
//       });
//   }
// }

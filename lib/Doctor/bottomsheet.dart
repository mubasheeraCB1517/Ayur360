import 'package:ayur360_app/Doctor/repositories/LeaveReportCreationRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomsheetEvent extends StatefulWidget {
  const BottomsheetEvent({Key? key}) : super(key: key);

  @override
  _BottomsheetEventState createState() => _BottomsheetEventState();
}

TextEditingController reasonController = TextEditingController();
TextEditingController leavedateController = TextEditingController();
TextEditingController durationfromController = TextEditingController();
TextEditingController durationtoController = TextEditingController();

class _BottomsheetEventState extends State<BottomsheetEvent> {
  @override
  bool valuefirsrt = false;
  bool viewVisible = false;
  bool viewVisible1 = true;

  void hideWidget() {
    setState(() {
      viewVisible = !viewVisible;
      print(viewVisible);
    });
  }

  showWidget() {
    setState(() {
      viewVisible = !viewVisible1;
      print(viewVisible);
    });
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return SingleChildScrollView(
          child: Container(
        height: 600,
        //margin: EdgeInsets.only(bottom: 100.0),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 60,
                width: width,
                color: Colors.green[900],
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 10),
                  child: Row(children: [
                    Text(
                      "CREATE LEAVE",
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                    SizedBox(
                      width: 250,
                    ),
                    Text(
                      "X",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    )
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, right: 310),
                child: Text(
                  "Reason",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 19),
                width: width * 0.80,
                child: TextField(
                  controller: reasonController,
                  autofocus: false,
                  style: TextStyle(fontSize: 17.0, color: Color(0xFFbdc6cf)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                  ),
                ),
              ),
              Row(children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Leave Date",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 170),
                  child: Text(
                    "Full Day",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  width: width * 0.50,
                  child: TextField(
                    controller: leavedateController,
                    autofocus: false,
                    style: TextStyle(fontSize: 17.0, color: Color(0xFFbdc6cf)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(left: 70),
                  child: Transform.scale(
                    scale: 2.0,
                    child: Checkbox(
                      checkColor: Colors.greenAccent,
                      //activeColor: Colors.red,
                      value: this.valuefirsrt,
                      onChanged: (bool? value) {
                        setState(() {
                          viewVisible = true;
                          this.valuefirsrt = value!;
                        });
                      },
                    ),
                  ),
                )
              ]),
              viewVisible == false
                  ? Column(children: [
                      Row(children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 30),
                          child: Text(
                            "Duration From",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 100),
                          child: Text(
                            "Duration To",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          width: width * 0.40,
                          child: TextField(
                            controller: durationfromController,
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 17.0, color: Color(0xFFbdc6cf)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          width: width * 0.40,
                          child: TextField(
                            controller: durationtoController,
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 17.0, color: Color(0xFFbdc6cf)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                            ),
                          ),
                        ),
                      ]),
                    ])
                  : SizedBox(
                      height: 0,
                    ),
              SizedBox(
                height: 160,
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red[900],
                    ),
                    margin: EdgeInsets.only(left: 70),
                    child: Center(
                        child: GestureDetector(
                          onTap: (){
                            LeaveReportRepository();
                            print("sdfgh");
                          },
                            child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 35,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green[900],
                    ),
                    margin: EdgeInsets.only(left: 20),
                    child: Center(
                        child: Text(
                      "Close",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                  ),
                ],
              )
            ],
          ),
        ),
      ));
    });
  }
}
// class Durationwidgets extends StatefulWidget {
//   const Durationwidgets({Key? key}) : super(key: key);
//
//   @override
//   _DurationwidgetsState createState() => _DurationwidgetsState();
// }
//
// class _DurationwidgetsState extends State<Durationwidgets> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return  Visibility(visible: true,
//       child: Column(
//         children: [Row(children: [
//           Container(
//             margin: EdgeInsets.only(top: 20, left: 30),
//             child: Text(
//               "Duration From",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 20, left: 100),
//             child: Text(
//               "Duration To",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//         ]),
//
//
//
//           SizedBox(
//             height: 10,
//           ),
//           Row(children: [
//             Container(
//               margin: EdgeInsets.only(left: 30),
//               width: width * 0.40,
//               child: TextField(
//                 autofocus: false,
//                 style: TextStyle(fontSize: 17.0, color: Color(0xFFbdc6cf)),
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   contentPadding: const EdgeInsets.only(
//                       left: 14.0, bottom: 8.0, top: 8.0),
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 30),
//               width: width * 0.40,
//               child: TextField(
//                 autofocus: false,
//                 style: TextStyle(fontSize: 17.0, color: Color(0xFFbdc6cf)),
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   contentPadding: const EdgeInsets.only(
//                       left: 14.0, bottom: 8.0, top: 8.0),
//                 ),
//               ),
//             ),
//           ]),
//
//         ],
//       ),
//     );
//   }
// }

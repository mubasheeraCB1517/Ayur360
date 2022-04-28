import 'package:ayur360_app/Doctor/bloc/patientAppointmentBloc.dart';
import 'package:ayur360_app/Doctor/models/patientMyAppointmentModel.dart';
import 'package:ayur360_app/Route/route.dart';
import 'package:ayur360_app/Updater/network/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentlIstScreen extends StatefulWidget {
  const AppointmentlIstScreen({Key? key}) : super(key: key);

  @override
  _AppointmentlIstScreenState createState() => _AppointmentlIstScreenState();
}

class _AppointmentlIstScreenState extends State<AppointmentlIstScreen> {
  late PatientAppointmentListBloc _bloc;

  List<patientappointment> patientappointmentsearchdata = [];
  List<patientappointment> patientappointmentserachlist = [];
  TextEditingController patientappointmentController = TextEditingController();

  void initState() {
    super.initState();
    _bloc = PatientAppointmentListBloc();

    setState(() {});
  }

  onSearchTextChanged(String text) async {
    patientappointmentserachlist.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    patientappointmentsearchdata.forEach((data) {
      if (data.patientName!.toLowerCase().contains(text) ||
          data.patientName!.contains(text))
        patientappointmentserachlist.add(data);
    });

    setState(() {});
  }

  @override
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data.length}");
          return _tile(data[index].patientName, data[index].appointmentDate,
              data[index].patientId, data[index].appointmentId);
        });
  }

  SizedBox _tile(
          String title, String subtitle, int detailsiD, int appointmentId) =>
      SizedBox(
          height: 91,
          child: Card(
            margin: EdgeInsets.only(
              right: 15,
              left: 15,
              top: 10,
            ),
            elevation: 2,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.green, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            shadowColor: Colors.grey,
            child: ListTile(
                trailing: GestureDetector(
                    onTap: () {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pushNamed(
                          context,
                          RoutesName.APPOINTMENT_LISTEDIT,
                          arguments: [appointmentId, detailsiD],

                        );
                      });
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.red[900],
                    )),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Appointment for ${title} on ${subtitle}",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      )),

                ),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(appointmentId.toString())
                ]),
                onTap: () {}),
          ));

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController AppointmentSearchController = TextEditingController();
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
                    "APPOINTMENTS",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(
                  width: 27,
                ),
              ],
            ),
            actions: <Widget>[Image.asset("assets/images/ayurlogo.png")]),
        body: StreamBuilder<Response<List<patientappointment>>>(
            stream: _bloc.patientAppointmentListDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("sdfghjk");
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                    break;
                  case Status.SUCCESS:
                    List<patientappointment> patientappointmentList =
                        snapshot.data!.data;
                    patientappointmentsearchdata = patientappointmentList;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 370,

                              color: Colors.white,
                              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.all(15),
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Material(
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Expanded(
                                        child: TextField(
                                            controller:
                                                patientappointmentController,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                  left: 80,
                                                ),
                                                prefixIcon: Icon(Icons.search),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black54,
                                                        width: 32.0),
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(5.0)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black54,
                                                                width: 32.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    25.0))),
                                            onChanged: onSearchTextChanged),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          patientappointmentserachlist.length != 0 ||
                                  patientappointmentController.text.isNotEmpty
                              ? _jobsListView(patientappointmentserachlist)
                              : _jobsListView(patientappointmentsearchdata)
                        ],
                      ),
                    );

                    break;
                  case Status.ERROR:
                    return Container();
                }
              }
              return Container();
            }));
  }
}

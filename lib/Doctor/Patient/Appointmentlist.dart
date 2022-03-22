
import 'package:ayur360_app/Doctor/bloc/patientAppointmentBloc.dart';
import 'package:ayur360_app/Doctor/models/patientMyAppointmentModel.dart';
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
  late List<patientappointment> patientappointmentList;
  void initState() {
    super.initState();
    _bloc = PatientAppointmentListBloc();

    setState(() {

    });
  }
  @override
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),

        itemCount: patientappointmentList.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${patientappointmentList.length}");
          return _tile(  data[index].patientName,
              data[index].appointmentDate,
          );

        });
  }

  SizedBox _tile(String title, String subtitle, ) =>

      SizedBox(height: 91,
  child: Card(
  margin: EdgeInsets.only(right: 15,left: 15,top: 10,),
  elevation: 2,


  shape: RoundedRectangleBorder(
  side:  BorderSide(color: Colors.green,width: 3),
  borderRadius: BorderRadius.all(Radius.circular(15))
  ),
  shadowColor: Colors.grey,
  child: ListTile(
trailing: Icon(Icons.edit,color: Colors.red[900],),
  title: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text("Appointment for ${title} on ${subtitle}",
    style: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 20,
    )),
  ),
  subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [



  ]),
  onTap: () {
  // WidgetsBinding.instance!.addPostFrameCallback((_) {
  // Navigator.pushNamed(
  // context, RoutesName.PRESCRIPTION_LISt, arguments: DetailsDto);
  // });
  }),

  ));

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController  AppointmentSearchController = TextEditingController();
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
                print("snapshot.data!.data--->${snapshot.data!.data}");
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                    break;
                  case Status.SUCCESS:
                    patientappointmentList = snapshot.data!.data;
                    return SingleChildScrollView(
                        child: Container(
                            color: Colors.white,
                            height: height,
                            child: _jobsListView(patientappointmentList)));

                    break;
                  case Status.ERROR:
                    return Container();
                }


              }
              return Container();

            }



        )
    );
  }
}

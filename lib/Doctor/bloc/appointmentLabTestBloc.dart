import 'dart:async';
import 'package:ayur360_app/Doctor/repositories/appointmentLabTestRepositories.dart';
import 'package:ayur360_app/Updater/network/response.dart';
import '../models/appointmentLabTestModel.dart';


class AppointmentLabTestDetailsBloc {
  AppointmentLabTestDetailsRepository _appointmentlabtestDetailsRepository =
      new AppointmentLabTestDetailsRepository();
  final _appointementlabtestdetailsListDataCntroller =
      StreamController<Response<List<AppointemntLabTestModel>>>();

  StreamSink<Response<List<AppointemntLabTestModel>>>
      get appointmentlabtestDetailsDataSink =>
          _appointementlabtestdetailsListDataCntroller.sink;

  Stream<Response<List<AppointemntLabTestModel>>>
      get appointmentlabtestDetailsStream =>
          _appointementlabtestdetailsListDataCntroller.stream;

  AppointmentLabTestDetailsBloc() {
    _appointmentlabtestDetailsRepository =
        AppointmentLabTestDetailsRepository();
    getappointemntlabList();
    print("fsfds");
  }

  getappointemntlabList() async {
    appointmentlabtestDetailsDataSink.add(Response.loading('Fetching...'));
    try {
      List<AppointemntLabTestModel> _appointmentEditDetailsList =
          await _appointmentlabtestDetailsRepository
              .getAppointmentLabTestEditDetails();
      appointmentlabtestDetailsDataSink
          .add(Response.success(_appointmentEditDetailsList));
    } catch (e) {
      appointmentlabtestDetailsDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _appointementlabtestdetailsListDataCntroller.close();
  }
}

import 'dart:async';

import 'package:ayur360_app/Doctor/models/appointemntEditDateDetailsModel.dart';
import 'package:ayur360_app/Doctor/repositories/appointmentdateDetailsRepositories.dart';
import 'package:ayur360_app/Updater/network/response.dart';

class AppointmentDateEditDetailsBloc {
  AppointmentDateEditDetailsRepository _appointmentDateEditDetailsRepository =
      new AppointmentDateEditDetailsRepository();
  final _appointementdateEditdetailsListDataCntroller =
      StreamController<Response<AppointementdateDetailsModel>>();

  StreamSink<Response<AppointementdateDetailsModel>>
      get appointmentdateEditDetailsDataSink =>
          _appointementdateEditdetailsListDataCntroller.sink;

  Stream<Response<AppointementdateDetailsModel>>
      get appointmentdateEditDetailsStream =>
          _appointementdateEditdetailsListDataCntroller.stream;

  AppointmentDateEditDetailsBloc(int id) {
    _appointmentDateEditDetailsRepository =
        AppointmentDateEditDetailsRepository();
    getappointemntdateEditList(id);
    print("fsfds");
  }

  getappointemntdateEditList(int id) async {
    appointmentdateEditDetailsDataSink.add(Response.loading('Fetching...'));
    try {
      AppointementdateDetailsModel _appointmentdateEditDetailsList =
          await _appointmentDateEditDetailsRepository
              .getAppointmentDateEditDetails(id);
      appointmentdateEditDetailsDataSink
          .add(Response.success(_appointmentdateEditDetailsList));
    } catch (e) {
      appointmentdateEditDetailsDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _appointementdateEditdetailsListDataCntroller.close();
  }
}

import 'dart:async';
import 'package:ayur360_app/Doctor/repositories/appointementEditDetailsRepositories.dart';
import 'package:ayur360_app/Updater/network/response.dart';
import '../models/appointmentEditDetailsModel.dart';

class AppointmentEditDetailsBloc {
  AppointmentEditDetailsRepository _appointmentEditDetailsRepository =
      new AppointmentEditDetailsRepository();
  final _appointementEditdetailsListDataCntroller =
      StreamController<Response<AppointmentDetailsModel>>();

  StreamSink<Response<AppointmentDetailsModel>>
      get appointmentEditDetailsDataSink =>
          _appointementEditdetailsListDataCntroller.sink;

  Stream<Response<AppointmentDetailsModel>> get appointmentEditDetailsStream =>
      _appointementEditdetailsListDataCntroller.stream;

  AppointmentEditDetailsBloc(int id) {
    _appointmentEditDetailsRepository = AppointmentEditDetailsRepository();
    getappointemntEditList(id);
    print("fsfds");
  }

  getappointemntEditList(int id) async {
    appointmentEditDetailsDataSink.add(Response.loading('Fetching...'));
    try {
      AppointmentDetailsModel _appointmentEditDetailsList =
          await _appointmentEditDetailsRepository
              .getAppointmentEditDetails(id);
      appointmentEditDetailsDataSink
          .add(Response.success(_appointmentEditDetailsList));
    } catch (e) {
      appointmentEditDetailsDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _appointementEditdetailsListDataCntroller.close();
  }
}

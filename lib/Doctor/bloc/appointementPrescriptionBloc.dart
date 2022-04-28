import 'dart:async';
import 'package:ayur360_app/Doctor/models/appointementPrescriptionModel.dart';
import 'package:ayur360_app/Doctor/repositories/appointmentPrescriptionsRespository.dart';
import 'package:ayur360_app/Updater/network/response.dart';

class AppointementPrescriptionBloc {
  AppointmentPrescriptionDetailsRepository
      _appointmentprescriptionDetailsRepository =
      new AppointmentPrescriptionDetailsRepository();
  final _appointementprescriptiondetailsListDataCntroller =
      StreamController<Response<List<AppointmentPrescriptionModel>>>();

  StreamSink<Response<List<AppointmentPrescriptionModel>>>
      get appointmentprescriptionDetailsDataSink =>
          _appointementprescriptiondetailsListDataCntroller.sink;

  Stream<Response<List<AppointmentPrescriptionModel>>>
      get appointmentprescriptionDetailsStream =>
          _appointementprescriptiondetailsListDataCntroller.stream;

  AppointementPrescriptionBloc() {
    _appointmentprescriptionDetailsRepository =
        AppointmentPrescriptionDetailsRepository();
    getappointemntprescription();
    print("fsfds");
  }

  getappointemntprescription() async {
    appointmentprescriptionDetailsDataSink.add(Response.loading('Fetching...'));
    try {
      List<AppointmentPrescriptionModel>
          _appointmentprescriptionEditDetailsList =
          await _appointmentprescriptionDetailsRepository
              .getAppointmentprescriptionsEditDetails();
      appointmentprescriptionDetailsDataSink
          .add(Response.success(_appointmentprescriptionEditDetailsList));
    } catch (e) {
      appointmentprescriptionDetailsDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _appointementprescriptiondetailsListDataCntroller.close();
  }
}

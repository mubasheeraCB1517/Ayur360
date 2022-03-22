
import 'dart:async';


import 'package:ayur360_app/Doctor/models/patientMyAppointmentModel.dart';
import 'package:ayur360_app/Updater/network/response.dart';


import '../models/myAppointmentsModel.dart';
import '../repositories/myAppointmentRepository.dart';
import '../repositories/patientAppointmentRepository.dart';

class PatientAppointmentListBloc {
  PatientAppointmentListRepository _patientAppointemntListRepository= new PatientAppointmentListRepository();
  final _patientAppointmentListDataController= StreamController<Response<List<patientappointment>>>();

  StreamSink<Response<List<patientappointment>>> get patientAppointmentListDataSink =>
      _patientAppointmentListDataController.sink;

  Stream<Response<List<patientappointment>>>? get patientAppointmentListDataStream =>
      _patientAppointmentListDataController.stream;

  PatientAppointmentListBloc() {
    _patientAppointemntListRepository = PatientAppointmentListRepository();
    getAppointmentLists();
  }

  getAppointmentLists() async {
    patientAppointmentListDataSink.add(Response.loading('Fetching...'));
    try {
      List<patientappointment> _patientAppointmentList = await _patientAppointemntListRepository.getpatientAppointmentList();
      patientAppointmentListDataSink.add(Response.success(_patientAppointmentList));
    } catch (e) {
      patientAppointmentListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _patientAppointmentListDataController.close();
  }
}
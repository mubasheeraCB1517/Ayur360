import 'dart:async';

import 'package:ayur360_app/Doctor/models/appointemntTimeaSlotsModel.dart';
import 'package:ayur360_app/Doctor/models/patientAppointementListModel.dart';
import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/Doctor/repositories/patientAppointmentListingRepositories.dart';
import 'package:ayur360_app/Doctor/repositories/patientAppointmentRepository.dart';
import 'package:ayur360_app/Doctor/repositories/prescriptionRepository.dart';
import 'package:ayur360_app/Updater/network/response.dart';

import '../models/myAppointmentsModel.dart';
import '../repositories/appointmentTimeSlotsRepositories.dart';
import '../repositories/myAppointmentRepository.dart';

class PatientAppointemntSaveListBloc {
  PatientAppointmentsaveListRepository _patientAppointmentSaveRepository = new PatientAppointmentsaveListRepository();
  final _patientAppointmentSaveDataController =
  StreamController<Response<PatientAppointmentList>>();

  StreamSink<Response<PatientAppointmentList>> get patientAppointmentSaveDataSink =>
      _patientAppointmentSaveDataController.sink;

  Stream<Response<PatientAppointmentList>> get patientAppointmentSaveDataStream =>
      _patientAppointmentSaveDataController.stream;

  PatientAppointemntSaveListBloc(appId) {
    _patientAppointmentSaveRepository = PatientAppointmentsaveListRepository();
    getpatientAppointmentSaveList( appId);
    print("fsfds");
  }

  getpatientAppointmentSaveList(int appId) async {
    patientAppointmentSaveDataSink.add(Response.loading('Fetching...'));
    try {
      PatientAppointmentList _patientAppointementSave =
      await _patientAppointmentSaveRepository.getAppointsaveListing(appId,);
      patientAppointmentSaveDataSink.add(Response.success(_patientAppointementSave));
    } catch (e) {
      patientAppointmentSaveDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _patientAppointmentSaveDataController.close();
  }
}

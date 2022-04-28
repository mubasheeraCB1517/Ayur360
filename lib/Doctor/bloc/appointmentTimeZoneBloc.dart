import 'dart:async';

import 'package:ayur360_app/Doctor/models/appointemntTimeaSlotsModel.dart';
import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/Doctor/repositories/prescriptionRepository.dart';
import 'package:ayur360_app/Updater/network/response.dart';

import '../models/myAppointmentsModel.dart';
import '../repositories/appointmentTimeSlotsRepositories.dart';
import '../repositories/myAppointmentRepository.dart';

class AppointmentTimeZoneBloc {
  TimeSlotsRepository _timeSlotsRepository = new TimeSlotsRepository();
  final _timezoneListDataController =
      StreamController<Response<List<AppointmentTimeZoneModel>>>();

  StreamSink<Response<List<AppointmentTimeZoneModel>>> get TimeZoneDataSink =>
      _timezoneListDataController.sink;

  Stream<Response<List<AppointmentTimeZoneModel>>>? get TimeZoneDataStream =>
      _timezoneListDataController.stream;

  AppointmentTimeZoneBloc(String formattedDate) {
    _timeSlotsRepository = TimeSlotsRepository();
    getprescriptionList();
    print("fsfds");
  }

  getprescriptionList() async {
    TimeZoneDataSink.add(Response.loading('Fetching...'));
    try {
      List<AppointmentTimeZoneModel> _TimeList =
          await _timeSlotsRepository.getTimeZone();
      TimeZoneDataSink.add(Response.success(_TimeList));
    } catch (e) {
      TimeZoneDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _timezoneListDataController.close();
  }
}

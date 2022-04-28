import 'dart:async';

import 'package:ayur360_app/Doctor/models/doctorEventModel.dart';
import 'package:ayur360_app/Doctor/repositories/doctorEventepository.dart';
import 'package:ayur360_app/Updater/network/response.dart';

class DoctorEventListBloc {
  DoctorEventRepository _doctorEventListRepository =
      new DoctorEventRepository();
  final _doctorEvntListDataController =
      StreamController<Response<List<doctorEventmodel>>>();

  StreamSink<Response<List<doctorEventmodel>>> get doctoreventListDataSink =>
      _doctorEvntListDataController.sink;

  Stream<Response<List<doctorEventmodel>>>? get doctorEventListDataStream =>
      _doctorEvntListDataController.stream;

  DoctorEventListBloc() {
    _doctorEventListRepository = DoctorEventRepository();
    getdoctoreventLists();
  }

  getdoctoreventLists() async {
    doctoreventListDataSink.add(Response.loading('Fetching...'));
    try {
      List<doctorEventmodel> _doctorEVENTList =
          await _doctorEventListRepository.getDoctoreventList();
      doctoreventListDataSink.add(Response.success(_doctorEVENTList));
    } catch (e) {
      doctoreventListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _doctorEvntListDataController.close();
  }
}

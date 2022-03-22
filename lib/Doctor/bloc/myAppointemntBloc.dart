
import 'dart:async';


import 'package:ayur360_app/Updater/network/response.dart';


import '../models/myAppointmentsModel.dart';
import '../repositories/myAppointmentRepository.dart';

class MyAppointmentListBloc {
  MyAppointmentListRepository _myAppointemntListRepository= new MyAppointmentListRepository();
  final _myAppointmentListDataController= StreamController<Response<List<myAppointment>>>();

  StreamSink<Response<List<myAppointment>>> get MyAppointmentListDataSink =>
      _myAppointmentListDataController.sink;

  Stream<Response<List<myAppointment>>>? get myAppointmentListDataStream =>
      _myAppointmentListDataController.stream;

  MyAppointmentListBloc() {
    _myAppointemntListRepository = MyAppointmentListRepository();
    getAppointmentLists();
  }

  getAppointmentLists() async {
    MyAppointmentListDataSink.add(Response.loading('Fetching...'));
    try {
      List<myAppointment> _myAppointmentList = await _myAppointemntListRepository.getAppointmentList();
      MyAppointmentListDataSink.add(Response.success(_myAppointmentList));
    } catch (e) {
      MyAppointmentListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _myAppointmentListDataController.close();
  }
}
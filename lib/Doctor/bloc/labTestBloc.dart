
import 'dart:async';


import 'package:ayur360_app/Doctor/models/labTestModel.dart';
import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/Doctor/repositories/labTestRepositories.dart';
import 'package:ayur360_app/Doctor/repositories/prescriptionRepository.dart';
import 'package:ayur360_app/Updater/network/response.dart';


import '../models/myAppointmentsModel.dart';
import '../repositories/myAppointmentRepository.dart';

class LabTestListBloc {
  LabtestRepository _labtestListRepository= new LabtestRepository();
  final _labTestListDataController= StreamController<Response<List<Labtest>>>();

  StreamSink<Response<List<Labtest>>> get labListDataSink =>
      _labTestListDataController.sink;

  Stream<Response<List<Labtest>>>? get labtestDataStream =>
      _labTestListDataController.stream;

  LabTestListBloc() {
    _labtestListRepository = LabtestRepository();
    getlabList();
    print("fsfds");
  }


  getlabList() async {
    labListDataSink.add(Response.loading('Fetching...'));
    try {
      List<Labtest> _PrescriptionList = await _labtestListRepository.getlabTest();
      labListDataSink.add(Response.success(_PrescriptionList));
    } catch (e) {
      labListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _labTestListDataController.close();
  }
}

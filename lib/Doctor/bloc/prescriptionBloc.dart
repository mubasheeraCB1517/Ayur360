import 'dart:async';

import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/Doctor/repositories/prescriptionRepository.dart';
import 'package:ayur360_app/Updater/network/response.dart';

class PrescriptionListBloc {
  PrescriptionRepository _prescriptionListRepository =
      new PrescriptionRepository();
  final _prescriptionListDataController =
      StreamController<Response<List<prescription>>>();

  StreamSink<Response<List<prescription>>> get prescriptionListDataSink =>
      _prescriptionListDataController.sink;

  Stream<Response<List<prescription>>>? get prescriptionDataStream =>
      _prescriptionListDataController.stream;

  PrescriptionListBloc() {
    _prescriptionListRepository = PrescriptionRepository();
    getprescriptionList();
    print("fsfds");
  }

  getprescriptionList() async {
    prescriptionListDataSink.add(Response.loading('Fetching...'));
    try {
      List<prescription> _PrescriptionList =
          await _prescriptionListRepository.getprescription();
      prescriptionListDataSink.add(Response.success(_PrescriptionList));
    } catch (e) {
      prescriptionListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _prescriptionListDataController.close();
  }
}

import 'dart:async';

import 'package:ayur360_app/Doctor/models/clinicalNotesModel.dart';
import 'package:ayur360_app/Doctor/models/labTestModel.dart';
import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/Doctor/repositories/clinicalNotesRepositories.dart';
import 'package:ayur360_app/Doctor/repositories/labTestRepositories.dart';
import 'package:ayur360_app/Doctor/repositories/prescriptionRepository.dart';
import 'package:ayur360_app/Updater/network/response.dart';

import '../models/myAppointmentsModel.dart';
import '../repositories/myAppointmentRepository.dart';

class ClinicalTestListBloc {
  ClinicalTestRepository _clinicaltestListRepository =
      new ClinicalTestRepository();
  final _clinicalTestListDataController =
      StreamController<Response<List<ClinicalTestModel>>>();

  StreamSink<Response<List<ClinicalTestModel>>> get clinicaltestListDataSink =>
      _clinicalTestListDataController.sink;

  Stream<Response<List<ClinicalTestModel>>>? get clinicaltestDataStream =>
      _clinicalTestListDataController.stream;

  ClinicalTestListBloc() {
    _clinicaltestListRepository = ClinicalTestRepository();
    getclinalList();
    print("fsfds");
  }

  getclinalList() async {
    clinicaltestListDataSink.add(Response.loading('Fetching...'));
    try {
      List<ClinicalTestModel> _PrescriptionList =
          await _clinicaltestListRepository.getClinicalTest();
      clinicaltestListDataSink.add(Response.success(_PrescriptionList));
    } catch (e) {
      clinicaltestListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _clinicalTestListDataController.close();
  }
}

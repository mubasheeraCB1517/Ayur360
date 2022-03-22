
import 'dart:async';


import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/Doctor/models/vitalSignMode.dart';
import 'package:ayur360_app/Doctor/repositories/prescriptionRepository.dart';
import 'package:ayur360_app/Doctor/repositories/vitalSignRepositories.dart';
import 'package:ayur360_app/Updater/network/response.dart';



class VitalSignBloc {
  VitalSignRepository _vitalsignRepository= new VitalSignRepository();
  final _vitalsignDataController= StreamController<Response<List<VitalSignModel>>>();

  StreamSink<Response<List<VitalSignModel>>> get vitalsignListDataSink =>
      _vitalsignDataController.sink;

  Stream<Response<List<VitalSignModel>>>? get vitalsignDataStream =>
      _vitalsignDataController.stream;

  VitalSignBloc() {
    _vitalsignRepository = VitalSignRepository();
    getvitalsignList();
    print("fsfds");
  }


  getvitalsignList() async {
    vitalsignListDataSink.add(Response.loading('Fetching...'));
    try {
      List<VitalSignModel> _vitallist = await _vitalsignRepository.getVitalsign();
      vitalsignListDataSink.add(Response.success(_vitallist));
    } catch (e) {
      vitalsignListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _vitalsignDataController.close();
  }
}
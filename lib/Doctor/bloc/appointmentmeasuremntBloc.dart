import 'dart:async';

import 'package:ayur360_app/Doctor/models/appointmentmeasurmentofmedicieModel.dart';
import 'package:ayur360_app/Doctor/models/labTestModel.dart';
import 'package:ayur360_app/Doctor/models/leaveReportEditingModel.dart';
import 'package:ayur360_app/Doctor/models/myPracticeTimeModel.dart';
import 'package:ayur360_app/Doctor/models/myProfileModel.dart';
import 'package:ayur360_app/Doctor/models/prescriptionModel.dart';
import 'package:ayur360_app/Doctor/repositories/LeaveReportCreationRepository.dart';
import 'package:ayur360_app/Doctor/repositories/MypracticeTimeRepositories.dart';
import 'package:ayur360_app/Doctor/repositories/appoinmentMeasurmentRepositories.dart';
import 'package:ayur360_app/Doctor/repositories/appointementEditDetailsRepositories.dart';
import 'package:ayur360_app/Doctor/repositories/appointmentLabTestRepositories.dart';
import 'package:ayur360_app/Doctor/repositories/labTestRepositories.dart';
import 'package:ayur360_app/Doctor/repositories/leaveReportEditingRepositories.dart';
import 'package:ayur360_app/Doctor/repositories/myProfileRepositories.dart';
import 'package:ayur360_app/Doctor/repositories/prescriptionRepository.dart';
import 'package:ayur360_app/Updater/network/response.dart';

import '../models/appointmentEditDetailsModel.dart';
import '../models/appointmentLabTestModel.dart';
import '../models/myAppointmentsModel.dart';
import '../repositories/myAppointmentRepository.dart';

class AppointmentMeasurmentDetailsBloc {
  AppointmentMeasurmentDetailsRepository
      _appointmentmeasurmentDetailsRepository =
      new AppointmentMeasurmentDetailsRepository();
  final _appointementmeasurmentdetailsListDataCntroller =
      StreamController<Response<List<AppointementmeasurmentModel>>>();

  StreamSink<Response<List<AppointementmeasurmentModel>>>
      get appointmentmeasurmentDetailsDataSink =>
          _appointementmeasurmentdetailsListDataCntroller.sink;

  Stream<Response<List<AppointementmeasurmentModel>>>
      get appointmentmeasurmentDetailsStream =>
          _appointementmeasurmentdetailsListDataCntroller.stream;

  AppointmentMeasurmentDetailsBloc() {
    _appointmentmeasurmentDetailsRepository =
        AppointmentMeasurmentDetailsRepository();
    getappointemntmeasurmentList();
    print("fsfds");
  }

  getappointemntmeasurmentList() async {
    appointmentmeasurmentDetailsDataSink.add(Response.loading('Fetching...'));
    try {
      List<AppointementmeasurmentModel> _appointmentmeasuremntEditDetailsList =
          await _appointmentmeasurmentDetailsRepository
              .getAppointmentMeasurmentEditDetails();
      appointmentmeasurmentDetailsDataSink
          .add(Response.success(_appointmentmeasuremntEditDetailsList));
    } catch (e) {
      appointmentmeasurmentDetailsDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _appointementmeasurmentdetailsListDataCntroller.close();
  }
}

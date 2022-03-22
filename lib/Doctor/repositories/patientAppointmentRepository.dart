import 'dart:async';

import 'package:ayur360_app/Constants.dart';
import 'package:ayur360_app/Doctor/models/myAppointmentsModel.dart';
import 'package:ayur360_app/HomeScreen/DoctorLoginRepository/DrLoginApi.dart';

import '../../Updater/network/webApiProvider.dart';
import '../hiveshareperfrence.dart';
import '../models/patientMyAppointmentModel.dart';


class PatientAppointmentListRepository {

  Future<List<patientappointment>> getpatientAppointmentList() async {

    final Map<String, dynamic> _queryParameters = <String, dynamic>
    {

      "pageNo": "",
      "rowCount": 10,
      "userIds": userid
    };
    print("_queryParameters : "+_queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "chart/appointments/listByAllDoctorAppointment/0",
        isPost:  true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    return (response as List).map((x) => patientappointment.fromJson(x)).toList();
  }
}
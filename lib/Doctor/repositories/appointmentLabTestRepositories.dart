import 'package:ayur360_app/Doctor/UserSetting/DoctorEventScreen.dart';
import 'package:ayur360_app/Doctor/models/appointemntEditDateDetailsModel.dart';
import 'package:ayur360_app/Doctor/models/appointmentEditDetailsModel.dart';
import 'package:ayur360_app/Doctor/models/appointmentLabTestModel.dart';
import 'package:ayur360_app/Doctor/models/leaveReportEditingModel.dart';
import 'package:ayur360_app/Doctor/models/myPracticeTimeModel.dart';
import 'package:ayur360_app/Doctor/models/myProfileModel.dart';

import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';
import '../models/doctorEventModel.dart';

class AppointmentLabTestDetailsRepository {
  Future getAppointmentLabTestEditDetails() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print("masters/labTest/search?term=&id=1");
    final response = await WebApiProvider().getData(
        url: "masters/labTest/search?term=&id=1",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("res->>>>>>>>>${response}");
    return (response as List)
        .map((x) => AppointemntLabTestModel.fromJson(x))
        .toList();
  }
}

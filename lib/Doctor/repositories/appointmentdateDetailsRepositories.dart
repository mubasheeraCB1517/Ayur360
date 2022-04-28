import 'package:ayur360_app/Doctor/UserSetting/DoctorEventScreen.dart';
import 'package:ayur360_app/Doctor/models/appointemntEditDateDetailsModel.dart';
import 'package:ayur360_app/Doctor/models/appointmentEditDetailsModel.dart';
import 'package:ayur360_app/Doctor/models/leaveReportEditingModel.dart';
import 'package:ayur360_app/Doctor/models/myPracticeTimeModel.dart';
import 'package:ayur360_app/Doctor/models/myProfileModel.dart';

import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';
import '../models/doctorEventModel.dart';

class AppointmentDateEditDetailsRepository {
  Future getAppointmentDateEditDetails(int ids) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print("apo000000chart/appointments/view/${ids}");
    final response = await WebApiProvider().getData(
        url: "chart/appointments/view/${ids}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("res->>>>>>>>>${response}");
    return AppointementdateDetailsModel.fromJson(response);
  }
}

import 'package:ayur360_app/Doctor/UserSetting/DoctorEventScreen.dart';
import 'package:ayur360_app/Doctor/models/appointmentEditDetailsModel.dart';
import 'package:ayur360_app/Doctor/models/leaveReportEditingModel.dart';
import 'package:ayur360_app/Doctor/models/myPracticeTimeModel.dart';
import 'package:ayur360_app/Doctor/models/myProfileModel.dart';

import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';
import '../models/doctorEventModel.dart';

class AppointmentEditDetailsRepository {
  Future getAppointmentEditDetails(int ids) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print("api=userservice/userDetails/${ids}");
    final response = await WebApiProvider().getData(
        url: "userservice/userDetails/${ids}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("data-${response}");
    return AppointmentDetailsModel.fromJson(response);
  }
}

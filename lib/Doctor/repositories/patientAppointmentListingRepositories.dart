

import 'package:ayur360_app/Doctor/models/patientAppointementListModel.dart';

import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';

class PatientAppointmentsaveListRepository {
  Future getAppointsaveListing(int appId) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print("save-->>>>>>>>>>>chart/appointments/view/${appId}");
    final response = await WebApiProvider().getData(
        url: "chart/appointments/view/${appId}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("saveResponse->>>>>>>>>${response}");
    return PatientAppointmentList.fromJson(response);
  }
}

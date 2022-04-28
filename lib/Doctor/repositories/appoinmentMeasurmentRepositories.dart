import 'package:ayur360_app/Constants.dart';
import 'package:ayur360_app/Doctor/models/appointmentLabTestModel.dart';
import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';
import '../models/appointmentmeasurmentofmedicieModel.dart';
import '../models/doctorEventModel.dart';

class AppointmentMeasurmentDetailsRepository {
  Future getAppointmentMeasurmentEditDetails() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    print("masters/measuringUnits/list/${ClinicId}");
    final response = await WebApiProvider().getData(
        url: "masters/measuringUnits/list/${ClinicId}",
        isPost: false,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    print("res->>>>>>>>>${response}");
    return (response as List)
        .map((x) => AppointementmeasurmentModel.fromJson(x))
        .toList();
  }
}

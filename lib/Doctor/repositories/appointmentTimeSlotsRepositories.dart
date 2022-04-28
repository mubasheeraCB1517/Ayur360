import 'dart:async';
import 'package:ayur360_app/Constants.dart';
import 'package:ayur360_app/Doctor/Patient/appointmentReccomendNextAppointment.dart';
import 'package:ayur360_app/Doctor/models/appointemntTimeaSlotsModel.dart';
import 'package:ayur360_app/HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';

String slots = "";

class TimeSlotsRepository {
  Future<List<AppointmentTimeZoneModel>> getTimeZone() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "doctorId": userid,
      "clinicId": ClinicId,
      "appointDate": formattedDatenextAppointment,
      "timeZone": "GMT+5:30"
    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response = await WebApiProvider().getData(
        url: "chart/appointments/timeSlots/",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("response->>>>>>>>>>>${response}");
    //slots = response.data;
    //String Slot = slots[slotes];
    //print("slots->>>>>>>>>>>${slots}");
    return (response as List)
        .map((x) => AppointmentTimeZoneModel.fromJson(x))
        .toList();
  }
}

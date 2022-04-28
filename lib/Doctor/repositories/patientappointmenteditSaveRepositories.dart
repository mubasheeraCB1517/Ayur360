import 'package:ayur360_app/Doctor/Patient/appointemntLabTestFirstScreen.dart';
import 'package:ayur360_app/Doctor/Patient/appointmentClinicalNotesScreen.dart';
import 'package:ayur360_app/Doctor/Patient/appointmentListDateDetails.dart';
import 'package:ayur360_app/Doctor/Patient/appointmentPrescriptionScreen.dart';
import 'package:ayur360_app/Doctor/Patient/appointmentReccomendNextAppointment.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../../Constants.dart';
import '../../HomeScreen/DoctorLoginRepository/DrLoginApi.dart';
import '../../Updater/network/webApiProvider.dart';
import '../Patient/appointmentVitalSignScreen.dart';
import '../models/doctorEventModel.dart';

class AppointmentEditSaveRepository {
  Future AppointmentEditSave(appointemtDetaisID, dateId, BuildContext context,) async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy/MM/dd');
    final String formatted = formatter.format(now);

    DateTime parseDate =
    new DateFormat("yyyy/MM/dd").parse(formatted);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('yyyy/MM/dd');
    var outputDate = outputFormat.format(inputDate);
    print("vitalSignArray${VitalSignArray}");
    final Map<String, dynamic> _queryParameters = <String, dynamic>
    {
      "appointmentId": appointemtDetaisID,
      "presEdit": "0",
      "labStatus": "1",
      "appointmentStatus": "",
      "prescriptionStatus": "1",
      "patientId": dateId,
      "appointmentType": "D",
      "doctorType": "S",
      "doctorId": userid,
      "clinicId": ClinicId,
      "amountPaid": "",
      "doctorSuggestion": "qwe",
      "appointmentTime": AppointementTime,
      "appointmentDate": AppointemntDate ,
      "nextAppointmentDate": formattedDatenextAppointment,
      "nextAppointmentId": 0,
      "nextAppointmentTime": selectedSlot,
      "prescriptionMode": "",
      "isCompleted": "Y",
      "virtualSignDetails": VitalSignArray.isEmpty ? null:VitalSignArray,
      "treatmentPlanList": [],
      "labList": LabListArray,
      "clinicalNotesList": ClinicalNotesArray.isEmpty?[]:ClinicalNotesArray,
      "prescriptionList": PrescriptionArray,
      "filesList": [],
      "clinicRecommendDTO":ReccomendArray.isEmpty?null:ReccomendArray




    };
    print("_queryParameters : " + _queryParameters.toString());
    print("token=${TOKEN}");
    final response =  await WebApiProvider().getData(
        url: "chart/appointments/",
        isPost: true,
        token: TOKEN,
        queryParameters: _queryParameters,
        isQueryParmeter: true

    );
    print("response->>>>>>>>>>>${response}");
    selectedSlot = "";
    VitalSignArray.clear();
    ClinicalNotesArray.clear();
    PrescriptionArray.clear();
    ReccomendArray.clear();
    LabListArray.clear();
    return response;
  }
}

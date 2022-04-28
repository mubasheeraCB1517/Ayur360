class AppointementdateDetailsModel {
  String? appointmentDate;
  int? appointmentId;
  Object? appointmentStatus;
  String? appointmentTime;
  String? appointmentType;
  List<Object>? clinicalNotesList;
  String? doctor;
  int? doctorId;
  List<Object>? filesList;
  List<Object>? labList;
  int? patientId;
  List<Object>? prescriptionList;
  Object? recommendId;
  Object? recommends;
  List<Object>? treatmentPlanList;
  VirtualSignDetails? virtualSignDetails;

  AppointementdateDetailsModel(
      {this.appointmentDate,
      this.appointmentId,
      this.appointmentStatus,
      this.appointmentTime,
      this.appointmentType,
      this.clinicalNotesList,
      this.doctor,
      this.doctorId,
      this.filesList,
      this.labList,
      this.patientId,
      this.prescriptionList,
      this.recommendId,
      this.recommends,
      this.treatmentPlanList,
      this.virtualSignDetails});

  factory AppointementdateDetailsModel.fromJson(Map<String, dynamic> json) {
    return AppointementdateDetailsModel(
      appointmentDate: json['appointmentDate'],
      appointmentId: json['appointmentId'],
      appointmentTime: json['appointmentTime'],
      appointmentType: json['appointmentType'],
      doctor: json['doctor'],
      doctorId: json['doctorId'],
      virtualSignDetails: json['virtualSignDetails'] != null
          ? VirtualSignDetails.fromJson(json['virtualSignDetails'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointmentDate'] = this.appointmentDate;
    data['appointmentId'] = this.appointmentId;
    data['appointmentTime'] = this.appointmentTime;
    data['appointmentType'] = this.appointmentType;
    data['doctor'] = this.doctor;
    data['doctorId'] = this.doctorId;
    data['patientId'] = this.patientId;

    return data;
  }
}

class VirtualSignDetails {
  Object? bp;
  Object? pulse;
  Object? temperature;
  Object? virtualSignId;
  Object? weight;

  VirtualSignDetails(
      {this.bp, this.pulse, this.temperature, this.virtualSignId, this.weight});

  factory VirtualSignDetails.fromJson(Map<String, dynamic> json) {
    return VirtualSignDetails();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}

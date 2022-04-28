class VitalSignModel {
  String? age;
  String? appointmentDate;
  int? appointmentId;
  Object? clinicId;
  List<Detailsdto>? detailsdto;
  int? doctorId;
  String? doctorMail;
  String? doctorName;
  String? doctorNumber;
  String? doctorWhatApp;
  String? gender;
  Object? pageNo;
  int? patientId;
  String? patientMail;
  String? patientName;
  String? patientNumber;
  String? patientRegId;
  String? patientWhatApp;
  String? qualification;
  Object? rowCount;
  Object? totalCount;
  Object? userIds;
  Object? virtualSignId;

  VitalSignModel(
      {this.age,
      this.appointmentDate,
      this.appointmentId,
      this.clinicId,
      this.detailsdto,
      this.doctorId,
      this.doctorMail,
      this.doctorName,
      this.doctorNumber,
      this.doctorWhatApp,
      this.gender,
      this.pageNo,
      this.patientId,
      this.patientMail,
      this.patientName,
      this.patientNumber,
      this.patientRegId,
      this.patientWhatApp,
      this.qualification,
      this.rowCount,
      this.totalCount,
      this.userIds,
      this.virtualSignId});

  factory VitalSignModel.fromJson(Map<String, dynamic> json) {
    return VitalSignModel(
      age: json['age'],
      appointmentDate: json['appointmentDate'],
      appointmentId: json['appointmentId'],
      detailsdto: json['detailsdto'] != null
          ? (json['detailsdto'] as List)
              .map((i) => Detailsdto.fromJson(i))
              .toList()
          : null,
      doctorId: json['doctorId'],
      doctorMail: json['doctorMail'],
      doctorName: json['doctorName'],
      doctorNumber: json['doctorNumber'],
      doctorWhatApp: json['doctorWhatApp'],
      gender: json['gender'],
      patientId: json['patientId'],
      patientMail: json['patientMail'],
      patientName: json['patientName'],
      patientNumber: json['patientNumber'],
      patientRegId: json['patientRegId'],
      patientWhatApp: json['patientWhatApp'],
      qualification: json['qualification'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['appointmentDate'] = this.appointmentDate;
    data['appointmentId'] = this.appointmentId;
    data['doctorId'] = this.doctorId;
    data['doctorMail'] = this.doctorMail;
    data['doctorName'] = this.doctorName;
    data['doctorNumber'] = this.doctorNumber;
    data['doctorWhatApp'] = this.doctorWhatApp;
    data['gender'] = this.gender;
    data['patientId'] = this.patientId;
    data['patientMail'] = this.patientMail;
    data['patientName'] = this.patientName;
    data['patientNumber'] = this.patientNumber;
    data['patientRegId'] = this.patientRegId;
    data['patientWhatApp'] = this.patientWhatApp;
    data['qualification'] = this.qualification;

    return data;
  }
}

class Detailsdto {
  String? bp;
  Object? clinicId;
  String? pulse;
  String? temperature;
  int? virtualSignId;
  String? weight;

  Detailsdto(
      {this.bp,
      this.clinicId,
      this.pulse,
      this.temperature,
      this.virtualSignId,
      this.weight});

  factory Detailsdto.fromJson(Map<String, dynamic> json) {
    return Detailsdto(
      bp: json['bp'],
      pulse: json['pulse'],
      temperature: json['temperature'],
      virtualSignId: json['virtualSignId'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bp'] = this.bp;
    data['pulse'] = this.pulse;
    data['temperature'] = this.temperature;
    data['virtualSignId'] = this.virtualSignId;
    data['weight'] = this.weight;

    return data;
  }
}

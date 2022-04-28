class ClinicalTestModel {
  String? age;
  String? appointmentDate;
  int? appointmentId;
  Object? clinicId;
  Object? clinicalNotesId;
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

  ClinicalTestModel(
      {this.age,
      this.appointmentDate,
      this.appointmentId,
      this.clinicId,
      this.clinicalNotesId,
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
      this.userIds});

  factory ClinicalTestModel.fromJson(Map<String, dynamic> json) {
    return ClinicalTestModel(
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
  Object? clinicId;
  String? clinicalNotes;
  Object? clinicalNotesId;
  Object? clinicalType;
  String? complaints;
  String? diagnosis;

  Detailsdto(
      {this.clinicId,
      this.clinicalNotes,
      this.clinicalNotesId,
      this.clinicalType,
      this.complaints,
      this.diagnosis});

  factory Detailsdto.fromJson(Map<String, dynamic> json) {
    return Detailsdto(
      clinicalNotes: json['clinicalNotes'],
      complaints: json['complaints'],
      diagnosis: json['diagnosis'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicalNotes'] = this.clinicalNotes;
    data['complaints'] = this.complaints;
    data['diagnosis'] = this.diagnosis;

    return data;
  }
}

class prescription {
  Object? age;
  String? appointmentDate;
  int? appointmentId;
  Object? clinicId;
  List<Detailsdto>? detailsdtos;
  int? doctorId;
  String? doctorName;
  Object? doctorNumber;
  Object? doctorWhatApp;
  Object? gender;
  Object? pageNo;
  String? patientMail;
  String? patientName;
  Object? patientNumber;
  String? patientRegId;
  Object? patientWhatApp;
  int? prescriptionId;
  Object? qualification;
  Object? rowCount;
  Object? term;
  Object? totalCount;
  Object? userIds;

  prescription(
      {this.age,
      this.appointmentDate,
      this.appointmentId,
      this.clinicId,
      this.detailsdtos,
      this.doctorId,
      this.doctorName,
      this.doctorNumber,
      this.doctorWhatApp,
      this.gender,
      this.pageNo,
      this.patientMail,
      this.patientName,
      this.patientNumber,
      this.patientRegId,
      this.patientWhatApp,
      this.prescriptionId,
      this.qualification,
      this.rowCount,
      this.term,
      this.totalCount,
      this.userIds});

  factory prescription.fromJson(Map<String, dynamic> json) {
    return prescription(
      appointmentDate: json['appointmentDate'],
      appointmentId: json['appointmentId'],
      detailsdtos: json['detailsdtos'] != null
          ? (json['detailsdtos'] as List)
              .map((i) => Detailsdto.fromJson(i))
              .toList()
          : null,
      doctorId: json['doctorId'],
      doctorName: json['doctorName'],
      patientMail: json['patientMail'],
      patientName: json['patientName'],
      patientRegId: json['patientRegId'],
      prescriptionId: json['prescriptionId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointmentDate'] = this.appointmentDate;
    data['appointmentId'] = this.appointmentId;
    data['doctorId'] = this.doctorId;
    data['doctorName'] = this.doctorName;
    data['patientMail'] = this.patientMail;
    data['patientName'] = this.patientName;
    data['patientRegId'] = this.patientRegId;
    data['prescriptionId'] = this.prescriptionId;

    return data;
  }
}

class Detailsdto {
  String? categoryName;
  String? doctorSuggestion;
  int? drugId;
  String? drugName;
  String? drugStrength;
  String? duration;
  String? durationType;
  String? foodStatus;
  Object? image;
  Object? labTestId;
  String? morningCount;
  String? nightCount;
  String? noonCount;
  Object? notes;

  Detailsdto(
      {this.categoryName,
      this.doctorSuggestion,
      this.drugId,
      this.drugName,
      this.drugStrength,
      this.duration,
      this.durationType,
      this.foodStatus,
      this.image,
      this.labTestId,
      this.morningCount,
      this.nightCount,
      this.noonCount,
      this.notes});

  factory Detailsdto.fromJson(Map<String, dynamic> json) {
    return Detailsdto(
      categoryName: json['categoryName'],
      doctorSuggestion: json['doctorSuggestion'],
      drugId: json['drugId'],
      drugName: json['drugName'],
      drugStrength: json['drugStrength'],
      duration: json['duration'],
      durationType: json['durationType'],
      foodStatus: json['foodStatus'],
      morningCount: json['morningCount'],
      nightCount: json['nightCount'],
      noonCount: json['noonCount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    data['doctorSuggestion'] = this.doctorSuggestion;
    data['drugId'] = this.drugId;
    data['drugName'] = this.drugName;
    data['drugStrength'] = this.drugStrength;
    data['duration'] = this.duration;
    data['durationType'] = this.durationType;
    data['foodStatus'] = this.foodStatus;
    data['morningCount'] = this.morningCount;
    data['nightCount'] = this.nightCount;
    data['noonCount'] = this.noonCount;

    return data;
  }
}

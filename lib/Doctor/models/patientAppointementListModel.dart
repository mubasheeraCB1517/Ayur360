class PatientAppointmentList {
  String? appointmentDate;
  int? appointmentId;
  Object? appointmentStatus;
  String? appointmentTime;
  String? appointmentType;
  List<ClinicalNotes>? clinicalNotesList;
  String? doctor;
  int? doctorId;
  List<Object>? filesList;
  List<Lab>? labList;
  int? patientId;
  List<Prescription>? prescriptionList;
  int? recommendId;
  String? recommends;
  List<Object>? treatmentPlanList;
  VirtualSignDetails? virtualSignDetails;

  PatientAppointmentList(
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

  factory PatientAppointmentList.fromJson(Map<String, dynamic> json) {
    return PatientAppointmentList(
      appointmentDate: json['appointmentDate'],
      appointmentId: json['appointmentId'],
      appointmentTime: json['appointmentTime'],
      appointmentType: json['appointmentType'],
      clinicalNotesList: json['clinicalNotesList'] != null
          ? (json['clinicalNotesList'] as List)
              .map((i) => ClinicalNotes.fromJson(i))
              .toList()
          : null,
      doctor: json['doctor'],
      doctorId: json['doctorId'],
      labList: json['labList'] != null
          ? (json['labList'] as List).map((i) => Lab.fromJson(i)).toList()
          : null,
      patientId: json['patientId'],
      prescriptionList: json['prescriptionList'] != null
          ? (json['prescriptionList'] as List)
              .map((i) => Prescription.fromJson(i))
              .toList()
          : null,
      recommendId: json['recommendId'],
      recommends: json['recommends'],
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
    data['recommendId'] = this.recommendId;
    data['recommends'] = this.recommends;

    return data;
  }
}

class ClinicalNotes {
  Object? clinicalImagesList;
  String? clinicalNotes;
  int? clinicalNotesId;
  Object? clinicalType;
  String? complaints;
  String? diagnosis;

  ClinicalNotes(
      {this.clinicalImagesList,
      this.clinicalNotes,
      this.clinicalNotesId,
      this.clinicalType,
      this.complaints,
      this.diagnosis});

  factory ClinicalNotes.fromJson(Map<String, dynamic> json) {
    return ClinicalNotes(
      clinicalNotes: json['clinicalNotes'],
      clinicalNotesId: json['clinicalNotesId'],
      complaints: json['complaints'],
      diagnosis: json['diagnosis'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicalNotes'] = this.clinicalNotes;
    data['clinicalNotesId'] = this.clinicalNotesId;
    data['complaints'] = this.complaints;
    data['diagnosis'] = this.diagnosis;

    return data;
  }
}

class Lab {
  int? labId;
  String? labTest;
  int? labTestId;
  String? otherTest;

  Lab({this.labId, this.labTest, this.labTestId, this.otherTest});

  factory Lab.fromJson(Map<String, dynamic> json) {
    return Lab(
      labId: json['labId'],
      labTest: json['labTest'],
      labTestId: json['labTestId'],
      otherTest: json['otherTest'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labId'] = this.labId;
    data['labTest'] = this.labTest;
    data['labTestId'] = this.labTestId;
    data['otherTest'] = this.otherTest;
    return data;
  }
}

class VirtualSignDetails {
  String? bp;
  String? pulse;
  String? temperature;
  int? virtualSignId;
  String? weight;

  VirtualSignDetails(
      {this.bp, this.pulse, this.temperature, this.virtualSignId, this.weight});

  factory VirtualSignDetails.fromJson(Map<String, dynamic> json) {
    return VirtualSignDetails(
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

class Prescription {
  String? doctorSuggestion;
  int? drugId;
  String? drugName;
  String? drugStrength;
  String? duration;
  String? durationType;
  String? foodStatus;
  int? morningCount;
  int? nightCount;
  int? noonCount;
  Object? notes;
  String? otherMedicines;
  int? prescriptionId;
  String? purchaseQuantity;

  Prescription(
      {this.doctorSuggestion,
      this.drugId,
      this.drugName,
      this.drugStrength,
      this.duration,
      this.durationType,
      this.foodStatus,
      this.morningCount,
      this.nightCount,
      this.noonCount,
      this.notes,
      this.otherMedicines,
      this.prescriptionId,
      this.purchaseQuantity});

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
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
      otherMedicines: json['otherMedicines'],
      prescriptionId: json['prescriptionId'],
      purchaseQuantity: json['purchaseQuantity'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['otherMedicines'] = this.otherMedicines;
    data['prescriptionId'] = this.prescriptionId;
    data['purchaseQuantity'] = this.purchaseQuantity;

    return data;
  }
}

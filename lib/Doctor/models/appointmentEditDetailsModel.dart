class AppointmentDetailsModel {
  String? address;
  String? age;
  int? clinicId;
  int? countryId;
  String? dob;
  String? emailId;
  String? fullName;
  String? gender;
  String? imagePath;
  String? mobileCode;
  String? mobileNo;
  String? month;
  Object? password;
  String? patientRegId;
  int? placeId;
  Object? qualification;
  Object? specialization;
  int? userDetailsId;
  String? userId;
  String? userRole;
  String? userTimeZones;
  String? userType;
  String? whatsappCode;
  String? whatsappNo;
  String? zipCode;

  AppointmentDetailsModel(
      {this.address,
      this.age,
      this.clinicId,
      this.countryId,
      this.dob,
      this.emailId,
      this.fullName,
      this.gender,
      this.imagePath,
      this.mobileCode,
      this.mobileNo,
      this.month,
      this.password,
      this.patientRegId,
      this.placeId,
      this.qualification,
      this.specialization,
      this.userDetailsId,
      this.userId,
      this.userRole,
      this.userTimeZones,
      this.userType,
      this.whatsappCode,
      this.whatsappNo,
      this.zipCode});

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) {
    return AppointmentDetailsModel(
      address: json['address'],
      age: json['age'],
      clinicId: json['clinicId'],
      countryId: json['countryId'],
      dob: json['dob'],
      emailId: json['emailId'],
      fullName: json['fullName'],
      gender: json['gender'],
      imagePath: json['imagePath'],
      mobileCode: json['mobileCode'],
      mobileNo: json['mobileNo'],
      month: json['month'],
      patientRegId: json['patientRegId'],
      placeId: json['placeId'],
      userDetailsId: json['userDetailsId'],
      userId: json['userId'],
      userRole: json['userRole'],
      userTimeZones: json['userTimeZones'],
      userType: json['userType'],
      whatsappCode: json['whatsappCode'],
      whatsappNo: json['whatsappNo'],
      zipCode: json['zipCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['age'] = this.age;
    data['clinicId'] = this.clinicId;
    data['countryId'] = this.countryId;
    data['dob'] = this.dob;
    data['emailId'] = this.emailId;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['imagePath'] = this.imagePath;
    data['mobileCode'] = this.mobileCode;
    data['mobileNo'] = this.mobileNo;
    data['month'] = this.month;
    data['patientRegId'] = this.patientRegId;
    data['placeId'] = this.placeId;
    data['userDetailsId'] = this.userDetailsId;
    data['userId'] = this.userId;
    data['userRole'] = this.userRole;
    data['userTimeZones'] = this.userTimeZones;
    data['userType'] = this.userType;
    data['whatsappCode'] = this.whatsappCode;
    data['whatsappNo'] = this.whatsappNo;
    data['zipCode'] = this.zipCode;
    return data;
  }
}

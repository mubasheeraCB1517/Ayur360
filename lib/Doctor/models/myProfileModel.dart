class MyprofileModel {
    Object? address;
    String? age;
    int? clinicId;
    int? countryId;
    Object? dob;
    String? emailId;
    String? fullName;
    Object? gender;
    String? imagePath;
    String? mobileCode;
    String? mobileNo;
    Object? month;
    Object? password;
    Object? patientRegId;
    int? placeId;
    String? qualification;
    String? specialization;
    int? userDetailsId;
    String? userId;
    String? userRole;
    Object? userTimeZones;
    String? userType;
    String? whatsappCode;
    String? whatsappNo;
    Object? zipCode;

    MyprofileModel({this.address, this.age, this.clinicId, this.countryId, this.dob, this.emailId, this.fullName, this.gender, this.imagePath, this.mobileCode, this.mobileNo, this.month, this.password, this.patientRegId, this.placeId, this.qualification, this.specialization, this.userDetailsId, this.userId, this.userRole, this.userTimeZones, this.userType, this.whatsappCode, this.whatsappNo, this.zipCode});

    factory MyprofileModel.fromJson(Map<String, dynamic> json) {
        return MyprofileModel(

            age: json['age'],
            clinicId: json['clinicId'],
            countryId: json['countryId'],
            emailId: json['emailId'],
            fullName: json['fullName'],
            imagePath: json['imagePath'],
            mobileCode: json['mobileCode'],
            mobileNo: json['mobileNo'],
            placeId: json['placeId'],
            qualification: json['qualification'],
            specialization: json['specialization'],
            userDetailsId: json['userDetailsId'],
            userId: json['userId'],
            userRole: json['userRole'],
            userType: json['userType'],
            whatsappCode: json['whatsappCode'],
            whatsappNo: json['whatsappNo'],

        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['age'] = this.age;
        data['clinicId'] = this.clinicId;
        data['countryId'] = this.countryId;
        data['emailId'] = this.emailId;
        data['fullName'] = this.fullName;
        data['imagePath'] = this.imagePath;
        data['mobileCode'] = this.mobileCode;
        data['mobileNo'] = this.mobileNo;
        data['placeId'] = this.placeId;
        data['qualification'] = this.qualification;
        data['specialization'] = this.specialization;
        data['userDetailsId'] = this.userDetailsId;
        data['userId'] = this.userId;
        data['userRole'] = this.userRole;
        data['userType'] = this.userType;
        data['whatsappCode'] = this.whatsappCode;
        data['whatsappNo'] = this.whatsappNo;

        return data;
    }
}
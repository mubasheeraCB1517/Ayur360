class patientappointment {
    Object? age;
    String? appointmentDate;
    Object? appointmentDateDoctor;
    int? appointmentId;
    String? appointmentStatus;
    String? appointmentType;
    Object? clinicId;
    int? doctorId;
    Object? doctorImage;
    Object? doctorMail;
    String? doctorName;
    Object ?doctorNumber;
    Object? doctorType;
    Object? doctorWhatApp;
    Object? gender;
    Object? nextAppointmentDate;
    Object? nextAppointmentTime;
    int? pageNo;
    int? patientId;
    Object? patientMail;
    Object? patientMobileCode;
    String? patientName;
    Object? patientNumber;
    Object? patientWhatApp;
    Object? qualification;
    Object? rowCount;
    Object ?timeZone;
    int ?totalCount;
    Object? userIds;
    int? slno;

    patientappointment({this.age, this.appointmentDate, this.appointmentDateDoctor, this.appointmentId, this.appointmentStatus, this.appointmentType, this.clinicId, this.doctorId, this.doctorImage, this.doctorMail, this.doctorName, this.doctorNumber, this.doctorType, this.doctorWhatApp, this.gender, this.nextAppointmentDate, this.nextAppointmentTime, this.pageNo, this.patientId, this.patientMail, this.patientMobileCode, this.patientName, this.patientNumber, this.patientWhatApp, this.qualification, this.rowCount, this.timeZone, this.totalCount, this.userIds});

    factory patientappointment.fromJson(Map<String, dynamic> json) {
        return patientappointment(

            appointmentDate: json['appointmentDate'],

            appointmentId: json['appointmentId'],
            appointmentStatus: json['appointmentStatus'],
            appointmentType: json['appointmentType'],

            doctorId: json['doctorId'],

            doctorName: json['doctorName'],

            pageNo: json['pageNo'],
            patientId: json['patientId'],

            patientName: json['patientName'],

            totalCount: json['totalCount'],

        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['appointmentDate'] = this.appointmentDate;
        data['appointmentId'] = this.appointmentId;
        data['appointmentStatus'] = this.appointmentStatus;
        data['appointmentType'] = this.appointmentType;
        data['doctorId'] = this.doctorId;
        data['doctorName'] = this.doctorName;
        data['pageNo'] = this.pageNo;
        data['patientId'] = this.patientId;
        data['patientName'] = this.patientName;
        data['totalCount'] = this.totalCount;


        return data;
    }
}
import 'package:flutter/material.dart';
int index = 1;

class myAppointment {
    String appointmentDate;
    int? appointmentId;
    String? appointmentType;
    String? appointmentStatus;
    int? doctorId;
    String? doctorName;
    int? pageNo;
    int? patientId;
    String ?patientName;
    int? totalCount;

   int? slno ;
 // String? icon = Icon(Icons.video_call_outlined) as String?;


    myAppointment({required this.appointmentDate, this.appointmentId, this.appointmentType, this.appointmentStatus, this.doctorId, this.doctorName, this.pageNo, this.patientId, this.patientName, this.totalCount});

    factory myAppointment.fromJson(Map<String, dynamic> json) {
        return myAppointment(
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
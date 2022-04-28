class AppointementmeasurmentModel {
  int? clinicId;
  String? measuringUnits;
  String? measuringUnitsCode;
  int? measuringUnitsId;

  AppointementmeasurmentModel(
      {this.clinicId,
      this.measuringUnits,
      this.measuringUnitsCode,
      this.measuringUnitsId});

  factory AppointementmeasurmentModel.fromJson(Map<String, dynamic> json) {
    return AppointementmeasurmentModel(
      clinicId: json['clinicId'],
      measuringUnits: json['measuringUnits'],
      measuringUnitsCode: json['measuringUnitsCode'],
      measuringUnitsId: json['measuringUnitsId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicId'] = this.clinicId;
    data['measuringUnits'] = this.measuringUnits;
    data['measuringUnitsCode'] = this.measuringUnitsCode;
    data['measuringUnitsId'] = this.measuringUnitsId;
    return data;
  }
}

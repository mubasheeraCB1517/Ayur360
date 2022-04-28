class AppointemntLabTestModel {
  int? clinicId;
  String? labTest;
  int? labTestId;

  AppointemntLabTestModel({this.clinicId, this.labTest, this.labTestId});

  factory AppointemntLabTestModel.fromJson(Map<String, dynamic> json) {
    return AppointemntLabTestModel(
      clinicId: json['clinicId'],
      labTest: json['labTest'],
      labTestId: json['labTestId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicId'] = this.clinicId;
    data['labTest'] = this.labTest;
    data['labTestId'] = this.labTestId;
    return data;
  }
}

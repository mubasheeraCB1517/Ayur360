class AppointmentPrescriptionModel {
  String? categoryName;
  Object? drugsCode;
  int? drugsId;
  String? drugsName;
  int? drugsQuantity;
  String? drugsRate;
  Object? image;
  String? model;
  double? weight;
  int? weightClassId;

  AppointmentPrescriptionModel(
      {this.categoryName,
      this.drugsCode,
      this.drugsId,
      this.drugsName,
      this.drugsQuantity,
      this.drugsRate,
      this.image,
      this.model,
      this.weight,
      this.weightClassId});

  factory AppointmentPrescriptionModel.fromJson(Map<String, dynamic> json) {
    return AppointmentPrescriptionModel(
      categoryName: json['categoryName'],
      drugsId: json['drugsId'],
      drugsName: json['drugsName'],
      drugsQuantity: json['drugsQuantity'],
      drugsRate: json['drugsRate'],
      model: json['model'],
      weight: json['weight'],
      weightClassId: json['weightClassId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    data['drugsId'] = this.drugsId;
    data['drugsName'] = this.drugsName;
    data['drugsQuantity'] = this.drugsQuantity;
    data['drugsRate'] = this.drugsRate;
    data['model'] = this.model;
    data['weight'] = this.weight;
    data['weightClassId'] = this.weightClassId;

    return data;
  }
}

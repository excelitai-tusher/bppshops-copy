class division {
  int? id;
  String? divisionId;
  String? districtId;
  String? upazila;
  String? postOffice;
  String? postCode;
  String? createdAt;
  String? updatedAt;

  division({this.id,
        this.divisionId,
        this.districtId,
        this.upazila,
        this.postOffice,
        this.postCode,
        this.createdAt,
        this.updatedAt});

  division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    upazila = json['upazila'];
    postOffice = json['postOffice'];
    postCode = json['postCode'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['division_id'] = this.divisionId;
    data['district_id'] = this.districtId;
    data['upazila'] = this.upazila;
    data['postOffice'] = this.postOffice;
    data['postCode'] = this.postCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
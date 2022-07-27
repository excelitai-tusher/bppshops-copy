class SelectAddress {
 DelivaryAddress? address;
  int? status;

  SelectAddress({this.address, this.status});

  SelectAddress.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new DelivaryAddress.fromJson(json['address']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class DelivaryAddress {
  int? id;
  String? userId;
  String? streetAddress;
  String? districtId;
  String? thanaId;
  Null? floorNo;
  Null? appartmentNo;
  String? phoneNo;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;
  District? district;
  PostCodes? postCodes;

  DelivaryAddress(
      {this.id,
        this.userId,
        this.streetAddress,
        this.districtId,
        this.thanaId,
        this.floorNo,
        this.appartmentNo,
        this.phoneNo,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.district,
        this.postCodes});

  DelivaryAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    streetAddress = json['street_address'];
    districtId = json['district_id'];
    thanaId = json['thana_id'];
    floorNo = json['floor_no'];
    appartmentNo = json['appartment_no'];
    phoneNo = json['phone_no'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    postCodes = json['post_codes'] != null
        ? new PostCodes.fromJson(json['post_codes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['street_address'] = this.streetAddress;
    data['district_id'] = this.districtId;
    data['thana_id'] = this.thanaId;
    data['floor_no'] = this.floorNo;
    data['appartment_no'] = this.appartmentNo;
    data['phone_no'] = this.phoneNo;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.postCodes != null) {
      data['post_codes'] = this.postCodes!.toJson();
    }
    return data;
  }
}

class District {
  int? id;
  String? divisionId;
  String? name;
  String? bnName;
  String? lat;
  String? deliveryCharge;
  String? long;
  String? createdAt;
  String? updatedAt;

  District(
      {this.id,
        this.divisionId,
        this.name,
        this.bnName,
        this.lat,
        this.deliveryCharge,
        this.long,
        this.createdAt,
        this.updatedAt});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionId = json['division_id'];
    name = json['name'];
    bnName = json['bn_name'];
    lat = json['lat'];
    deliveryCharge = json['delivery_charge'];
    long = json['long'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['division_id'] = this.divisionId;
    data['name'] = this.name;
    data['bn_name'] = this.bnName;
    data['lat'] = this.lat;
    data['delivery_charge'] = this.deliveryCharge;
    data['long'] = this.long;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PostCodes {
  int? id;
  String? divisionId;
  String? districtId;
  String? upazila;
  String? postOffice;
  String? postCode;
  String? createdAt;
  String? updatedAt;

  PostCodes(
      {this.id,
        this.divisionId,
        this.districtId,
        this.upazila,
        this.postOffice,
        this.postCode,
        this.createdAt,
        this.updatedAt});

  PostCodes.fromJson(Map<String, dynamic> json) {
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
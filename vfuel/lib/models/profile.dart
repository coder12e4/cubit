class Profile {
  bool? emailVerified;
  bool? gstinlVerified;
  bool? phoneVerified;
  String? role;
  String? status;
  String? sId;
  String? name;
  String? address;
  String? email;
  String? phone;
  String? businessName;
  String? businessPhone;
  int? pincode;
  String? districtId;
  String? gstin;
  String? code;
  String? district;
  String? countryId;
  String? country;
  String? stateId;
  String? state;
  String? userId;
  String? createdAt;
  String? dateOfReg;
  List<DeliveryAddress>? deliveryAddress;
  String? updatedAt;
  int? iV;

  Profile(
      {this.emailVerified,
      this.gstinlVerified,
      this.phoneVerified,
      this.role,
      this.status,
      this.sId,
      this.name,
      this.address,
      this.email,
      this.phone,
      this.businessName,
      this.businessPhone,
      this.pincode,
      this.districtId,
      this.gstin,
      this.code,
      this.district,
      this.countryId,
      this.country,
      this.stateId,
      this.state,
      this.userId,
      this.createdAt,
      this.dateOfReg,
      this.deliveryAddress,
      this.updatedAt,
      this.iV});

  Profile.fromJson(Map<String, dynamic> json) {
    emailVerified = json['emailVerified'];
    gstinlVerified = json['gstinlVerified'];
    phoneVerified = json['phoneVerified'];
    role = json['role'];
    status = json['status'];
    sId = json['_id'];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    businessName = json['businessName'];
    businessPhone = json['businessPhone'];
    pincode = json['pincode'];
    districtId = json['districtId'];
    gstin = json['gstin'];
    code = json['code'];
    district = json['district'];
    countryId = json['countryId'];
    country = json['country'];
    stateId = json['stateId'];
    state = json['state'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    dateOfReg = json['dateOfReg'];
    if (json['deliveryAddress'] != null) {
      deliveryAddress = <DeliveryAddress>[];
      json['deliveryAddress'].forEach((v) {
        deliveryAddress!.add(new DeliveryAddress.fromJson(v));
      });
    }
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailVerified'] = this.emailVerified;
    data['gstinlVerified'] = this.gstinlVerified;
    data['phoneVerified'] = this.phoneVerified;
    data['role'] = this.role;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['businessName'] = this.businessName;
    data['pincode'] = this.pincode;
    data['districtId'] = this.districtId;
    data['gstin'] = this.gstin;
    data['code'] = this.code;
    data['district'] = this.district;
    data['countryId'] = this.countryId;
    data['country'] = this.country;
    data['stateId'] = this.stateId;
    data['state'] = this.state;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['dateOfReg'] = this.dateOfReg;
    if (this.deliveryAddress != null) {
      data['deliveryAddress'] =
          this.deliveryAddress!.map((v) => v.toJson()).toList();
    }
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class DeliveryAddress {
  String? lat;
  String? lng;
  String? sId;
  String? id;
  String? name;
  String? address;
  String? area;
  String? landMark;
  String? city;
  String? district;
  String? state;
  String? phone;

  DeliveryAddress(
      {this.lat,
      this.lng,
      this.sId,
      this.id,
      this.name,
      this.address,
      this.area,
      this.landMark,
      this.city,
      this.district,
      this.state,
      this.phone});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    address = json['address'];
    area = json['area'];
    landMark = json['landMark'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['area'] = this.area;
    data['landMark'] = this.landMark;
    data['city'] = this.city;
    data['district'] = this.district;
    data['state'] = this.state;
    data['phone'] = this.phone;
    return data;
  }
}

class Location {
  String? lat;
  String? long;

  Location({this.lat, this.long});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

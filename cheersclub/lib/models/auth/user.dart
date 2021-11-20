class User {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? contactPerson;
  int? isCompany;
  String? address;
  String? city;
  String? zip;
  String? country;
  String? profilePhotoUrl;
  int? followers;
  int? followings;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.contactPerson,
      this.isCompany,
      this.address,
      this.city,
      this.zip,
      this.country,
      this.profilePhotoUrl,
      this.followers,
      this.followings});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    contactPerson = json['contact_person'];
    isCompany = json['is_company'];
    address = json['address'];
    city = json['city'];
    zip = json['zip'];
    country = json['country'];
    profilePhotoUrl = json['profile_photo_url'];
    followers = json['followers'];
    followings = json['followings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['contact_person'] = this.contactPerson;
    data['is_company'] = this.isCompany;
    data['address'] = this.address;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['country'] = this.country;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['followers'] = this.followers;
    data['followings'] = this.followings;
    return data;
  }
}

class UserSession {
  String? lastLogin;
  String? token;
  String? userId;
  String? role;
  String? districtId;

  UserSession(
      {this.lastLogin, this.token, this.userId, this.role, this.districtId});

  UserSession.fromJson(Map<String, dynamic> json) {
    lastLogin = json['lastLogin'];
    token = json['token'];
    userId = json['userId'];
    role = json['role'];
    districtId = json['districtId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastLogin'] = this.lastLogin;
    data['token'] = this.token;
    data['userId'] = this.userId;
    data['role'] = this.role;
    data['districtId'] = this.districtId;
    return data;
  }
}

class UserProfile {
  String? id;
  String? name;
  String? address;
  String? email;
  String? phone;
  String? password;
  String? businessName;
  String? businessEmail;
  String? businessPhone;
  String? pincode;
  String? districtId;
  String? gstin;
  String? code;

  UserProfile(
      {this.id,
      this.name,
      this.address,
      this.email,
      this.phone,
      this.password,
      this.businessName,
      this.businessEmail,
      this.businessPhone,
      this.pincode,
      this.districtId,
      this.gstin,
      this.code});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    businessName = json['businessName'];
    businessEmail = json['businessEmail'];
    businessPhone = json['businessPhone'];
    pincode = json['pincode'];
    districtId = json['districtId'];
    gstin = json['gstin'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['businessName'] = this.businessName;
    data['businessEmail'] = this.businessEmail;
    data['businessPhone'] = this.businessPhone;
    data['pincode'] = this.pincode;
    data['districtId'] = this.districtId;
    data['gstin'] = this.gstin;
    data['code'] = this.code;
    return data;
  }
}

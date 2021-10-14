class User {
  User({
    this.id,
    this.name,
    this.login_count,
    this.email,
    this.fcm_token,
    this.updated_at,
    this.profile_photo_url,
    this.followers,
  });
  String? id;
  String? name;
  String? email;

  String? login_count;
  String? fcm_token;
  String? updated_at;
  String? profile_photo_url;
  int? followers;
  int? followings;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        login_count: json["address"],
        email: json["email"],
        fcm_token: json["phone"],
        updated_at: json["password"],
        profile_photo_url: json["businessName"],
        followers: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "login_count": login_count,
        "email": email,
        "fcm_token": fcm_token,
        "updated_at": updated_at,
        "profile_photo_url": profile_photo_url,
        "followers": followers,
        "followings": followings,
      };
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

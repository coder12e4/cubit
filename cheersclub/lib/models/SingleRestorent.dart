class SingleRestorent {
  int? _id;
  String? _name;
  String? _email;
  String? _address;
  String? _city;
  String? _country;
  String? _userType;
  String? _profilePhotoUrl;
  int? _followers;
  int? _followings;

  SingleRestorent(
      {int? id,
      String? name,
      String? email,
      String? address,
      String? city,
      String? country,
      String? userType,
      String? profilePhotoUrl,
      int? followers,
      int? followings}) {
    this._id = id;
    this._name = name;
    this._email = email;
    this._address = address;
    this._city = city;
    this._country = country;
    this._userType = userType;
    this._profilePhotoUrl = profilePhotoUrl;
    this._followers = followers;
    this._followings = followings;
  }

  int get id => _id!;
  set id(int id) => _id = id;
  String get name => _name!;
  set name(String name) => _name = name;
  String get email => _email!;
  set email(String email) => _email = email;
  String get address => _address!;
  set address(String address) => _address = address;
  String get city => _city!;
  set city(String city) => _city = city;
  String get country => _country!;
  set country(String country) => _country = country;
  String get userType => _userType!;
  set userType(String userType) => _userType = userType;
  String get profilePhotoUrl => _profilePhotoUrl!;
  set profilePhotoUrl(String profilePhotoUrl) =>
      _profilePhotoUrl = profilePhotoUrl;
  int get followers => _followers!;
  set followers(int followers) => _followers = followers;
  int get followings => _followings!;
  set followings(int followings) => _followings = followings;

  SingleRestorent.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _address = json['address'];
    _city = json['city'];
    _country = json['country'];
    _userType = json['user_type'];
    _profilePhotoUrl = json['profile_photo_url'];
    _followers = json['followers'];
    _followings = json['followings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['address'] = this._address;
    data['city'] = this._city;
    data['country'] = this._country;
    data['user_type'] = this._userType;
    data['profile_photo_url'] = this._profilePhotoUrl;
    data['followers'] = this._followers;
    data['followings'] = this._followings;
    return data;
  }
}

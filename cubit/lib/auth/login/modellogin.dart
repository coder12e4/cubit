class ModelClass {
  String? email;
  String? username;
  String? password;
  String? phone;
  String? image;

  ModelClass(
      {this.email, this.username, this.password, this.phone, this.image});

  ModelClass.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    password = json['password'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['image'] = this.image;
    return data;
  }
}

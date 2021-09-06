class District {
  String? status;
  String? districtId;
  String? name;
  String? countryId;
  String? stateId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  District(
      {this.status,
      this.districtId,
      this.name,
      this.countryId,
      this.stateId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  District.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    districtId = json['_id'];
    name = json['name'];
    countryId = json['countryId'];
    stateId = json['stateId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_id'] = this.districtId;
    data['name'] = this.name;
    data['countryId'] = this.countryId;
    data['stateId'] = this.stateId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

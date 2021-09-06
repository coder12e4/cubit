import 'dart:async';
import 'dart:convert';

import 'package:vfuel/models/auth/user.dart';
import 'package:vfuel/models/response/response.dart';
import 'package:vfuel/networking/api_base_helper.dart';
import 'package:vfuel/networking/endpoints.dart';
import 'package:result_type/result_type.dart';

abstract class ProfileRepository {
  Future<Result> getDitricts();
  Future<Result> fetchUserProfileDetails(String customerId);
  Future<Result> changePassword(String? oldPassword, String? newPassword);
  Future<Result> updateUser(User user);
}

class UserProfileRepository extends ProfileRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  @override
  Future<Result> fetchUserProfileDetails(String customerId) async {
    String responseString = await (_helper.get(
        APIEndPoints.urlString(EndPoints.profile) + customerId,
        isHeaderRequired: true) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }

  @override
  Future<Result> changePassword(
      String? oldPassword, String? newPassword) async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(EndPoints.changePassword),
        {"oldPassword": oldPassword, "newPassword": newPassword},
        isHeaderRequired: true) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }

  @override
  Future<Result> updateUser(User user) async {
    print(user.toJson());
    String responseString = await (_helper.put(
        APIEndPoints.urlString(EndPoints.updateUser), user.toJson(),
        isHeaderRequired: true) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }

  @override
  Future<Result> getDitricts() async {
    String responseString =
        await (_helper.post(APIEndPoints.urlString(EndPoints.districtsList), {})
            as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }
}

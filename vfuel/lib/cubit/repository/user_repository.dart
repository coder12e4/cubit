import 'dart:async';
import 'dart:convert';

import 'package:result_type/result_type.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/models/auth/user.dart';
import 'package:vfuel/models/response/response.dart';
import 'package:vfuel/networking/api_base_helper.dart';
import 'package:vfuel/networking/endpoints.dart';

abstract class RegistrationRepository {
  Future<Result> registerUser(User user);
  Future<Result> getDitricts();
  Future<Result> authenticateUser(String username, String password);
  Future<Result> verifyOTP(String? mobile, String otp);
}

class UserRegistrationRepository extends RegistrationRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  @override
  Future<Result> registerUser(User user) async {
    String responseString = await (_helper.post(
            APIEndPoints.urlString(EndPoints.userRegistration), user.toJson())
        as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      // save user data
      UserManager.instance.setUser(user);
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

  @override
  Future<Result> authenticateUser(String username, String password) async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(EndPoints.login),
        {"email": username, "password": password}) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }

  @override
  Future<Result> verifyOTP(String? mobile, String otp) async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(EndPoints.verifyPhone),
        {"mobile": mobile, "otp": otp}) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }
}

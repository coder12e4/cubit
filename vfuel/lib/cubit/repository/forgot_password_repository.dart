import 'dart:async';
import 'dart:convert';

import 'package:vfuel/models/response/response.dart';
import 'package:vfuel/networking/api_base_helper.dart';
import 'package:vfuel/networking/endpoints.dart';
import 'package:result_type/result_type.dart';

abstract class ForgotPasswordRepository {
  Future<Result> forgotPasswordRequest(String? email);
  Future<Result> passwordVerificationRequest(
      String? email, String? otp, String? password);
}

class UserForgotPasswordRepository extends ForgotPasswordRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  @override
  Future<Result> forgotPasswordRequest(String? email) async {
    String responseString = await (_helper.post(
            APIEndPoints.urlString(EndPoints.forgotPassword), {"email": email})
        as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }

  @override
  Future<Result> passwordVerificationRequest(
      String? email, String? otp, String? password) async {
    String responseString = await (_helper.post(
            APIEndPoints.urlString(EndPoints.forgotPasswordVerify),
            {"email": email, "otp": otp, "password": password})
        as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }
}

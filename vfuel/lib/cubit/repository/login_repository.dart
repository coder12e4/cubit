import 'dart:async';
import 'dart:convert';

import 'package:result_type/result_type.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/models/response/response.dart';
import 'package:vfuel/networking/api_base_helper.dart';
import 'package:vfuel/networking/endpoints.dart';

import 'authentication_repository.dart';

abstract class LoginRepository extends UserAuthenticationRepository {
  Future<Result> authenticateUser(String? username, String? password);
}

class UserLoginRepository extends LoginRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  @override
  Future<Result> authenticateUser(String? username, String? password) async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(EndPoints.login),
        {"email": username, "password": password}) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      String token = response.data["token"];
      saveToken(token);
      UserManager.instance.setUserLoggedIn(true);
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }
}

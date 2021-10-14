import 'dart:async';
import 'dart:convert';

import 'package:cheersclub/Utils/managers/user_manager.dart';
import 'package:cheersclub/cubit/response/response.dart';
import 'package:cheersclub/networking/api_base_helper.dart';
import 'package:cheersclub/networking/endpoints.dart';
import 'package:result_type/result_type.dart';

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
        {"email": username, "password": password}));
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status == 1) {
      String token = response.data["token"];
      saveToken(token);
      UserManager.instance.setUserLoggedIn(true);
      print(response.data);
      return Success(response.data);
    } else {
      print(response.data);
      return Failure(response.message);
    }
  }
}

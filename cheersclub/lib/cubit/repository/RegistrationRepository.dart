import 'dart:async';
import 'dart:convert';

import 'package:cheersclub/cubit/response/response.dart';
import 'package:cheersclub/networking/api_base_helper.dart';
import 'package:cheersclub/networking/endpoints.dart';
import 'package:result_type/result_type.dart';

abstract class RegistrationRepository {
  Future<Result> registerUser(String? username, String? email, int? is_company,
      String? password, String password_confirmation);
}

class UserRegRepository extends RegistrationRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  @override
  Future<Result> registerUser(String? username, String? email, int? is_company,
      String? password, String password_confirmation) async {
    String responseString =
        await (_helper.post(APIEndPoints.urlString(EndPoints.register), {
      "name": username,
      "email": email,
      "is_company": is_company,
      "password": password,
      "password_confirmation": password_confirmation
    }));
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status == 1) {
      // String token = response.data["token"];
      // saveToken(token);
      // UserManager.instance.setUserLoggedIn(true);
      print(response.data);
      return Success(response.data);
    } else {
      print(response.data);
      return Failure(response.message);
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'modellogin.dart';

abstract class Repository {
  Future<ModelClass> login();
  Future<void> logout();
}

class LoginRepo extends Repository {
  @override
  Future<ModelClass> login() async {
    ModelClass? obje_loginModel;
    var webUrl = Uri.parse(
        "https://run.mocky.io/v3/3e5d9878-e6bf-4088-b219-4e4cf9ef7f9e");
    var res = await http.get(webUrl);
    if (res.statusCode == 0) {
      var data = json.decode(res.body);
      obje_loginModel = ModelClass.fromJson(data);
    }

    return obje_loginModel!;
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}

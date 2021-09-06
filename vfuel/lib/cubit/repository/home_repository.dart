import 'dart:async';
import 'dart:convert';

import 'package:result_type/result_type.dart';
import 'package:vfuel/models/response/response.dart';
import 'package:vfuel/networking/api_base_helper.dart';
import 'package:vfuel/networking/endpoints.dart';

abstract class vfuelHomeRepository {
  Future<Result> fetchConfiguration();
  Future<Result> fetchUserProfileDetails(String customerId);
}

class HomeRepository extends vfuelHomeRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  @override
  Future<Result> fetchConfiguration() async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(EndPoints.configuration), {},
        isHeaderRequired: true) as FutureOr<String>);

    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }

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
}

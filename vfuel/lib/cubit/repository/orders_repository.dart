import 'dart:async';
import 'dart:convert';

import 'package:result_type/result_type.dart';
import 'package:vfuel/models/response/response.dart';
import 'package:vfuel/networking/api_base_helper.dart';
import 'package:vfuel/networking/endpoints.dart';

abstract class OrdersRepository {
  Future<Result> getOrders();
  Future<Result> fetchUserProfileDetails(String customerId);
}

class OrdersListRepository extends OrdersRepository {
  ApiBaseHelper _helper = ApiBaseHelper();
  @override
  Future<Result> getOrders() async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(
          EndPoints.orders,
        ),
        {"page": 1, "perPage": 100},
        isHeaderRequired: true) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      print(response.data);
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

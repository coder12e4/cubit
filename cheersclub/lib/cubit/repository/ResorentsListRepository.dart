import 'dart:convert';

import 'package:cheersclub/cubit/response/response.dart';
import 'package:cheersclub/networking/api_base_helper.dart';
import 'package:cheersclub/networking/endpoints.dart';
import 'package:result_type/result_type.dart';

abstract class RestorentListRepository {
  Future<Result> restourentList();
  Future<Result> restourentListFilter(String keyword);
}

class UserResListRepository extends RestorentListRepository {
  ApiBaseHelper _helper = ApiBaseHelper();
  List<dynamic> restourent_lists = [];

  @override
  Future<Result> restourentList() async {
    String responseString = await (_helper.get(
        APIEndPoints.urlString(EndPoints.restaurants),
        isHeaderRequired: true));
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status == 1) {
      restourent_lists = response.data['data'];
      print(response.data);
      return Success(response.data['data']);
    } else {
      print(response.data);
      return Failure(response.message);
    }
  }

  @override
  Future<Result> restourentListFilter(String keyword) async {
    String responseString = await (_helper.get(
        APIEndPoints.urlString(EndPoints.filterRestourents) + keyword,
        isHeaderRequired: true));
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status == 1) {
      restourent_lists = response.data['data'];
      print(response.data);
      return Success(response.data['data']);
    } else {
      print(response.data);
      return Failure(response.message);
    }
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:result_type/result_type.dart';
import 'package:vfuel/models/profile.dart';
import 'package:vfuel/models/response/response.dart';
import 'package:vfuel/networking/api_base_helper.dart';
import 'package:vfuel/networking/endpoints.dart';

abstract class DeliveryAddressRepository {
  Future<Result> getAllAddresses();
  Future<Result> getAddressDetails(String id);
  Future<Result> updateAddress(DeliveryAddress address);
  Future<Result> addNewDeliveryLocation(DeliveryAddress deliveryAddress);
  Future<Result> deleteDeliveryLocation(String addressID);
}

class UserDeliveryLocationRepository extends DeliveryAddressRepository {
  ApiBaseHelper _helper = ApiBaseHelper();
  @override
  Future<Result> addNewDeliveryLocation(DeliveryAddress deliveryAddress) async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(EndPoints.addAddress), deliveryAddress.toJson(),
        isHeaderRequired: true) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }

  Future<Result> editNewDeliveryLocation(
      DeliveryAddress deliveryAddress) async {
    String responseString = await (_helper.put(
        APIEndPoints.urlString(EndPoints.addAddress), deliveryAddress.toJson(),
        isHeaderRequired: true) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }

  @override
  Future<Result> deleteDeliveryLocation(String? addressID) async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(EndPoints.deleteAddress), {"id": addressID},
        isHeaderRequired: true) as FutureOr<String>);

    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure("Failed");
    }
  }

  @override
  Future<Result> getAddressDetails(String id) async {
    String responseString = await (_helper
            .get(APIEndPoints.urlString(EndPoints.fetchAddresses) + id)
        as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }

  @override
  Future<Result> getAllAddresses() async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(EndPoints.fetchAddresses), {},
        isHeaderRequired: true) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }

  @override
  Future<Result> updateAddress(DeliveryAddress address) async {
    String responseString = await (_helper.put(
        APIEndPoints.urlString(EndPoints.updateAddresses),
        address.toString()) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:vfuel/models/profile.dart';
import 'package:vfuel/models/response/response.dart';
import 'package:vfuel/networking/api_base_helper.dart';
import 'package:vfuel/networking/endpoints.dart';
import 'package:result_type/result_type.dart';

abstract class OrderRepository {
  Future<Result> addOrder(DeliveryAddress address, String date, String id,
      double qty, bool reorder, String reorderId);
}

class OrderCreateRepository extends OrderRepository {
  ApiBaseHelper _helper = ApiBaseHelper();
  @override
  Future<Result> addOrder(DeliveryAddress? address, String? date, String? id,
      double? qty, bool reorder, String? reorderId) async {
    String responseString = await (_helper.post(
        APIEndPoints.urlString(
          EndPoints.order,
        ),
        reorder
            ? {
                "products": [
                  {"id": "60c4ee6e8ec4c50317497c00", "quantity": qty}
                ],
                "reOrder": true,
                "reOrderId": reorderId,
                "date": date,
                "deliveryLocation": {
                  "id": address!.id,
                  "name": address.name,
                  "address": address.address,
                  "area": address.area,
                  "lat": address.lat,
                  "lng": address.lng,
                  "landMark": address.landMark,
                  "city": address.city,
                  "district": address.district,
                  "state": address.state,
                  "phone": address.phone
                }
              }
            : {
                "products": [
                  {"id": "60c4ee6e8ec4c50317497c00", "quantity": qty}
                ],
                "date": date,
                "deliveryLocation": {
                  "id": address!.id,
                  "name": address.name,
                  "address": address.address,
                  "area": address.area,
                  "lat": address.lat,
                  "lng": address.lng,
                  "landMark": address.landMark,
                  "city": address.city,
                  "district": address.district,
                  "state": address.state,
                  "phone": address.phone
                }
              },
        isHeaderRequired: true) as FutureOr<String>);
    Response response = Response.fromJson(json.decode(responseString));
    if (response.status!) {
      print(response.data);
      return Success(response.data);
    } else {
      return Failure(response.message);
    }
  }
}

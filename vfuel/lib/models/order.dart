import 'package:vfuel/models/profile.dart';

class OrderData {
  String? orderId;
  String? reorderId;
  int? ordereQty;
  String orderEtd;
  String? ordereBy;
  String? deliveryPoint;
  String fuelType;
  DateTime deliveryDate;
  String total;
  DeliveryAddress? deliveryAddress;
  OrderData({
    required this.deliveryDate,
    required this.deliveryPoint,
    required this.fuelType,
    required this.orderEtd,
    required this.orderId,
    required this.reorderId,
    required this.ordereBy,
    required this.ordereQty,
    required this.total,
    this.deliveryAddress,
  });
}

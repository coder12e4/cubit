import 'package:vfuel/models/order.dart';
import 'package:vfuel/models/profile.dart';

List<OrderData> ordersList(List data, String stats) {
  List<OrderData> _orders = [];
  var length = data.length;
  print(length.toString());
  for (int i = 0; i < length; i++) {
    DateTime date = DateTime.parse(data[i]["date"]);
    String? status = data[i]["status"];
    String? id = data[i]["id"];
    print(status);
    print(id);
    if (status == stats) {
      print(i);
      OrderData order = OrderData(
        deliveryDate: date,
        deliveryPoint: data[i]["deliveryLocation"]["name"],
        fuelType: 'Diesel',
        orderEtd: '',
        orderId: id,
        ordereBy: data[i]["customerName"],
        ordereQty: data[i]["products"][0]["quantity"],
        total: data[i]["products"][0]["totalPrice"] != null
            ? data[i]["products"][0]["totalPrice"].toString()
            : '',
        reorderId: data[i]["_id"],
        deliveryAddress: DeliveryAddress(
            address: data[i]["deliveryLocation"]["address"],
            name: data[i]["deliveryLocation"]["name"],
            id: data[i]["deliveryLocation"]["id"],
            area: data[i]["deliveryLocation"]["area"],
            lat: data[i]["deliveryLocation"]["lat"],
            lng: data[i]["deliveryLocation"]["lng"],
            landMark: data[i]["deliveryLocation"]["landMark"],
            city: data[i]["deliveryLocation"]["city"],
            district: data[i]["deliveryLocation"]["district"],
            state: data[i]["deliveryLocation"]["state"],
            phone: data[i]["deliveryLocation"]["phone"]),
      );
      _orders.add(order);
    }
  }
  return _orders;
}

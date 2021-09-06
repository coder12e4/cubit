enum EndPoints {
  userRegistration,
  login,
  forgotPassword,
  forgotPasswordVerify,
  customerList,
  districtsList,
  configuration,
  verifyPhone,
  profile,
  addAddress,
  deleteAddress,
  changePassword,
  fetchAddresses,
  updateAddresses,
  getAddress,
  order,
  orders,
  updateUser
}

class APIEndPoints {
  static String baseUrl = "http://65.0.114.99/api/v1/";

  static String urlString(EndPoints endPoint) {
    return baseUrl + endPoint.endPointString;
  }
}

extension EndPointsExtension on EndPoints {
  // ignore: missing_return
  String get endPointString {
    switch (this) {
      case EndPoints.userRegistration:
        return "customer/customer";
      case EndPoints.login:
        return "auth/customer/login";
      case EndPoints.forgotPassword:
        return "auth/customer/forget-password/request";
      case EndPoints.forgotPasswordVerify:
        return "auth/customer/forget-password/verify";
      case EndPoints.customerList:
        return "admin/customers";
      case EndPoints.districtsList:
        return 'customer/districts';
      case EndPoints.configuration:
        return 'customer/config';
      case EndPoints.verifyPhone:
        return "customer/verify-phone";
      case EndPoints.profile:
        return "customer/customer?id=";
      case EndPoints.addAddress:
        return "customer/address";
      case EndPoints.deleteAddress:
        return "customer/delete-address";
      case EndPoints.changePassword:
        return "auth/customer/change-password";
      case EndPoints.fetchAddresses:
        return "customer/addresses";
      case EndPoints.updateAddresses:
        return "customer/address";
      case EndPoints.getAddress:
        return "customer/address?id=";
      case EndPoints.order:
        return "customer/order";
      case EndPoints.orders:
        return "customer/orders";
      case EndPoints.updateUser:
        return "customer/customer";
    }
  }
}

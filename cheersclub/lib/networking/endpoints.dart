enum EndPoints { login, logout, myprofile, restaurants, register }

class APIEndPoints {
  static String baseUrl = "https://www.cheerzclub.com/api/v1/user/";

  static String urlString(EndPoints endPoint) {
    return baseUrl + endPoint.endPointString;
  }
}

extension EndPointsExtension on EndPoints {
  // ignore: missing_return
  String get endPointString {
    switch (this) {
      case EndPoints.login:
        return "auth/login";
      case EndPoints.logout:
        return "auth/logout";
      case EndPoints.myprofile:
        return "myprofile";
      case EndPoints.restaurants:
        return "restaurant/index";
      case EndPoints.register:
        return "register";
    }
  }
}

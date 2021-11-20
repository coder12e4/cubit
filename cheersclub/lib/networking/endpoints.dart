enum EndPoints {
  login,
  logout,
  myprofile,
  restaurants,
  register,
  ChangePassword,
  myGreetings,
  myOrders,
  SingleRest,
  addtocart,
  viewproducts,
  viewMyKart,
  filterRestourents,
  forgetPass,
  remoeveitemfromcart
}

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
      case EndPoints.ChangePassword:
        return "change-password";
      case EndPoints.myGreetings:
        return "my-greetings";
      case EndPoints.myOrders:
        return "my-orders";

      case EndPoints.SingleRest:
        return "restaurant";

      case EndPoints.addtocart:
        return "restaurant/add-to-cart";
      case EndPoints.viewproducts:
        return "restaurant/view-products";
      case EndPoints.viewMyKart:
        return "restaurant/cart/";

      case EndPoints.filterRestourents:
        return "restaurant/index?keyword=";

      case EndPoints.forgetPass:
        return "forgot-password";
      case EndPoints.remoeveitemfromcart:
        return "restaurant/remove-from-cart";
    }
  }
}

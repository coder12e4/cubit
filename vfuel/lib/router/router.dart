import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vfuel/pages/ProfileScreen.dart';
import 'package:vfuel/pages/authentication/login/forgot_passsword_verify.dart';
import 'package:vfuel/pages/authentication/login/forgot_password.dart';
import 'package:vfuel/pages/authentication/login/login_screen.dart';
import 'package:vfuel/pages/authentication/login/verify_otp_screen.dart';
import 'package:vfuel/pages/authentication/registration/create_account.dart';
import 'package:vfuel/pages/contact_us.dart';
import 'package:vfuel/pages/delivery_location_listing.dart';
import 'package:vfuel/pages/delivery_location_selection.dart';
import 'package:vfuel/pages/home/HomeScreen.dart';
import 'package:vfuel/pages/orders/order_track.dart';
import 'package:vfuel/pages/orders/orders_screen.dart';

class vfuelRouter {
  static navigateTo(BuildContext context, Screen screen) async {
    bool rootWidget = false;
    Widget? destination;
    switch (screen) {
      case Screen.Login:
        destination = LoginScreen();
        rootWidget = true;
        break;
      case Screen.Home:
        destination = HomeScreen();
        rootWidget = true;
        break;
      case Screen.Registration:
        destination = CreateAccountScreen();
        break;
      case Screen.VeifyOTP:
        destination = VerifyOTP();
        break;
      case Screen.ForgotPassword:
        destination = ForgotPassword();
        break;
      case Screen.PasswordVerification:
        destination = PasswordVerification();
        break;
      case Screen.ProfileScreen:
        destination = ProfileScreen();
        break;
      case Screen.DeliveryLocationsList:
        destination = DeliveryLocationList();
        break;
      case Screen.DeliveryLocationsSelector:
        destination = DeliveryLocationSelector(
          isEdit: false,
        );
        break;
      case Screen.ContactUS:
        destination = ContactUs();
        break;
      case Screen.Orders:
        destination = OrdetScreen();
        break;
      case Screen.OrderTracking:
        destination = OrderTracking();
        break;
    }

    navigateToWidget(context, rootWidget, destination);
  }

  static void navigateToWidget(
      BuildContext context, bool root, Widget? widget) {
    if (root) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => widget!,
          ),
          ModalRoute.withName('/'));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget!,
          ));
    }
  }

  static Future<void> launchurl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    }
  }
}

enum Screen {
  Login,
  Registration,
  VeifyOTP,
  Home,
  ForgotPassword,
  PasswordVerification,
  ProfileScreen,
  DeliveryLocationsList,
  DeliveryLocationsSelector,
  ContactUS,
  Orders,
  OrderTracking
}

extension EnumParser on String {
  Screen? toScreen() {
    return Screen.values.firstWhereOrNull((e) =>
        e.toString().toLowerCase() ==
        'screen.$this'.toLowerCase()); //return null if not found
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vfuel/cubit/auth/auth_cubit.dart';
import 'package:vfuel/cubit/repository/authentication_repository.dart';

import 'authentication/login/login_screen.dart';
import 'home/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 3;
  late AuthenticationCubit authCubit;

  @override
  void initState() {
    super.initState();
    authCubit = AuthenticationCubit(
        AuthenticationIntial(), UserAuthenticationRepository());
    Timer(Duration(seconds: 3), () {
      authCubit.getAuthenticationState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => authCubit,
          child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
            if (state is Authenticated) {
              return HomeScreen();
            } else if (state is UnAuthenticated) {
              return LoginScreen();
            } else {
              return splash();
            }
          })),
    );
  }

  Widget splash() {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 100.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: new Image.asset(
            "assets/images/logo_icon.png",
            width: 150,
            height: 150,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}

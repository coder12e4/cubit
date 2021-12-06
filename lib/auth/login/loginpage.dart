import 'package:cubit/auth/login/repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_cubit.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  late LoginCubit logincubit;

  String? name;
  String? image;
  String? phoneno;

  @override
  void initState() {
    logincubit = LoginCubit(LoginRepo());
    logincubit.api_calls();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => logincubit,
          child: BlocListener<LoginCubit, LoginState>(
            bloc: logincubit,
            listener: (context, state) {
              if (state is LoginLoding) {
                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");

                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");

                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");
                print("loading");
              }
              if (state is LoginSuccess) {
                name = state.name;
                image = state.image;
                phoneno = state.phoneno;

                /*
                Fluttertoast.showToast(
                    msg: "A Password resetset link sent to your mail",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);

                Navigator.push(
                  context,
                  PageTransition(
                      duration: Duration(milliseconds: 1000),
                      type: PageTransitionType.rightToLeft,
                      child: LoginScreen(),
                      inheritTheme: true,
                      ctx: context),
                );
      */

              } else if (state is LoginFail) {
                print("login fail");
              }
            },
            child:
                BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
              if (state is LoginLoding) {
                return Container(
                  child: Center(
                    child: Text("Loding"),
                  ),
                );
              } else if (state is LoginSuccess) {
                return Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("name :" + name!),
                    Text("phone :" + phoneno!),
                  ],
                ));
              } else if (state is LoginFail) {
                return Container(
                  child: Center(
                    child: Text("fail"),
                  ),
                );
              } else {
                return Container(
                    //                             color: Colors.white,
                    );
              }
            }),
          )),
    );
  }
}

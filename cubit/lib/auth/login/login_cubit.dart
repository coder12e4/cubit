import 'package:bloc/bloc.dart';
import 'package:cubit/auth/login/repo.dart';
import 'package:meta/meta.dart';

import 'modellogin.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
      //two parameters are needed here
      //1 state
      //2 repo
      LoginState state,
      this.obj_repository)
      : super(LoginInitial());

  final LoginRepo obj_repository;

  //api calls and functions

  ModelClass? logindata;
  String? name;
  String? image;
  String? phoneno;
  Future<void> api_calls() async {
    emit(LoginLoding());
    try {
      logindata = await obj_repository.login();
      name = logindata!.username!;
      image = logindata!.image!;
      phoneno = logindata!.phone!;
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFail());
    }
  }
}

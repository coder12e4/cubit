import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:result_type/result_type.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/cubit/repository/login_repository.dart';
import 'package:vfuel/models/auth/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(LoginIntial());
  final LoginRepository loginRepository;

  Future<void> authenticateUser(String? username, String? password) async {
    emit(LoginLoading());
    Result result = await loginRepository.authenticateUser(username, password);

    if (result.isSuccess) {
      UserSession userSession = UserSession.fromJson(result.success);
      UserManager.instance.setUserSession(userSession);
      emit(LoginSuccessfull(userSession));
    } else {
      emit(LoginFailed(result.failure));
    }
  }
}

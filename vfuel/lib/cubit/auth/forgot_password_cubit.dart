import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:result_type/result_type.dart';
import 'package:vfuel/Utils/validators.dart';
import 'package:vfuel/cubit/repository/forgot_password_repository.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.forgotPasswordRepository)
      : super(ForgotPasswordIntial());
  final ForgotPasswordRepository forgotPasswordRepository;

  Future<void> forgotPasswordRequest(String? email) async {
    emit(ForgotPasswordLoading());
    Result result = await forgotPasswordRepository.forgotPasswordRequest(email);
    if (result.isSuccess) {
      if (vfuelValidators.isValidEmail(email!)) {
        emit(ForgotPassworRequestdSuccessfullyWithEmail(
            "A Reset Password link has been sent to your mail ID."));
      } else {
        emit(ForgotPassworRequestdSuccessfull(result.success.toString()));
      }
    } else {
      emit(ForgotPassworRequestFailed(result.failure));
    }
  }

  Future<void> passwordVerificationRequest(
      String? userName, String? otp, String? password) async {
    emit(ForgotPasswordVerificationLoading());
    Result result = await forgotPasswordRepository.passwordVerificationRequest(
        userName, otp, password);
    if (result.isSuccess) {
      emit(ForgotPasswordVerificationSuccessfull(result.success.toString()));
    } else {
      emit(ForgotPasswordVerificationFailed(result.failure));
    }
  }
}
